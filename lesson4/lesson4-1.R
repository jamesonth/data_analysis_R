##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 4.1
##########################


### Data preparation

#   - coding dependent and independent variables   
#   - selecting cases and variables
#   - storing the modified data for analysis



### Data preparation

## Load data set

library(haven)
library(rio)
ggss <- data.frame(as_factor(read_dta("data/allbus-extract-07.dta")))
ggss <- spread_attrs(droplevels(gather_attrs(ggss))) 


## Restrict sample to German citizens

summary(ggss$v4)
ggss <- ggss[ggss$v4 %in% c("JA", "JA,NEBEN ZWEITER"), ]
summary(ggss$v4)


## Dependent variable (income)

summary(ggss$v388)
class(ggss$v388)
# to display all values of v388
table(ggss$v388, useNA = "always")    

# create a numeric income variable
ggss$income <- ggss$v388              
ggss$income[
  ggss$v388 %in% c("KEIN EINKOMMEN", "VERWEIGERT", "KEINE ANGABE")
  ] <- NA
ggss$income <- as.numeric(as.character(ggss$income))

# check coding
ggss[1:100, c("v388", "income")]


## Independent variables

# Body height

# v629 is a factor
summary(ggss$v629)
class(ggss$v629)

# create a numeric body height variable
ggss$height <- ggss$v629
ggss$height[ggss$v629 == "WEISS NICHT"] <- NA
ggss$height <- as.numeric(as.character(ggss$height))

# check coding
ggss[1:100, c("v629", "height")]


# Gender

# v151 is a factor
summary(ggss$v151)

# create a factor variable for gender
ggss$gender <- NA
ggss$gender[ggss$v151 == "MANN"] <- "male"
ggss$gender[ggss$v151 == "FRAU"] <- "female"
ggss$gender <- factor(ggss$gender)

# check coding
table(ggss$v151, ggss$gender, useNA = "always")


# Age

# v154 is a factor
summary(ggss$v154)

# create a numeric age variable
ggss$age <- ggss$v154
ggss$age[ggss$v154 == "KEINE ANGABE"] <- NA
ggss$age <- as.numeric(as.character(ggss$age))

# create a factor variable for the young, mid-aged, and old
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

# check coding
ggss[100:300, c("v154", "age", "agegroup")]


## Keep variables needed in analysis

ggss <- ggss[, c("income", "height", "gender", "agegroup")]


## Save the modified data for subsequent analyses

save(ggss, file = "data/ggss.RData")
  
