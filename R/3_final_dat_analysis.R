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
write.csv(data2, file = here("data", "final_data2.csv"))

########-------------------------###
### Excluding postprints, how long does it take for a preprint to be published in Ecology and Evolution?
########-------------------------###

data2  %>% filter(postprint == "preprint")  %>% ggplot(aes(x = time_between_preprint_and_pub_days)) + geom_histogram(binwidth = 30) + labs(title = "Time between preprint and publication in Ecology and Evolution", x = "Days", y = "Frequency") + theme_minimal()

# Why are there weird dates (e.g, Should take at least 3 months to publish a paper, and also, anything below 0 should be a postprint.) I suppose it's possible to be published quuite quickly, but a month seems quite weird to me. Lets just take anything below a month out

preprints <- data2  %>% filter(time_between_preprint_and_pub_days >= 30)
preprints %>% ggplot(aes(x = time_between_preprint_and_pub_days)) + geom_histogram(binwidth = 30) + labs(title = "Time between preprint and publication in Ecology and Evolution", x = "Days", y = "Frequency") + theme_classic()

# what is the range
preprints  %>% summarise(min = min(time_between_preprint_and_pub_days), max = max(time_between_preprint_and_pub_days), mean = mean(time_between_preprint_and_pub_days), median = median(time_between_preprint_and_pub_days), sd = sd(time_between_preprint_and_pub_days))

########-------------------------###
### What is the OA status of the published preprints?
########-------------------------###

# Lets first look only at the preprints. Then, we can look at the postprints. It's possible folks are putting up postprints because they are not OA journals and they want to share their work freely.

p1 <- preprints  %>% ggplot(aes(x = is_oa)) + geom_bar() + labs(x = "Open Access", y = "Frequency") + theme_classic()

p2 <- preprints  %>% ggplot(aes(x = oa_status)) + geom_bar() + labs(x = "Open Access Status", y = "Frequency") + theme_classic()

(p1 + p2) + plot_annotation(tag_levels = 'A', tag_suffix=")")

# Summary of the data
sum_is_oa <- tabyl(preprints$is_oa)
sum_oa_status <- tabyl(preprints$oa_status)