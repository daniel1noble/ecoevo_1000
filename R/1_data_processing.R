###–––––––––––––––––––––––––––––––––––––––––––––––––###
# Purpose: Loading and cleaning Google Sheet Data
###–––––––––––––––––––––––––––––––––––––––––––––––––###

# Load packages
	pacman::p_load(tidyverse, googlesheets4, janitor)

# Load data from Google Sheets
	# Delegate list
	delegates <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Delegate Details")

	# Export emails
	write.csv(delegates$Email, "output/emails/delegates_emails.csv", row.names = FALSE)

	# Master preprint list 
	master_list <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Master List of Preprints")

# Check on status
	status <- master_list  %>% rename("completed" = "Completed_Yes_No_extractor") %>%
			mutate(completed = str_to_title(completed))  %>% tabyl(completed)
