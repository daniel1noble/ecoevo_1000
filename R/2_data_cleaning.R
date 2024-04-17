
###-------------------------###
# Cleaning and fixing mistakes
# in raw data
###-------------------------###
###-------------------------###
# Load packages
###-------------------------###
	pacman::p_load(tidyverse, googlesheets4, janitor, here, readxl, writexl)

# Load in the data
		data2 <- read_csv(here("data", "full_data.csv")) 

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

# We'll check out journals now
		journals <- data2  %>% group_by(publication_journal) %>% summarise(n = n())  %>% arrange(desc(publication_journal))  %>% data.frame()

# Resolve some obvious duplicates names and spelling errors in names. I think we are going to need to do an actual check of book sna dbook chapters, but we could sort this out coding wise too in the last line. There is a numeric vaue "1". No clue why that is there. Still a bnch of books here though that needs fixing

data2 <- data2  %>% 	
  mutate(publication_journal= ifelse(publication_journal == "trends in ecology & evolution", "trends in ecology and evolution", publication_journal),
		   publication_journal= ifelse(publication_journal == "royal society open science 2022/9/7", "royal society open science", publication_journal), 
		   publication_journal= ifelse(publication_journal %in% c("proceedings of the royal societies b / biological sciences", "proceedings of the royal society b"), "proceedings of the royal society b: biological sciences", publication_journal),
		   publication_journal= ifelse(publication_journal %in% c("pnas nexus", "pnas", "proceedings of the national academy of sciences"), "proceedings of the national academy of sciences of the united states of america", publication_journal),
		   publication_journal= ifelse(publication_journal == "plants people planet", "plants, people, planet", publication_journal),
		   publication_journal= ifelse(publication_journal %in% c("philosophical transactions of the royal society b", "philosophical transactions of the royal society", "philosophical transactions", "philosophical transaction of the royal society b", "philosophical transaction b", "phil.  trans.  r.  soc.  b"), "philosophical transactions of the royal society b: biological sciences", publication_journal),
		   publication_journal= ifelse(publication_journal == "peerj - life & environment", "peerj life and environment", publication_journal),
		   publication_journal= ifelse(publication_journal == "nature ecology & evolution", "nature ecology and evolution", publication_journal),
		   publication_journal= ifelse(publication_journal == "methods in ecology & evolution", "methods in ecology and evolution", publication_journal),
		   publication_journal= ifelse(publication_journal == "limnology & oceanography", "limnology and oceanography", publication_journal),
		   publication_journal= ifelse(publication_journal == "journal of evolutionary biolog", "journal of evolutionary biology", publication_journal),
		   publication_journal= ifelse(publication_journal == "biological review", "biological reviews", publication_journal),
		   publication_journal= ifelse(publication_journal == "aobplants", "aob plants", publication_journal),
		   publication_journal= ifelse(publication_journal == "na", NA, publication_journal),
		   publication_journal= ifelse(publication_journal == "https://doi.org/10.1126/scisignal.aar2668", "science signaling", publication_journal),
		   publication_journal= ifelse(publication_journal == "elements of paleontology (cambridge university press)", "elements of paleontology", publication_journal),
		   publication_journal= ifelse(publication_journal == "quatic conservation: marine and freshwater ecosystems", "aquatic conservation: marine and freshwater ecosystems", publication_journal),
		   publication_journal= ifelse(type_of_preprint == "book chapter", "book chapter", publication_journal))
		
## Let's also so some reordering (and dropping) of columns as we have merged things.

data2 <- data2  %>% select(extractors_first_name, extractors_last_name, preprint_id, preprint_doi, preprint_title, submitting_author, submitting_author_country, submitting_author_first_publication_year, type_of_preprint, taxa_being_studied, data_link_preprint, code_link_preprint, number_of_citations_preprint, pci_recommendation_preprint, publication_doi, publication_journal, publication_date, publication_title_changed, number_of_citations_article, data_link_article, code_link_article)

# Need to load in the larger data file to get the dates and version numbers to merge with these data
		data3 <- read_excel(here("data", "20231003_EER_preprints_metadata.xlsx"))  %>% clean_names()

	# Subset the relevant rows
		data3  <- data3  %>%  select(preprint_doi, publisher_doi, published_date, current_version, total_authors)  %>% rename("preprint_published_date" = "published_date" )

