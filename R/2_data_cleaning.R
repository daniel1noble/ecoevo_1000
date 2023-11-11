
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

# We'll check out journals now
		journals <- data2  %>% group_by(publication_journal) %>% summarise(n = n())  %>% arrange(desc(publication_journal))  %>% data.frame()

# Reoslve some obvious duplicates names and spelling errors in names. I think we are going to need to do an actual check of book sna dbook chapters, but we could sort this out coding wise too in the last line. There is a numeric vaue "1". No clue why that is there. Still a bnch of books here though that needs fixing

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
		   publication_journal= ifelse(type_of_preprint == "book chapter", "book chapter", publication_journal))
