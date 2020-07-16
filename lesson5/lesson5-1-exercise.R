### Exercise 5.1

# Each sub-problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!


# Does religiousness correlate with personal income?

# Run the following lines to load the ALLBUS data set and to 
# re-create some of the variables that we created in previous
# lessons or exercises:

library(haven)
library(rio)
ggss <- data.frame(as_factor(read_dta("data/allbus-extract-07.dta")))
ggss <- spread_attrs(droplevels(gather_attrs(ggss))) 

# income_1k
ggss$income <- ggss$v388       
ggss$income[
  ggss$v388 %in% c("KEIN EINKOMMEN", "VERWEIGERT", "KEINE ANGABE")
  ] <- NA
ggss$income <- as.numeric(as.character(ggss$income))
ggss$income_1k <- ggss$income / 1000

# agegroup 
ggss$age <- ggss$v154
ggss$age[ggss$v154 == "KEINE ANGABE"] <- NA
ggss$age <- as.numeric(as.character(ggss$age))
age_intervals <- c(
  min(ggss$age, na.rm = TRUE), 
  35, 
  65, 
  max(ggss$age, na.rm = TRUE)
  )
ggss$agegroup <- cut(
  ggss$age, 
  breaks = age_intervals,
  include.lowest = TRUE,
  labels = c("+35", "35-65", "66+")
  )
rm(age_intervals)

# region
ggss$region <- NA
ggss$region[ggss$v3 == "NEUE BUNDESLAENDER"] <- "east"
ggss$region[ggss$v3 == "ALTE BUNDESLAENDER"] <- "west"


# 1a) Generate a factor relig from variable v526. relig should 
#     take on the value "no" for respondents who report to  
#     never ("NIE") go to church and the value "yes" for those  
#     who report going to church at least some of the time 
#     (i.e., all other categories of v526, except "KEINE 
#     ANGABE"). Make sure to code missing values as NA.

ggss$relig = NA
ggss$relig[ggss$v526 == "NIE"] = "no"
ggss$relig[ggss$v526 != "NIE" & ggss$v526 != "KEINE ANGABE"] = "yes"
ggss$relig = as.factor(ggss$relig)

# 1b) Verify that you coded relig correctly.
table(ggss$relig)
ggss$relig[1:100]

# 2a) Create a data set ex5dt that contains only variables 
#     relig, income_1k, agegroup, and region.
ex5dt = ggss[,c("relig","income_1k","agegroup","region")]


# 2b) Save ex5dt in an external file in your data folder. Name
#     the file ex5-data.RData.
save(ex5dt, file = "data/ex5-data.RData")

# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R