# Join together and create time between preprint and pub
	data2 <- left_join(data2, data3, by = c("preprint_id" = "preprint_id")) 

# Fix one typo un the publication date
     data2$publication_date <- gsub("202-03-09", "2020-03-09", data2$publication_date) 
#ymd(data2$publication_date) #test parsing

#Calculate the time between dates. Note that there are clearly a bunch of postprints, some even quite older published (hence negative days). 
	data2  <-  data2  %>% mutate(time_between_preprint_and_pub_days = ymd(publication_date) - ymd(preprint_published_date))

	#table(is.na(ymd(data2$publication_date))) #one fails here
	#min((data2$publication_date), na.rm = TRUE) #"0202-03-09" - fix above (stored as "202-03-09")
	#which(is.na(ymd(data2$preprint_published_date))) #all ok
	
# probably worth flagging postprints. This could then also be checked.
	data2 <- data2  %>% mutate(postprint = ifelse(time_between_preprint_and_pub_days <= 0, "postprint", "preprint"),
							   postprint = ifelse(is.na(time_between_preprint_and_pub_days), "preprint", postprint))


# Lets get the updates list of preprints done by various people. Not spelling errors in people names that need fixing
	
replace = c("Antica Culina" = "Antica Culin", "Matt Grainger" = "Matthew Grainger",  "Melina de Souza leite" = "Melina de Souza Leite")
contr_extract <- data2  %>% mutate(extractor_full_name = paste0(extractors_first_name, " ", extractors_last_name),
	                                   extractor_full_name = str_replace_all(extractor_full_name, replace))  %>%  tabyl(extractor_full_name)  %>%  arrange(desc(n)) 
	
	
#write.csv(data2, here("data", "data2_processed_check.csv"))


## More cleaning:

# Make simple tables and clean where needed:

# Extractors names
table(paste(data2$extractors_first_name, data2$extractors_last_name, sep = " "), useNA = "always")
data2 <- data2  %>% 
  mutate(extractors_first_name = ifelse(extractors_last_name == "grainger", "matthew", extractors_first_name),
         extractors_last_name = ifelse(extractors_last_name == "culin", "culina", extractors_last_name)
  )

# submitting_author_first_publication_year
table(data2$submitting_author_first_publication_year, useNA = "always")
data2$submitting_author_first_publication_year[data2$submitting_author_first_publication_year == 0] <- NA #replace all 0 with NA
data2$submitting_author_first_publication_year[data2$submitting_author_first_publication_year == 999] <- NA #replace all 999 with NA
data2$submitting_author_first_publication_year[data2$submitting_author_first_publication_year == 253] <- NA #replace all 253 with NA
data2$submitting_author_first_publication_year[data2$submitting_author_first_publication_year == 1938] <- 1976 #replace 1938 with 1976

table(data2$publication_title_changed, useNA = "always") #ok

table(data2$pci_recommendation_preprint, useNA = "always") #ok

table(data2$number_of_citations_preprint, useNA = "always")
data2$number_of_citations_preprint[data2$number_of_citations_preprint == 999] <- NA #replace all 999 with NA
data2$number_of_citations_preprint[data2$number_of_citations_preprint == 9999] <- NA #replace all 999 with NA

table(data2$number_of_citations_article, useNA = "always")
data2$number_of_citations_article[data2$number_of_citations_article == 999] <- NA #replace all 999 with NA
data2$number_of_citations_article[data2$number_of_citations_article == 9999] <- NA #replace all 999 with NA

# Check and clean type_of_preprint
#split into columns based on string matching: 
#Research Article (new empirical work), Book, Book chapter, Report, Comment, Opinion, Reviews and Meta-analyses, Methods paper, Other
#View(table(data2$type_of_preprint, useNA = "always"))

