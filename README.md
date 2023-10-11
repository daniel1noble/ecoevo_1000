# Evaluating the First 1000 preprints on EcoEvoRxiv

The goal of this Hackathon is to quantify various attributes of first 1000 preprints to better understand preprint practices and publication pathways in Ecology and Evolution. There are currently well >1100 preprints on the new *EcoEvoRxiv*, which was established in 2018. 

### Hackathon Participants
Anyone registered for the [SORTEE conference](https://events.humanitix.com/sortee-conference-2023-e8dqpa5c) is welcome to join the Hackathon which will take place October, 17th 2023 (8:30-10:30 PM AEST). The Hackathon will be held virtually via [Zoom](https://anu.zoom.us/j/82267359721?pwd=V0JGZHhTMzlNSTM1MjdoblVGZGh2dz09) and run by Daniel Noble, Shinichi Nakagawa and Malgorzata Lagisz as part of the SORTEE conference.

Participants will need to provide details of their involvement in our [delegate data sheet](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit?usp=sharing) so that we can allocate papers, awknowledge contributions and maintain contact with participants.

### What will we do?
Participants that are part of the Hackathon will help collect data on a subset of the preprints from *EcoEvoRxiv*. A list of some of the information we would like to collect can be found below. 

The first part of the Hackathon will be a training session where we will go through the data collection process and answer any questions. The second part of the Hackathon will be the data collection itself. We will use a Google Sheet to allocate preprints to participants. We will also use a Google Sheet to collate the data collected by participants. 

### What we intend to produce?
We intend to produce a manuscript that will be submitted to *Nature Ecology and Evolution* as a brief communication. We will also make the data collected available to the public.

The format of the paper as described by the journal is as follows:
- Brief unreferenced abstract – 3 sentences, up to 100 words.
- Title – up to 10 words (or 90 characters). 
- Main text – 1,000-1,500 words, including abstract, references and figure legends, and contains no headings. 
- Display items – up to 2 items, although this may be flexible at the discretion of the editor, provided the page limit is observed. 
- Extended Data – up to 10 items (figures and/or tables, linked from the main text in the html version of the paper).
- Online Methods section should be included.
- References – as a guideline, we typically recommend up to 20. Article titles are omitted from the reference list.
- Brief Communications should include received/accepted dates. 
- Brief Communications may be accompanied by supplementary information. 
- Brief Communications are peer reviewed.

### Co-authorship
If you would like to be listed as a co-author on the resulting manuscript:
1) You will need to have filled out the [delegate data sheet](https://docs.google.com/spreadsheets/d/1UEAUZWpOm7C1kKoVoYy-u_D6cbHoF--EGxoY0Gl0qHw/edit?usp=sharing) so that we can contact you.
2) You will need to complete data collection for at least XX preprints or contribute to the data collection process and checking of XX preprints if you are not able to attend.
3) Contribute to any discussion and feedback on the resulting manuscript.

The manuscript has already been started (see the `ms/ms.qmd` file). The file can be rendered to a word or pdf document. We will be using the data to provide a quantitative analyses that targets key questions outlined in the manuscript.

# Meta Data for files in `data/` folder

This is the main dataset that contains the most recent version of each preprint submitted to EcoEcoRxiv along with whether the preprint is published and the dates preprints were published. It should be noted that the date the most recent publication was submitted should be the date of publication of a published DOI is listed.

### Column Names and Information for `20231003_EER_preprints_metadata.xlsx`
- **Preprint ID**: Janeway's internal identifier for the preprint 
- **Preprint Title**: Title of the preprint 
- **Preprint DOI**: DOI of the preprint
- **Publisher DOI**: DOI of the postprint/publisher's article, if any
- **Reuse Licence**: Creative Commons reuse licence
- **Submission Date**: Date preprint was submitted to EcoEvoRxiv
- **Accepted Date**: Date preprint was accepted to ​EER 
- **Published Date**: Date preprint was published in EER (may differ from accepted date)
- **Update Date**: Date preprint was last updated by an EER moderator
- **Current Version**: Current version now 
- **Version creation date**: Date that version was created/submitted (may differ from update date)
- **Submitting Author**: Name of submitting author
- **Submitting Author Email**: Submitting author's email address
- **Authors List**: List of all authors
- **Total authors**: Total number of authors 

### Column Names and Information for `20231003_EER_allversions.xlsx`

This data contains version history information for each preprint on EcoEvoRxiv. It is meant to supplement the main dataset `20230824_EER_Preprints_metadata.xlsx`.

 - **Preprint ID**	Title of the preprint
 - **Preprint DOI**	DOI of the preprint
 - **Publisher DOI** DOI of the postprint/publisher's article, if any
 - **Reuse Licence** License selected by author	
 - **Submitting Author** Name of submitting author (first, last)
 - **Submission Date** Date of version submission
 - **Accepted Date** Date of acceptance for version
 - **Published Date** Date published on EcoEvoRxiv
 - **Update Date**	Date published preprint was updated
 - **Current Version**	Current version number of preprint
 - **Version date** Date of version 

# Preprint Data Collection

