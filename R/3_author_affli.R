###–––––––––––––––––––––––––––––––––––––––––––––––––###
# Purpose: Creating afffiliations and authors
###–––––––––––––––––––––––––––––––––––––––––––––––––###
###-------------------------###
# Load packages
###-------------------------###
	pacman::p_load(tidyverse, googlesheets4, janitor, here)

###-------------------------###
# Load data from Google Sheets 
# and save raw files
###-------------------------###

delegates <- read_sheet("https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319", sheet = "Delegate Details")  %>%  clean_names()   %>% mutate(fullname = paste(firstname, lastname, sep = " "))  %>% arrange(lastname)  %>% filter(!is.na(fullname) & !fullname %in% c("Shinichi Nakagawa", "Daniel Noble", "Malgorzata Lagisz"))

# Now that we have all the details lets create a markdown file that writes the authors and the afflitions
yaml <- "---
title: ""
format:
  docx:
    reference-doc: ./bib/template.docx
---"
nums <- 1:length(delegates$fullname)
sink("authors.qmd")
writeLines(paste0(paste0(delegates$fullname, "^", nums,"^", collapse = ", ")), fileConn)
cat("\n")
writeLines(paste0(paste0("^", nums,"^", delegates$affiliation_school_department_organisation, sep = "\n", collapse = "\n")), fileConn)
sink()


