# First 1000 preprints on EcoEvoRxiv

Evaluation of the first 1000 preprints on EcoEvoRxiv

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

Anyone who can't come should check existing data.

# Intended Research Journal

**Nature Ecology and Evolution**
Brief Communication
	- A Brief Communication reports a concise study of high quality and broad interest. 

Format
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
