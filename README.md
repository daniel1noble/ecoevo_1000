# Data and Code for: The promise of community-driven preprints in ecology and evolution
[![DOI](https://zenodo.org/badge/682784807.svg)](https://zenodo.org/doi/10.5281/zenodo.13841039)

## Research Paper
This repository contains the final code, data and figures used in the following manuscript:

Noble et al. 2024. The promise of community-driven preprints in ecology and evolution. Proceedings of the Royal Society B: Biological Sciences, under review 

**Pre-registration**: This paper emerged from a SORTEE hackathon. Our initial study plan was pre-registered on [OSF](https://doi.org/10.17605/OSF.IO/D7ZWS). We have also captured our pre-study research plan as a [release](https://github.com/daniel1noble/ecoevo_1000/releases/tag/v1.0) to ensure content is all contained within this repository.

**Supplementary Materials**: Note that the supplementary materials associated with this paper is located in the :open_file_folder: `docs` folder ( :page_facing_up: `supp.qmd`). It can be rendered into html but is also available already rendered [here](https://daniel1noble.github.io/ecoevo_1000/).

## 1. How to use this repository?

Users can download a zip file of the entire repository by clicking on the green `code` tab at the top of the page and then clicking `Download ZIP`. Alternatively, the repo can be downloaded from [Zenodo](https://zenodo.org/doi/10.5281/zenodo.13841039) or even the latest [release](https://github.com/daniel1noble/ecoevo_1000/releases/tag/v1.0). Users who already have a GitHub account can `fork` the repository.

The main file for users to click on when they are first navigating is the :page_facing_up: `ecoevo_1000.Rproj` file which will open the folder and set the working directory to the root of the downloaded folder. This will provide access to the code and data through R. Note that we use `Quarto` to provide a reproducible paper where our text, code and figures are integrated together. This allows users to identify what specific objects are being used to render the quantitative information provided in the manuscript (more details below).

## 2. Project Organization and Workflow

The key file in this repository is the :page_facing_up: `ms.qmd` file within the :open_file_folder: `ms` folder. This file can be rendered in `R` with `Quarto` to reproduce the entire paper. Code chunks within the file provide the code used to reproduce figures and analyses along with supporting statements within the text. Note that inline code chunks use specific objects which are then rendered.

The :page_facing_up: `ms.qmd` file makes use of files within a number of folders that are identified in the code chunks. There are a number of important folders in the repository. 
* :open_file_folder: `data` The `data` folder contains all the raw data used in files.  Note that there are intermediary data files here that were used throughout the processing. There are really only two main files to worry about. For more details see **4. Data** below.
* :open_file_folder: `output/figs/` Folder contains all the figures for the paper that are read and included in the paper. See more details below (**3. Figures**).
* :open_file_folder: `R` The R folder contains three files that are used to clean and process data to prepare it for use in the :page_facing_up: `ms.qmd` file. Note that readers do not need to open and run these files, but they are simply here to document the workflow and code used to clean up data to be used. These include: 
 	1. :page_facing_up: `1_data_processing.R`, which is used to first download the Google Sheets used during our hackathon, process and merge with meta-data from the California Digital Library (CDL); 
	2. :page_facing_up: `2_data_cleaning.R` File does some additional cleaning and checking of the data and merges disparate datasets together.
	3. :page_facing_up: `3_author_affli.R`, which is code to grab and process author affiliations because the lead author is a little lazy when it comes to cumbersome tasks such as these.
* :open_file_folder: `bib` The bib folder contains:
	1. :page_facing_up:  `refs.bib` the references;  
	2. :page_facing_up: `proceedings-of-the-royal-society-b.csl` the journal formatting style file; 
	3. :page_facing_up: `template.docx` a template docx file to format the resulting rendered files.

## 3. Figures
:page_facing_up: `ms.qmd` will rely on figures generated and stored in the :open_file_folder: `output/figs/` folder. The final list of  figures are as follows:

 - :page_facing_up: `Figure 1_FINAL.png` 
 - :page_facing_up: `Figure 2_FINAL.png` 

Note that these figures are a composite of figures patched together and the final files were  modified outside of `R` for aesthetic reasons. These files also have associated Adobe illustrator files. The code to reproduce  individual figures is provided in :page_facing_up: `ms.qmd`. When rendered individual files will be written to the :open_file_folder: `output/figs/` folder.

## 4. Data
Given the project has been a major group effort we initially relied on Google Sheets to provide pathways by which all authors could contribute to the data collection process. These Google Sheets were then sourced, processed, checked and then cleaned prior to analysis. The first initial file was provided to us by the California Digital Library (CDL) team, who downloaded the relevant meta-data on the articles posted to **EcoEvoRxiv** as of 30 September 2023. 

The original meta-data files from the CDL are located in the :open_file_folder: `data` folder, but the main one used is:

* :page_facing_up: `20231003_EER_preprints_metadata.xlsx`

The column names here are:

* **Preprint ID**: Janeway's internal identifier for the preprint 
* **Preprint Title**: Title of the preprint 
* **Preprint DOI**: DOI of the preprint
* **Publisher DOI**: DOI of the postprint/publisher's article, if any
* **Reuse Licence**: Creative Commons reuse licence
* **Submission Date**: Date preprint was submitted to EcoEvoRxiv
* **Accepted Date**: Date preprint was accepted to EER 
* **Published Date**: Date preprint was published in EER (may differ from accepted date)
* **Update Date**: Date preprint was last updated by an EER moderator
* **Current Version**: Current version now 
* **Version creation date**: Date that version was created/submitted (may differ from update date)
* **Submitting Author**: Name of submitting author
* **Submitting Author Email**: Submitting author's email address
* **Authors List**: List of all authors
* **Total authors**: Total number of authors 

The second data file used in the :page_facing_up: `ms.qmd` file is:

* :page_facing_up: `final_data2.csv`

This file is the processed data file which is then merged with the :page_facing_up: `20231003_EER_preprints_metadata.xlsx` data. The descriptions of the data columns are as follows:

* **assigned_to**: Name of author assigned to checking the data.
* **nr**: Unique article number for each preprint/postprint.
* **extractors_first_name**: First name of the author who extracted data.
* **extractors_last_name**: Last name of the author who extracted data.
* **preprint_id**: Unique preprint ID from EcoEvoRxiv. These are auto-assigned numbers by the Janeway system.
* **preprint_doi**: Digital Object Identifier (DOI) for preprint.
* **preprint_title**: Title of pre/postprint
* **submitting_author**: Full name of submitted author.
* **submitting_author_country**: Country of submitting author.
* **submitting_author_first_publication_year**: Year of first publication for submitting author.
* **taxa_being_studied**: Taxa being studied in the preprint. 
* **data_link_preprint**: Link to associated data for the paper on *EcoEvoRxiv*.
* **code_link_preprint**: Link to associated code for the paper on *EcoEvoRxiv*.
* **number_of_citations_preprint**: Number of citations to the preprint taken from Google Scholar.
* **pci_recommendation_preprint**: Whether or not the preprint was posted to Peer Community In (PCI).
* **publication_doi**: DOI for the published article.
* **publication_journal**: Research journal name that the article was ultimately published in.
* **publication_date**: Date of publication for the published version of the article. Taken as the date the article first appeared online.
* **publication_title_changed**: Whether or not the title of the published articles changed from the preprint.
* **number_of_citations_article**: Number of citations to the published article. 
* **current_version**: The current version of the article published on *EcoEvoRxiv*
* **data_link_article**: Link to associated data for the published version of the paper. 
* **code_link_article**: Link to associated code for the published version of the paper. 
* **publisher_doi**: DOI for the published paper. 
* **preprint_published_date**: Preprint/postprint publication date. The date when published on *EcoEvoRxiv*.
* **total_authors**: Total number of authors on the preprint/postprint on *EcoEvoRxiv*.
* **time_between_preprint_and_pub_days**: Days between posting the article on *EcoEvoRxiv* and the time the paper (if relevant) was published in a peer-reviewer research journal. 
* **postprint**: Identifier as to whether the article posted on *EcoEvoRxiv* was likely a postprint or not.
* **plants**: Identifier on whether the study contained plants as one of the main taxa studied or not.
* **algi**: Identifier on whether the study contained algi as one of the main taxa studied or not.
* **fungi**: Identifier on whether the study contained fungi as one of the main taxa studied or not.
* **microorganisms**: Identifier on whether the study contained bacteria, or other microorganisms, as one of the main taxa studied or not.
* **invertebrates**: Identifier on whether the study contained invertebrates as one of the main taxa studied or not.
* **vertebrates**: Identifier on whether the study contained vertebrates as one of the main taxa studied or not.
* **type_of_preprint**: The type of article on *EcoEvoRxiv*. These could be research article, opinion, review and meta-analysis, book or book chapters, report. Anything not in these categories were classified as 'other'.
* **data_link_preprint_cleaned**: A cleaned up version of the data link for the article on *EcoEvoRxiv*.
* **code_link_preprint_cleaned** A cleaned up version of the code link for the article on *EcoEvoRxiv*.
* **data_link_article_cleaned**: A cleaned up version of the data link for the published article.
* **code_link_article_cleaned** A cleaned up version of the code link for the published article.
* **check_completed**: Indicator (yes/no) as to whether the paper check was complete.
* **check_comment**: Comments about decisions made during checking.
* **journal_name**: Name of research journal where the preprint/postprint was published. 
* **is_oa**: Logical (true/false) indicating whether the paper was published in open access (true) or not (false).
* **oa_status**: Open access status.

## 5. Reporting Issues or Asking Questions
If anything is unclear or you require further detail please don't hesitate to lodge an [issue](https://github.com/daniel1noble/ecoevo_1000/issues). 

## 6. Session Information

```
sessionInfo()
R version 4.2.1 (2022-06-23)
Platform: x86_64-apple-darwin17.0 (64-bit)
Running under: macOS Big Sur ... 10.16

Matrix products: default
BLAS:   /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRblas.0.dylib
LAPACK: /Library/Frameworks/R.framework/Versions/4.2/Resources/lib/libRlapack.dylib

locale:
[1] en_US.UTF-8/en_US.UTF-8/en_US.UTF-8/C/en_US.UTF-8/en_US.UTF-8

attached base packages:
[1] stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] data.table_1.15.4   lmerTest_3.1-3      lme4_1.1-32        
 [4] Matrix_1.5-3        magick_2.7.4        viridis_0.6.2      
 [7] viridisLite_0.4.2   cowplot_1.1.1       glmmTMB_1.1.6      
[10] see_0.8.2           countrycode_1.5.0   DemografixeR_0.1.1 
[13] mapproj_1.2.11      ggthemes_4.2.4      genderdata_0.6.0   
[16] gender_0.6.0        performance_0.11.0  gt_0.9.0           
[19] ggimage_0.3.1       ggrepel_0.9.3       flextable_0.9.0    
[22] RColorBrewer_1.1-3  maps_3.4.1          janitor_2.2.0      
[25] googlesheets4_1.1.1 MASS_7.3-58.3       readxl_1.4.3       
[28] patchwork_1.2.0     here_1.0.1          lubridate_1.9.3    
[31] forcats_1.0.0       stringr_1.5.1       dplyr_1.1.4        
[34] purrr_1.0.2         readr_2.1.5         tidyr_1.3.1        
[37] tibble_3.2.1        ggplot2_3.5.0       tidyverse_2.0.0    

loaded via a namespace (and not attached):
 [1] uuid_1.2-0              systemfonts_1.0.5       TMB_1.9.3              
 [4] splines_4.2.1           TH.data_1.1-1           digest_0.6.35          
 [7] yulab.utils_0.0.6       htmltools_0.5.8.1       fansi_1.0.6            
[10] magrittr_2.0.3          tzdb_0.4.0              officer_0.6.2          
[13] vroom_1.6.5             sandwich_3.0-2          svglite_2.1.1          
[16] askpass_1.2.0           timechange_0.3.0        gfonts_0.2.0           
[19] colorspace_2.1-0        textshaping_0.3.7       xfun_0.43              
[22] crayon_1.5.2            jsonlite_1.8.8          survival_3.5-5         
[25] zoo_1.8-12              glue_1.7.0              gtable_0.3.4           
[28] gargle_1.5.2            emmeans_1.10.0          scales_1.3.0           
[31] fontquiver_0.2.1        mvtnorm_1.2-4           Rcpp_1.0.11            
[34] xtable_1.8-4            gridGraphics_0.5-1      bit_4.0.5              
[37] fontLiberation_0.1.0    ellipsis_0.3.2          farver_2.1.1           
[40] pkgconfig_2.0.3         utf8_1.2.4              crul_1.3               
[43] ggplotify_0.1.0         tidyselect_1.2.1        labeling_0.4.3         
[46] rlang_1.1.3             later_1.3.1             munsell_0.5.1          
[49] cellranger_1.1.0        tools_4.2.1             cli_3.6.2              
[52] generics_0.1.3          pacman_0.5.1            evaluate_0.23          
[55] fastmap_1.1.1           yaml_2.3.8              ragg_1.2.6             
[58] knitr_1.45              bit64_4.0.5             fs_1.6.3               
[61] zip_2.2.2               nlme_3.1-162            mime_0.12              
[64] xml2_1.3.6              compiler_4.2.1          png_0.1-8              
[67] curl_5.2.1              stringi_1.8.3           gdtools_0.3.3          
[70] lattice_0.20-45         fontBitstreamVera_0.1.1 nloptr_2.0.3           
[73] vctrs_0.6.5             pillar_1.9.0            lifecycle_1.0.4        
[76] estimability_1.4.1      insight_0.19.10         httpuv_1.6.11          
[79] R6_2.5.1                promises_1.2.0.1        gridExtra_2.3          
[82] codetools_0.2-19        boot_1.3-28.1           openssl_2.1.1          
[85] rprojroot_2.0.3         withr_3.0.0             httpcode_0.3.0         
[88] multcomp_1.4-23         parallel_4.2.1          hms_1.1.3              
[91] grid_4.2.1              ggfun_0.0.9             coda_0.19-4            
[94] minqa_1.2.5             rmarkdown_2.26          snakecase_0.11.0       
[97] googledrive_2.1.1       numDeriv_2016.8-1.1     shiny_1.7.4.1          
```