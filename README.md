README
================

## Flat file example

This is a small example of transforming data into the sturcutre for ASEE
profiles submission. The output instructions are contained online here
and the required file is comma separated. We are doing this a way of
easing the reporting burden on institutions and intend to build on this
capacity in the future based on use and feedback.

## Folder Structure

The data\_transform.R file contains R code (using Tidyverse syntax) to
transform a report pulled from our EDMS system and re-write it into the
format we are asking for. The csv file is in the structure for
enrollment we are asking for (a similar process could be performed for
the data for faculty and for the degrees awarded).

### data/

The UIUC\_Enrollment.xlsx file contains two worksheets. First, the
worksheet from the data in our internal system and second a codebook to
aid in the transforming the report into the data structure we are asking
for.
