###–––––––––––––––––––––––––––––––––––––––––––––––––###
# Purpose: Loading and cleaning Google Sheet Data
###–––––––––––––––––––––––––––––––––––––––––––––––––###
###-------------------------###
# Load packages
###-------------------------###
	pacman::p_load(tidyverse, googlesheets4, janitor, here)

###-------------------------###
# Load data from Google Sheets 
# and save raw files
###-------------------------###
	# Delegate list

	# Simplify a few names to avoid issues down the road
	replace <- c("Stefan J.G. Vriend" = "Stefan Vriend", "Matt Grainger" = "Matthew Grainger", "Gideon Gywa Deme" = "Gideon Deme", "Magdalena M. Mair" = "Magdalena Mair", "Malgorzata Lagisz" = "Losia Lagisz")
	
	delegates <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Delegate Details")  %>%  clean_names()  %>% mutate(extractor_full_name = paste0(firstname, " ", lastname))  %>% mutate(extractor_full_name = str_replace_all(extractor_full_name, replace))  %>% data.frame() 

	# Check on who attended the hackathon
	delegates  %>% tabyl("attended_hackathon_yes_no")
	
	# Export emails
	write.csv(delegates$email, "output/emails/delegates_emails.csv", row.names = FALSE)

	# Master preprint list 
	master_list <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Master List of Preprints")  %>% clean_names()

	# Export master list
	write.csv(master_list, "data/master_list.csv", row.names = FALSE)

	# Check on status
	status <- master_list  %>% rename("completed" = "completed_yes_no_extractor") %>%
			mutate(completed = str_to_title(completed))  %>% tabyl(completed)

	# Check allocation of papers
		contr_extract <- master_list  %>%  tabyl(extractor_full_name)

	# Check how many each person has done relative to their total
		contr_extract2 <- master_list %>% group_by(extractor_full_name) %>% summarise(n = n(), yes = sum(completed_yes_no_extractor == "Yes"), no = sum(completed_yes_no_extractor == "No"), prop = yes/n)  %>% data.frame()  %>% arrange(n)

	# Export final list of thos who extracted. 
		write.csv(contr_extract2, file = here("data", "final_extractors.csv"))

	# Check who hasn't yet started
		not_done <- contr_extract2  %>% filter(prop != 1)
	
	# Grab emails of those not yet done so they can be emailed to be reminded
		not_done_emails <- left_join(not_done, delegates, by = "extractor_full_name")  %>% select(extractor_full_name, n, yes,no,prop, email) 

	# Join together delegate list with master list
		data_checking <- full_join(delegates, contr_extract2, by = "extractor_full_name", multiple = "all")  %>% arrange(extractor_full_name) %>% data.frame()  %>% replace(is.na(.), 0)  %>% arrange(n)  %>% mutate(prop_total = n / sum(n))

	# Export list for data checking including those who couldn't do extarctions but are on delegate list
		write.csv(data_checking, file = here("data", "data_checking.csv"))
		
	# Write this sheet
		write.csv(not_done_emails, file = here("output", "emails", "not_done_emails.csv"))

	# raw data, # Problem with the data link article. Some reason it's created it as a list and NULLs are a problem so this needs fixing so that it's a single column not a list within a dataframe
		data <- read_sheet("https://docs.google.com/spreadsheets/d/1032gLryvtCNJ7eJjKBjrn7txxDRUGql9SoIG18QnFrQ/edit?resourcekey#gid=1062856014") %>% clean_names()  %>% data.frame()   %>% mutate(data_link_article = plyr::ldply(lapply(data_link_article, function(x) ifelse(is.null(x), "NULL", x)))[,1])

	# Write the raw data
		write.csv(data, file = here("data", "raw_data.csv"))

###-------------------------###
# Processing and fixing mistakes
# in raw data
###-------------------------###

# List of to DO
# - [x] Check that the preprint DOI's are correct and that we have expected number
# - [x] Determine which preprints are missing and collect the data for these
# - [x] Filter out the training paper data (aside from one paper for inclusion in the data)
# - [x] check all pilot data has been removed

# Have a look at how many preprint DOI's there should be 1216 unique ones
		data  %>% select(preprint_doi)  %>% distinct()  %>% nrow() #1218....some duplicates clearly

# Which preprint DOI's are in the master list but are not found in the data?
		missing <- master_list  %>% filter(!preprint_doi %in% data$preprint_doi)  %>% select(preprint_doi)  %>% distinct()  %>% data.frame()
		
# Find out which preprints were missing, merge missing and masterlist to identify who
		missed <- left_join(missing, master_list, by = "preprint_doi", suffix = c("_missing", "_master"))  %>% data.frame()
		#write.csv(missed, file = here("data", "missing_preprints.csv"))

# Lets assume maybe that the wrong DOI was entered in, so lets tally the same DOIs
		doi_tally <- data  %>% group_by(preprint_doi) %>% summarise(n = n())  %>% 
					filter(n>1)  %>% data.frame()

