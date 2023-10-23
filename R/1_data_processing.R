###–––––––––––––––––––––––––––––––––––––––––––––––––###
# Purpose: Loading and cleaning Google Sheet Data
###–––––––––––––––––––––––––––––––––––––––––––––––––###

# Load packages
	pacman::p_load(tidyverse, googlesheets4, janitor)

# Load data from Google Sheets
	# Delegate list
	delegates <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Delegate Details")  %>%  clean_names()

	# Check on who attended the hackathon
	delegates  %>% tabyl("attended_hackathon_yes_no")
	
	# Export emails
	write.csv(delegates$email, "output/emails/delegates_emails.csv", row.names = FALSE)

	# Master preprint list 
	master_list <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Master List of Preprints")  %>% clean_names()

	# Export master list
	write.csv(master_list, "output/data/master_list.csv", row.names = FALSE)

	# Check on status
	status <- master_list  %>% rename("completed" = "completed_yes_no_extractor") %>%
			mutate(completed = str_to_title(completed))  %>% tabyl(completed)

	# raw data
	data <- read_sheet("https://docs.google.com/spreadsheets/d/1032gLryvtCNJ7eJjKBjrn7txxDRUGql9SoIG18QnFrQ/edit?resourcekey#gid=1062856014") %>% clean_names()




