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
dois <- unique(data$publisher_doi)[-1] # Remove 1 NA in first position
length(dois) # 509

#connect and fetch the data
OA_df <- roadoi::oadoi_fetch(dois = dois, email = "daniel.wa.noble@gmail.com") 

#save fetched data
readr::write_csv(OA_df, file = here("output", "data","OA_article_data_Unpaywall.csv")) 
dim(OA_df) # 509

OA_df <- OA_df  %>% select(doi, journal_name, is_oa, oa_status)

# Merge dois with OA data
OA_df2 <- data.frame(doi = dois, OA_df)

# Merge with the main data
data2 <- data  %>% left_join(OA_df2, by = c("publisher_doi" = "doi"))

# We have now cross checked the paper in more detail to see if we missed any published papers. So, we should update the new time between preprint and publication dates, which is a time difference between the preprint and the published paper dates. CRoss checked two times to make sure they were calculated correct. Good!

data2 <- data2  %>% mutate(time_between_preprint_and_pub_days = ymd(publication_date) - ymd(preprint_published_date))
