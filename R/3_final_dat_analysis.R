########################################
# Analysis of the final checked data file
########################################

###-------------------------###
# Load packages
###-------------------------###
	pacman::p_load(tidyverse, googlesheets4, janitor, here, roadoi)

###-------------------------###
# Load data from Google Sheets 
# and save raw files
###-------------------------###

	# Load data	
	data <- read_csv(here("data", "final_data.csv"))  %>% 
	mutate(
		preprint_published_date = as.Date(preprint_published_date, format = "%d/%m/%Y"),
	    publication_date = as.Date(publication_date, format = "%d/%m/%Y"),
		time_between_preprint_and_pub_days = as.numeric(publication_date - preprint_published_date))
	
	# Have a look at columns
	str(data)

###-------------------------###
# Extract whether a paper is open access or not
###-------------------------###

# Use the DOI for the published paper to get OA
dois <- unique(data$publisher_doi) 
length(dois) # 510, but one NA

#connect and fetch the data
OA_df <- roadoi::oadoi_fetch(dois = dois, email = "daniel.wa.noble@gmail.com") 

#save fetched data
readr::write_csv(OA_df, file = here("output", "data","OA_article_data_Unpaywall.csv")) 
dim(OA_df) # 509, 11 1 missing because of empty string for NA values

OA_df <- OA_df  %>% select(doi, journal_name, is_oa, oa_status)

# Merge dois with OA data
OA_df2 <- data.frame(doi = dois[-1], OA_df)

# Merge with the main data
data2 <- data  %>% left_join(OA_df2, by = c("publisher_doi" = "doi"))