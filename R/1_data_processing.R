###–––––––––––––––––––––––––––––––––––––––––––––––––###
# Purpose: Loading and cleaning Google Sheet Data
###–––––––––––––––––––––––––––––––––––––––––––––––––###

# Load packages
	pacman::p_load(tidyverse, googlesheets4, janitor, here)

# Load data from Google Sheets
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