data4 <- data2 
data4 <- data4 %>% mutate(type_of_preprint = case_when(str_detect(type_of_preprint, "article") == TRUE ~ "research article",
                                                    str_detect(type_of_preprint, "study") == TRUE ~ "research article",
                                                    str_detect(type_of_preprint, "simulation") == TRUE ~ "research article",
                                                    str_detect(type_of_preprint, "reviews and meta-analyses") == TRUE ~ "reviews and meta-analyses",
                                                    str_detect(type_of_preprint, "review") == TRUE ~ "reviews and meta-analyses",
                                                    str_detect(type_of_preprint, "method") == TRUE ~ "methods papers",
                                                    str_detect(type_of_preprint, "report") == TRUE ~ "report",
                                                    str_detect(type_of_preprint, "synthesis") == TRUE ~ "reviews and meta-analyses",
                                                    str_detect(type_of_preprint, "book chapter") == TRUE ~ "book chapter",
                                                    type_of_preprint == "book" ~ "book",
                                                    str_detect(type_of_preprint, "comment") == TRUE ~ "comment",
                                                    str_detect(type_of_preprint, "opinion") == TRUE ~ "opinion",
                                                    str_detect(type_of_preprint, "overview") == TRUE ~ "reviews and meta-analyses",
                                                    str_detect(type_of_preprint, "concept") == TRUE ~ "reviews and meta-analyses",
                                                    .default = "other") )
#table(data4$type_of_preprint, useNA = "always")

# Check and clean taxa_being_studied

#split into columns based on string matching: 
#Plants, Algi, Fungi, Microorganisms, Invertebrates, Vertebrates, Other
#View(table(data2$taxa_being_studied, useNA = "always"))

data4 <- data4 %>% mutate(plants = ifelse(str_detect(taxa_being_studied, "plant") == TRUE,  1, 0), 
                          plants = ifelse(is.na(taxa_being_studied) == TRUE,  0, plants))
table(data4$plants, useNA = "always")
                                                       
data4 <- data4 %>% mutate(algi = ifelse(str_detect(taxa_being_studied, "algi") == TRUE,  1, 0), 
                          algi = ifelse(is.na(taxa_being_studied) == TRUE,  0, algi))
table(data4$algi, useNA = "always")

data4 <- data4 %>% mutate(fungi = ifelse(str_detect(taxa_being_studied, "fungi") == TRUE,  1, 0), 
                          fungi = ifelse(is.na(taxa_being_studied) == TRUE,  0, fungi))
table(data4$fungi, useNA = "always")

data4 <- data4 %>% mutate(microorganisms = ifelse(str_detect(taxa_being_studied, "microorganisms") == TRUE,  1, 0), 
                          microorganisms = ifelse(is.na(taxa_being_studied) == TRUE,  0, microorganisms))
table(data4$microorganisms, useNA = "always")

data4 <- data4 %>% mutate(invertebrates = ifelse(str_detect(taxa_being_studied, "invertebrates") == TRUE,  1, 0), 
                          invertebrates = ifelse(is.na(taxa_being_studied) == TRUE,  0, invertebrates))
table(data4$invertebrates, useNA = "always")

data4 <- data4 %>% mutate(vertebrates = ifelse(str_detect(taxa_being_studied, "vertebrates") == TRUE,  1, 0), 
                          vertebrates = ifelse(is.na(taxa_being_studied) == TRUE,  0, vertebrates))
table(data4$vertebrates, useNA = "always")


# Check and clean data_link_preprint
data4 <- data4 %>% mutate(data_link_preprint_cleaned = case_when(is.na(data_link_preprint) ~ "not applicable",
                                                                 data_link_preprint == "NA" ~ "not applicable",
                                                                 data_link_preprint == "na" ~ "not applicable",
                                                                 data_link_preprint == "none" ~ "no",
                                                                 code_link_preprint == "null" ~ "no",
                                                                 str_detect(data_link_preprint, "10.") == TRUE ~ "yes",
                                                                 str_detect(data_link_preprint, "doi") == TRUE ~ "yes",
                                                                 str_detect(data_link_preprint, "DOI") == TRUE ~ "yes",
                                                                 str_detect(data_link_preprint, "osf.") == TRUE ~ "yes",
                                                                 str_detect(data_link_preprint, "github") == TRUE ~ "yes",
                                                                 str_detect(data_link_preprint, "NCBI") == TRUE ~ "yes",
                                                                 .default = "no") )
table(data4$data_link_preprint_cleaned, useNA = "always")

