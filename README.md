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

### Data to be Collected on preprints
- Country of the corresponding author
- Date between submission and acceptance
- How many versions
- Title changes?
- Type of article
- Data open?
- Code open?
- Journal names
- Journal impact factor/Cite Scores
- Number of citations/ age corrected citation rate
- Published DOI
- Published data from published version
- PCI recommendation?
- Gender - Use R package that determines likely gender of corrsponding author based on first name
- Career stage of corresponding author? (first publication year)
- Postprint / preprint needs to be established - binary (1 = preprint/0)
- Taxa being studied
- Discussion on the preprint?
- Was it subsequently reviewed and published in a journal that uses double-blind reivewing?

### How to collect data from preprints?	

We will use a google form to collect releavnt data about each preprint. The form will be filled out by a each Hackathon participant for a subset of preprints. Training session. We will do a subset of preprints together to make sure we are all on the same page.

