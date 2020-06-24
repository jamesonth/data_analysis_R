### Exercise 4.1

# Each sub-problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!


# Does political ideology correlate with personal income?

# Run the following lines to load the ALLBUS data set:

library(haven)
library(rio)
ggss <- data.frame(as_factor(read_dta("data/allbus-extract-07.dta")))
ggss <- spread_attrs(droplevels(gather_attrs(ggss))) 


# 1a) Generate a numeric variable ideology from variable v106. 
#     ideology should range from 1 to 10 with higher values 
#     indicating ideological self-placements further to the right. 
#     Make sure to code missing values on ideology as NA.


ggss$ideology <- ggss$v106
ggss$ideology[ggss$v106 == "KEINE ANGABE"] <- NA
ggss$ideology <- as.numeric(ggss$ideology)

# 1b) Verify that you coded ideology correctly.

summary(ggss$ideology)
ggss[1:100, c("v106", "ideology")]

# 2a) Re-create the variable income from lesson 4 (i.e., use the code
#     lesson 4.1 to create the variable income). Now rescale income 
#     to thousand euros. Store the result in a new variable that you 
#     call income_1k. Make sure that missing values on income are 
#     retained.

ggss$income <- ggss$v388              
ggss$income[
  ggss$v388 %in% c("KEIN EINKOMMEN", "VERWEIGERT", "KEINE ANGABE")
  ] <- NA
ggss$income <- as.numeric(as.character(ggss$income))

ggss$income_1k = ggss$income / 1000 # scale it by 1000

# 2b) Verify that you created income_1k correctly.
summary(ggss$income_1k)
ggss[1:100, c("v388", "income_1k")]

# 3a) Generate a factor incgroup from income. incgroup should 
#     distinguish three groups of people: those with incomes up to 
#     1000 euros, those with incomes above 1000 to 2000 euros and 
#     those with incomes above 2000 euros. Label the three groups 
#     "low", "mid", and "high". Make sure that missing values on 
#     income are retained.

income_intervals <- c(0,1000,2000,max(ggss$income, na.rm = TRUE))

ggss$incgroup <- cut(
  ggss$income, 
  breaks = income_intervals,
  include.lowest = TRUE,
  labels = c("low", "mid", "high")
)
rm(income_intervals)

# 3b) Verify that you coded incgroup correctly.
ggss[100:300, c("income", "incgroup")]
summary(ggss$incgroup)

# 4a) Create a factor region, which is variable v3 translated to
#     English. Label the outcome categories "east" (for NEUE 
#     BUNDESLAENDER) and "west" (for ALTE BUNDESLAENDER). 
ggss$region <- NA
ggss$region[ggss$v3 == "ALTE BUNDESLAENDER" ] <- "west"
ggss$region[ggss$v3 == "NEUE BUNDESLAENDER"] <- "east"
ggss$region <- factor(ggss$region)

# 4b) Verify that you coded region correctly.
ggss[1:100, c("v3", "region")]
summary(ggss$region)

# 5a) Create a data set ex4dt that contains only variables ideology
#     income_1k, incgroup, and region. 

ex4dt <- ggss[, c("income_1k", "ideology", "incgroup", "region")]

# 5b) Save ex4dt in an external file in your data folder. Name the
#     file ex4-data.RData.
save(ex4dt, file = "data/ex4-data.RData")


# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R