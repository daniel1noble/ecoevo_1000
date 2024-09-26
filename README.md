# Data and Code for: The promise of community-driven preprints in ecology and evolution
[![DOI](https://zenodo.org/badge/682784807.svg)](https://zenodo.org/doi/10.5281/zenodo.13841039)

## Research Paper
This repository contains the final code, data and figures used in the following manuscript:

Noble et al. 2024. The promise of community-driven preprints in ecology and evolution. Proceedings of the Royal Society B: Biological Sciences, under review 

This paper emerged from a SORTEE hackathon. Our initial study plan was pre-registered on [OSF](https://doi.org/10.17605/OSF.IO/D7ZWS). We have also captured our pre-study research plan as a [release](https://github.com/daniel1noble/ecoevo_1000/releases/tag/v1.0) to ensure content is all contained within this repository.

## 1. How to use this repository?

Users can download a zip file of the entire repository by clicking on the green `code` tab at the top of the page and then clicking `Download ZIP`. Alternatively, the repo can be downloaded from [Zenodo](https://zenodo.org/doi/10.5281/zenodo.13841039) or even the latest [release](https://github.com/daniel1noble/ecoevo_1000/releases/tag/v1.0). Users who already have a GitHub account can `fork` the repository.

The main file for users to click on when they are first navigating is the :page_facing_up: `ecoevo_1000.Rproj` file which will open the folder and set the working directory to the root of the downloaded folder. This will provide access to the code and data through R. Note that we use `Quarto` to provide a 100% reproducible paper where our text, code and figures are integrated together. This allows users to identify what specific objects are being used to render the quantitative information provided in the manuscript (more details below).

## 2. Project Organization and Workflow

The key file in this repository is the :page_facing_up: `ms.qmd` file within the :open_file_folder: `ms` folder. This file can be rendered in `R` with `Quarto` to reproduce the entire paper. Code chunks within the file provide the code used to reproduce figures and analyses along with supporting statements within the text. Note that inline code chunks use specific objects which are then rendered.

The `ms.qmd` file makes use of files within a number of folders that are identified in the code chunks. There are a number of important folders in the repository. 
* :open_file_folder: `data` The `data` folder contains all the raw data used in files. For more details see *4. Data* below.
* :open_file_folder: `output/figs/` Folder contains all the figures for the paper that are read and included in the paper. See more details below (**3. Figures**).
* :open_file_folder: `R` The R folder contains three files that are used to clean and process data to prepare it for use in the :page_facing_up: `ms.qmd` file. Note that readers do not need to open and run these files, but they are simply here to document the workflow and code used to clean up data to be used. These include: 
 	1. :page_facing_up: `1_data_processing.R`, which is used to first download the Google Sheets used during our hackathon, process and merge with meta-data from the California Digital Library (CDL); 
	2. :page_facing_up: `2_data_cleaning.R`
	3. :page_facing_up: `3_author_affli.R`, which is code to grab and process author affiliations because the lead author is a little lazy when it comes to cumbersome tasks such as these.
* :open_file_folder: `bib` The bib folder contains:
	1. the references (i.e., :page_facing_up:  `refs.bib`), 
	2. style file (i.e., :page_facing_up: `proceedings-of-the-royal-society-b.csl`),
	3. a template docx file to format the resulting rendered files (i.e., :page_facing_up: `template.docx`).

## 3. Figures
`ms.qmd` will rely on figures generated and stored in the :open_file_folder: `output/figs/` folder. The final list of  figures are as follows:

 - :page_facing_up: `Figure 1_FINAL.png` 
 - :page_facing_up: `Figure 2_FINAL.png` 

Note that these figures are a composite of figures patched together and the final files were  modified outside of `R` for aesthetic reasons. These files also have associated Adobe illustrator files. The code to reproduce  individual figures is provided in `ms.qmd`. 

## 4. Data
Given the project has been a major group effort we initially relied on Google Sheets to provide pathways by which all authors could contribute to the data collection process. These Google Sheets were then sourced, processed, checked and then cleaned prior to analysis. The first initial file was provided to us by the California Digital Library (CDL) team, who downloaded the relevant meta-data on the articles posted to **EcoEvoRxiv** as of 30 September 2023. 

The original meta-data files from the CDL are located in the :open_file_folder: `data` folder and named as follows:
- :page_facing_up: `20231003_EER _allversions.xlsx`
- :page_facing_up: `20231003_EER_preprints_metadata.xlsx`

#### Column Names and Information for [`20231003_EER_preprints_metadata.xlsx`](https://github.com/daniel1noble/ecoevo_1000/blob/main/data/20231003_EER_preprints_metadata.xlsx). **Note**: These columns are the same descriptors as that found in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319)
- **Preprint ID**: Janeway's internal identifier for the preprint 
- **Preprint Title**: Title of the preprint 
- **Preprint DOI**: DOI of the preprint
- **Publisher DOI**: DOI of the postprint/publisher's article, if any
- **Reuse Licence**: Creative Commons reuse licence
- **Submission Date**: Date preprint was submitted to EcoEvoRxiv
- **Accepted Date**: Date preprint was accepted to EER 
- **Published Date**: Date preprint was published in EER (may differ from accepted date)
- **Update Date**: Date preprint was last updated by an EER moderator
- **Current Version**: Current version now 
- **Version creation date**: Date that version was created/submitted (may differ from update date)
- **Submitting Author**: Name of submitting author
- **Submitting Author Email**: Submitting author's email address
- **Authors List**: List of all authors
- **Total authors**: Total number of authors 

#### Column Names and Information for [`20231003_EER_allversions.xlsx`](https://github.com/daniel1noble/ecoevo_1000/blob/main/data/20231003_EER%20_allversions.xlsx)

This data contains version history information for each preprint on EcoEvoRxiv. It is meant to supplement the main dataset `20230824_EER_Preprints_metadata.xlsx`.

 - **Preprint ID**:	Title of the preprint
 - **Preprint DOI**:	DOI of the preprint
 - **Publisher DOI**: DOI of the postprint/publisher's article, if any
 - **Reuse Licence**: License selected by author	
 - **Submitting Author**: Name of submitting author (first, last)
 - **Submission Date**: Date of version submission
 - **Accepted Date**: Date of acceptance for version
 - **Published Date**: Date published on EcoEvoRxiv
 - **Update Date**:	Date published preprint was updated
 - **Current Version**:	Current version number of preprint
 - **Version date**: Date of version 

## 5. Reporting Issues or Asking Questions
If anything is unclear or you require further detail please don't hesitate to lodge an [issue](https://github.com/daniel1noble/ecoevo_1000/issues). 


### Data to be manually collected on preprints
- **Extractors first name**: This will be used to identify who collected the data.
- **Extractors last name**: This will be used to identify who collected the data .
- **Preprint DOI**: Copy and paste from the provided list of preprints from the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file. Copy the whole link containing DOI and paste it.
- **Submitting/ corresponding authors firstname**: First name (given name) and second name (or initials, if provided) of the author submitting the preprint - copy and paste from the master list provided. Usually there is one submitting author in the meta-data preprint list. If there are multiple authors then use the first author listed on the preprint.
- **Submitting/ corresponding authors lastname**: Last name (family name) of the author submitting the preprint - copy and paste from the master list provided. If there are multiple authors then use the first author listed on the preprint.
- **Country of the corresponding / submitting author**: Country of affiliation for the author submitting the preprint. You should be able to see it on the first page of the preprint (open the preprint landing page on EcoEvoRxiv using the DOI link from the master list). If multiple affiliations are listed only use the country of first affiliation. To Enter the country name following the standard names ISO 3166 which are in the first column of the table [here](https://www.iso.org/obp/ui/#search/code/)
If you cannot determine the affiliation country enter "NA". 
- **Year of first publication for corresponding/submitted author**: Use [Google Scholar](https://scholar.google.com.au) to collect publication year of journal article of the author submitting the preprint. If submitting author has no [Google Scholar](https://scholar.google.com.au) profile, enter '0'.
- **How many versions of the preprint exist**: This can be found in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file.
- **Taxa being studied**: What taxa are focus of the study described in the preprint? (select all that apply). Levels include "Plants", "Animals", "Fungi", "Algi", "Invertabrates", "Vertebrates", "Microorganisms (bacteria, viruses)", "Other". (select all that apply)
- **Discussion on the preprint?**: Use preprint DOI link to look at its EcoEvoRxiv landing page. Have there been any comments made on the preprint in the discussion panel on the preprint landing page?
- **Type of article**: Research Article - is any article-like manuscript intended for publication in research journals with new empirical findings; methods paper, are papers presenting new methodological or computational approaches; Reviews and Meta-analyses, are papers quantitatively or qualitatively synthesising a given topic;  opinions, are usually short papers providing new perspectives on a topic; comments, are papers that explicitly comment on an already published research article.
- **Link to Data for Preprint**: Scroll through the first version of the preprint and any related files on EcoEvoRxiv to see if a link (or accession number) to underlying data is provided. From the first preprint, copy and paste link (or accession number) to data repository, if reported. If the preprint is not an empirical or equivalent article based on data and data analyses (so usually for opinions, comments, narrative reviews, theoretical paper, etc.) enter 'NA'. If the preprint is based on data/code but no link (or accession number) to data repository is reported, enter 'none'. If multiple links are provided, enter the first one.  
- **Link to Code for Preprint**: Scroll through the first version of the preprint and any related files on EcoEvoRxiv to see if a link (or accession number) to underlying code is provided. From the first preprint, copy and paste link (or accession number) to data repository, if reported. If the preprint is not an empirical or equivalent article based on data and data analyses (so usually for opinions, comments, narrative reviews, theoretical paper, etc.) enter 'NA'. If the preprint is based on data/code but no link (or accession number) to code is reported, enter 'none'. If multiple links are provided, enter the first one.  
- **Number of citations to preprint**: Collect manually from [Google Scholar](https://scholar.google.com.au). If the preprint version is NOT on Google Scholar enter "999". If the preprint version is online and clearly indicated (i.e., EcoEvoRxiv) then take that citation count.
- **PCI recommendation**: Has the preprint been recomended by Peer Community In (PCI)? Two steps to try. 1) PCI recommendations may be associated with the preprint on the preprint landing page. If so, it will clearly indicate this and or provide a link to a recommendation; 2) In a Google Search, add the following search query: "peercommunityin.org recommendation "TITLE OF PREPRINT"". Replace TITLE OF PREPRINT with the preprint title. See if it's in the first page of the search. If not, then assume it is not recommended.  
- **Publication DOI**: If the preprint has been published as a journal article, provide the DOI of that article. Note that if already known to be published there will be a published DOI in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file. Please copy and paste this DOI. If there is no DOI in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file then please follow these steps: 1) copy the preprint title; 2) Search in Google for the preprint title and determine on the first page of the search whether it has been published in a peer-reviewed journal. 3) If preprint has been published but it is not yet recorded in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file then please copy and paste the DOI of the published article. 4) If the preprint has not been published then please indicate 'NA'.
- **Journal name**: If the preprint has been published as a journal article, provide journal name (full name). Please use lower case for all letters. If the preprint has not been published, enter 'NA'.
- **Double-blind Peer review**: Does the published journal have a policy of double blind or blind peer review? Please review the journals policy page. If the journal does not have a policy page or it is unclear then please indicate 'No Blinding'.
- **Journal impact factor/Cite Scores**: Can be collected using the journal name automatically using R packages.
- **Publicaton Date**. If the preprint has been published as a journal article, provide (first) publication date (Month, Day, Year). If the DOI is available in the [Preprint Meta-data](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit#gid=836736319) data file you will still need to visit the journal website to collect the publication date. The publication date should be listed on the landing page of the published version of the preprint just under author affiliation, but this may vary depending on the journal. If the preprint has not been published, leave empty.
- **Title Change**: If the preprint has been published as a journal article, has the title the changed between the first version of the preprint and the published article? Note that any word change is sufficient for a 'yes'. If the preprint has not been published, leave empty.
- **Number of citations to publication**: Collect manually from [Google Scholar](https://scholar.google.com.au). If the preprint has not been published, leave blank.
- **Link to Data for Publication**: If the preprint has not been published enter 'NA'. If the preprint is not and empirical or equivalent article based on data and data analyses (so usually for opinions, comments, narrative reviews, theoretical paper, etc.) enter 'NA'. If the preprint is based on data/code but no link (or accession number) to data repository is reported, enter 'none'. If the preprint has been published as a journal article, and has such link reported, copy and paste this link (or accession number) below.
- **Link to Code for Publication**: If the preprint has not been published enter 'NA'. If the preprint is not and empirical or equivalent article based on data and data analyses (so usually for opinions, comments, narrative reviews, theoretical paper, etc.) enter 'NA'.  If the preprint is based on data/code but no link (or accession number) to code is reported, enter 'none'. If the preprint has been published as a journal article, and has such link reported, copy and paste this link (or accession number) below.
- **Gender**: Use R package that determines likely gender of corrsponding author based on first name
- **Preprint comments**: Do YOU have Any additional comments on the preprint. Make note of any relevant comments about the preprint that may be useful for the manuscript.
- **Publication comments**: Do YOU have any comments on the published article related to an EcoEvoRxiv submission. Make note of any relevant comments about the preprint that may be useful for the manuscript.