Data for individual preprints will be collected using our [Google Form](https://forms.gle/Ph6DqkH8gZJbhLrP9). The form will be filled out by each Hackathon participant for a subset of preprints. 

### Data to be Collected on preprints
- **Extractors first name**: This will be used to identify who collected the data and should be all lower case.
- **Extractors last name**: This will be used to identify who collected the data and should be all lower case.
- **Preprint DOI**: Copy and paste from the provided list of preprints from the "20231003_EER_preprints_metadata.xlsx" data file
- **Submitting/ corresponding authors firstname**: First name of the author submitting the preprint. If there are multiple authors then use the first author listed on the preprint. All lower case letters.
- **Submitting/ corresponding authors lastname**: Last name of the author submitting the preprint. If there are multiple authors then use the first author listed on the preprint. All lower case letters.
- **Country of the corresponding / submitting author**: Country of affiliation for the author submitting the preprint. Use standard names ISO 3166 which can be found [here](https://en.wikipedia.org/wiki/List_of_ISO_3166_country_codes)
- **Year of first publication for corresponding/submitted author**: Use Google Scholar to collect publication year of journal article of the author submitting the preprint. If no Google Scholar Profile is found to discern this information please indicate 'NA'.
- **How many versions of the preprint exist**: This can be found in the "20231003_EER_allversions.xlsx" data file.
- **Taxa being studied**: What taxa are focus of the study described in the preprint? (select all that apply). Levels include "Plants", "Animals", "Fungi", "Algi", "Invertabrates", "Vertebrates", "Microorganisms (bacteria, viruses)", "Other".
- **Discussion on the preprint?**: Have there been any comments made on the preprint in the discussion panel on the preprint landing page?
- **Type of article**: Research Article - is any article-like manuscript intended for publication in research journals with new empirical findings; methods paper, are papers presenting new methodological or computational approaches; Reviews and Meta-analyses, are papers quantitatively or qualitatively synthesising a given topic;  opinions, are usually short papers providing new perspectives on a topic; comments, are papers that explicitly comment on an already published research article.
- **Link to Data for Preprint**: Link to data for preprint if available
- **Link to Code for Preprint**: Link to code for preprint if available
- **Number of citations to preprint**: Collect manually from Google Scholar.
- **PCI recommendation**: Has the preprint been recomended by Peer Community In (PCI)? Two steps to try. 1) PCI recommendations may be associated with the preprint on the preprint landing page. If so, it will clearly indicate this and or provide a link to a recommendation; 2) If not, then visit [PCI](https://peercommunityin.org/current-pcis/). There are 17 separate PCI topic links. Click on each and search, using the preprint title, the list of recommendations. If you find a 'hit' and it matches the preprint then put 'yes'. If you do not find that it matches in the PCI recommendations then 'no'. To speed this up, we would recommend first trying PCI Evol Biol, PCI Ecology, PCI Zoology, PCI Animal Science, PCI Genomics first before checking the rest if you have not already found the recommendation.
- **Preprint published?**: Has the preprint been published in a peer reviewed research journal? Yes/No answer.
- **Publication DOI**: If the preprint has been published as a journal article, provide the DOI of that article. Note that if already known to be published there will be a published DOI in the "20231003_EER_preprints_metadata.xlsx" data file. Please copy and paste this DOI. If there is no DOI in the "20231003_EER_preprints_metadata.xlsx" data file then please follow these steps: 1) copy the preprint title; 2) Search in Google for the preprint title and determine on the first page of the search whether it has been published in a peer-reviewed journal. 3) If preprint has been published but it is not yet recorded in the "20231003_EER_preprints_metadata.xlsx" data file then please copy and paste the DOI of the published article. 4) If the preprint has not been published then please indicate 'NA'.
- **Journal name**: If the preprint has been published as a journal article, provide journal name (full name). Please use lower case for all letters.
- **Double-blind Peer review**: Does the published journal have a policy of double blind or blind peer review? Please review the journals policy page. If the journal does not have a policy page or it is unclear then please indicate 'No Blinding'.
- **Journal impact factor/Cite Scores**: Can be collected using the journal name automatically using R packages.
- **Publicaton Date**. If the preprint has been published as a journal article, provide (first) publication date (Month, Day, Year). If the DOI is available in the "20231003_EER_preprints_metadata.xlsx" data file ypu will still need to visit the journal website to collect the publication date. The publication date should be listed on the landing page of the published version of the preprint just under author affiliation, but this may vary depending on the journal.
- **Title Change**: If the preprint has been published as a journal article, has the title the changed between the first version of the preprint and the published article? Note that any word change is sufficient for a 'yes'.
- **Number of citations to publication**: Collect manually from Google Scholar.
- **Link to Data for Publication**: Link to data for Publication if available
- **Link to Code for Publication**: Link to code for Publication if available
- **Gender**: Use R package that determines likely gender of corrsponding author based on first name
- **Preprint comments**: Make note of any relevant comments about the preprint that may be useful for the manuscript.
- **Publication comments**: Make note of any relevant comments about the preprint that may be useful for the manuscript.

### How to collect data from preprints?	

We will use a [Google Form](https://forms.gle/Ph6DqkH8gZJbhLrP9) to collect relevant data about each preprint. The form will be filled out by a each Hackathon participant for a subset of preprints. 

We will first have a training session by all doing a subset of preprints together to make sure we are all on the same page.