# Check and clean code_link_preprint
data4 <- data4 %>% mutate(code_link_preprint_cleaned = case_when(is.na(code_link_preprint) ~ "not applicable",
                                                                 code_link_preprint == "NA" ~ "not applicable",
                                                                 code_link_preprint == "na" ~ "not applicable",
                                                                 code_link_preprint == "none" ~ "no",
                                                                 code_link_preprint == "null" ~ "no",
                                                                 str_detect(code_link_preprint, "10.") == TRUE ~ "yes",
                                                                 str_detect(code_link_preprint, "doi") == TRUE ~ "yes",
                                                                 str_detect(code_link_preprint, "DOI") == TRUE ~ "yes",
                                                                 str_detect(code_link_preprint, "osf.") == TRUE ~ "yes",
                                                                 str_detect(code_link_preprint, "github") == TRUE ~ "yes",
                                                                 str_detect(code_link_preprint, "NCBI") == TRUE ~ "yes",
                                                                 .default = "no") )
table(data4$code_link_preprint_cleaned, useNA = "always")

# Check  and clean data_link_article
data4 <- data4 %>% mutate(data_link_article_cleaned = case_when(is.na(data_link_article) ~ "not applicable",
                                                                data_link_article == "NA" ~ "not applicable",
                                                                data_link_article == "na" ~ "not applicable",
                                                                data_link_article == "none" ~ "no",
                                                                data_link_article == "null" ~ "no",
                                                                str_detect(data_link_article, "10.") == TRUE ~ "yes",
                                                                str_detect(data_link_article, "doi") == TRUE ~ "yes",
                                                                str_detect(data_link_article, "DOI") == TRUE ~ "yes",
                                                                str_detect(data_link_article, "osf.") == TRUE ~ "yes",
                                                                str_detect(data_link_article, "github") == TRUE ~ "yes",
                                                                str_detect(data_link_article, "NCBI") == TRUE ~ "yes",
                                                                .default = "no") )
table(data4$data_link_article_cleaned, useNA = "always")

# Check and clean code_link_article
data4 <- data4 %>% mutate(code_link_article_cleaned = case_when(is.na(code_link_article) ~ "not applicable",
                                                                code_link_article == "NA" ~ "not applicable",
                                                                code_link_article == "na" ~ "not applicable",
                                                                code_link_article == "none" ~ "no",
                                                                code_link_article == "null" ~ "no",
                                                                str_detect(code_link_article, "10.") == TRUE ~ "yes",
                                                                str_detect(code_link_article, "doi") == TRUE ~ "yes",
                                                                str_detect(code_link_article, "DOI") == TRUE ~ "yes",
                                                                str_detect(code_link_article, "osf.") == TRUE ~ "yes",
                                                                str_detect(code_link_article, "github") == TRUE ~ "yes",
                                                                str_detect(code_link_article, "NCBI") == TRUE ~ "yes",
                                                                .default = "no") )
table(data4$code_link_article_cleaned, useNA = "always")


#sort by extractors_last_name

data4 <- data4 %>% arrange(extractors_last_name)
#write.csv(data4, here("output", "data", "data4_processed_check.csv"), fileEncoding = "UTF-8")
write_xlsx(data4, path = here("output", "data", "data4_processed_check.xlsx"))

## Allocation of paper checking
	replace <- c("Stefan J.G. Vriend" = "Stefan Vriend", "Matt Grainger" = "Matthew Grainger", "Gideon Gywa Deme" = "Gideon Deme", "Magdalena M. Mair" = "Magdalena Mair", "Malgorzata Lagisz" = "Losia Lagisz",  "Antica Culin" = "Antica Culina", "Melina de Souza leite" = "Melina de Souza Leite")

	delegates <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Delegate Details")  %>%  clean_names()  %>% mutate(extractor_full_name = paste0(firstname, " ", lastname))  %>% mutate(extractor_full_name = str_to_lower(str_replace_all(extractor_full_name, replace)))  %>% select(extractor_full_name, email)  %>% data.frame() 

	# Check allocation for those who extracted
	alloc_final <- data4 %>% mutate(extractor_fullname = paste0(extractors_first_name, " ", extractors_last_name)) %>%  group_by(extractor_fullname) %>% summarise(n = n())  %>% data.frame()
	
	# Mereg with delegate list, which has people who didn't extract
	alloc_final  <- full_join(delegates, alloc_final, by = join_by("extractor_full_name" == "extractor_fullname"), keep = TRUE)  %>% arrange(desc(extractor_full_name)) %>% data.frame()

	write_xlsx(alloc_final, path = here("output", "data", "alloc_final2.xlsx"))
