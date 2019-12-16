# Transform Enrollment Data
# 

library(readxl)
library(tidyverse)

#This is an example report from our Engineering Data Management System
reported_enrollment = read_xlsx("data/UIUC_Enrollment.xlsx")
# It is enrollment information for UIUC from 2018 in wide format 
# and with column headers that have class, ethnicity and gender coded.
# The first worksheet in an xlsx is read in by default in read_xlsx.

codebook = read_xlsx("data/UIUC_Enrollment.xlsx", sheet = "codebook")
#The logic behind the codebook worksheet is to recode the columns
#into the required variable names/levels in the instructions.
#There are over a hundred columns and this is the most straightforward approach I've found.
#You can copy and paste the column names and transpose in excel. The coding of each variable
#takes less than 5 minutes...you can just drag to fill in the same rows.

#The alternative option is to try and parse the column names into the different required variables.
#This could work, but only if you are certain there aren't spelling mistakes in names that allows
#string parsing to work. 

# #These are the required variables
# Type
# Program
# Class
# Degree_level
# Status
# Gender
# Ethnicity
# Count

## Left joining with the code book creates the following variables
# "Class"        "Degree_level" "Gender"       "Ethnicity"    "Status" 
# Program is defined in the Degree column for this report.  This name should match what is 
# reported in the online portion of the survey.
# Type is a binary variable that represents whether the program unit 
# is engineering or engineering technology. For example, if an program is housed in a college of engineering
# then, it should be engineering (eng)
# if it is housed in a college of engineering technology, then categorize it as engineering technology (et)



flat_enrollment = reported_enrollment %>% gather(key=variable,value=Count,  
                                                 "Cauc M PT Fresh":"Unknown F FT Senior") %>%
  left_join(codebook,by="variable") %>%
  mutate(Program = Degree, Type = "eng") %>%
  select(Type, Program, Class, Degree_level, Status,
         Gender, Ethnicity, Count) %>%
  filter(Count!=0) 




#This file is what is uploaded.
write.csv(flat_enrollment, "enrollment.csv", row.names = FALSE)





  
  