# We first need to filter out all the pilot runs from Losia and the hackathon.
	# Remove losia's test runs
		data <- data  %>% filter(!c(extractors_first_name == "Losia" & extractors_last_name == "Lagisz" & timestamp < "2023-10-17"))  %>% data.frame()

	# Remove the training paper, but save a training data as that can be used to check for consistency
		data2 <- data  %>% filter(!c(submitting_corresponding_author_last_name == "Nakagawa" & preprint_doi %in% c("https://doi.org/10.24072/pcjournal.261", "https://doi.org/10.32942/X2H59D")))  %>% data.frame()
		
		training_data <- data  %>% 
						filter(c(submitting_corresponding_author_last_name == "Nakagawa" & preprint_doi %in% c("https://doi.org/10.24072/pcjournal.261", "https://doi.org/10.32942/X2H59D")))  %>% 
						data.frame()
		
		# Add back in one extraction from the training paper so we have it in the final data
		data2 <- rbind(data2, training_data[training_data$extractors_last_name == "Noble",])  %>% data.frame()

		# Check where duplicates are?
		dups <- data2  %>% group_by(preprint_doi) %>% summarise(n = n())  %>% filter(n>1)  %>% data.frame()

		# Ok, looks like only one duplicate, so lets have a look at the two rows
		data2_dups <- data2  %>% filter(preprint_doi == dups$preprint_doi)  %>% data.frame()

		# Looks like someone extracted one of mine twice, so lets remove the later one
		data2 <- data2  %>% filter(!c(extractors_last_name == "Dimri" & preprint_doi == dups$preprint_doi))

		# Now lets see why we have more preprints than 1216. This is probably because of incorrect DOI's. Check which ones are NOT in teh masterlist
		doubles <- data2  %>% filter(!preprint_doi %in% master_list$preprint_doi)  %>% data.frame()

		# OK, this makes sense as these are all errors in DOI entry. We'll remove these
		data2 <- data2  %>% filter(preprint_doi %in% master_list$preprint_doi)  %>% data.frame()

# Merge together the masterlist information with the data
		data2 <- left_join(data2, master_list, by = "preprint_doi", suffix = c("_data", "_master"))  %>% data.frame()

# Number of preprints now matches and we have 1216 unique preprints. Lets write this file out before doing some cleaning
		write.csv(data2, file = here("data", "full_data.csv"))

###-------------------------###
# Cleaning and fixing mistakes
# in raw data
###-------------------------###
		# Load in the data
		data2 <- read.csv(here("data", "full_data.csv")) 

# Make sure all data is in the same case structure and strip any white space
		data2 <- data2  %>% mutate(across(where(is.character), str_to_lower))  %>% mutate(across(where(is.character), str_trim)) 

# Above shoudl solve quite a few issues, now we can explore the data.
	## Countries - As expected, huge number of problems here to deal with
		countries <- data2  %>% group_by(submitting_author_country) %>% summarise(n = n())  %>% arrange(desc(n)) 

		# Lets clean this up a bit. remove all instances of "(the)"
		usa <- c("usa", "united states of america (the)", "us", "unites states of america", "united states", "840") 
		uk <- c("uk", "united kingdom", "united kingdom of great britain and northern ireland (the)", "united kingdom of great britain and northern ireland", "short name lower case united kingdom of great britain and northern ireland (the)", "the united united kingdom of great britain and northern ireland (the)", "united kingdom of great britain", "united kingdom of great britain and northern ireland (the", "united kingdom of great britain and northern irland (the)", "united kingdom of great britain", "united kingdom (the)", "826") 
		can <- c("ca", "124")
		phili <- c("philippines (the)")
		brazil <- c("brazil iso 3166-2:br", "brasil", "076")
		netherlands <- c("netherlands (kingdom of the)", "netherlands, kingdom of the", "netherlands (the)", "nl")
		australia <- c("au", "036")
		czechia <- c("cz", "203", "the czech republic")
		finland <- c("finland (the)", "the republic of finland", "246")
		germany <- c("de")
		belgium <- c("be", "056")
		argintina <- c("ar", "032")
		israel <- c("il", "376")
		new_zealand <- c("nz", "554")
		poland <- c("pl", "616")
		sweden <- c("se", "752")
		switzerland <- c("ch", "756")
		ukraine <- c("ua", "804")
		hungary <- c("hu", "348")
		korea <- c("kr", "410", "korea (the republic of)")
		chile <- c("cl", "152", "the republic of chile")

		data2 <- data2  %>% 
				mutate(submitting_author_country = ifelse(submitting_author_country %in% usa, "united states of america", submitting_author_country),
				       submitting_author_country = ifelse(submitting_author_country %in% uk, "united kingdom", submitting_author_country),
				       submitting_author_country = ifelse(submitting_author_country %in% can, "canada", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% phili, "philippines", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% brazil, "brazil", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% netherlands, "netherlands", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% australia, "australia", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% czechia, "czechia", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% finland, "finland", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% germany, "germany", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% belgium, "belgium", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% argintina, "argentina", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% israel, "israel", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% new_zealand, "new zealand", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% poland, "poland", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% sweden, "sweden", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% switzerland, "switzerland", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% ukraine, "ukraine", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% hungary, "hungary", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% korea, "korea", submitting_author_country),
					   submitting_author_country = ifelse(submitting_author_country %in% chile, "chile", submitting_author_country)) 
	# Check fixes. Look good aside from missing countries?! (NA) Need to check
		countries <- data2  %>% group_by(submitting_author_country) %>% summarise(n = n())  %>% arrange(desc(submitting_author_country))  %>% data.frame()