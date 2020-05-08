##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 1
##########################


### Interacting with R

# To execute a line of code:  CTRL + Return
# On a German keyboard:  Strg + Return
# On a Mac:  Cmd + Return


# simple arithmetic input
10 - 5
4^2
20 / 4 + 4^2
4 + 4 *             # input running over two lines
  3             
# arithmetic operators:  +  -  *  /  ^  


# logical statements
10 < 5
10 + 5 == 15
10 + 5 <= 15
1 + 1 != 1
2 > 1 & 7 > 3
2 < 1 | 7 > 3
# logical and relational operators: 
#  <  >  >=  <=  ==  !=  & (AND)  | (OR)  ! (NOT)  %in% (MEMBER OF)


## Assignment
x <- log(5)
x
# "gets-operator": <- 
# The object x now exists and can be called at any time within the 
# session (note: you can also use = in place of <- but this is not 
# recommended)



### Working with data

## Loading a data set (written in Stata's format)
library(rio)    # load package
library(haven)  # load package
soep <- data.frame(as_factor(read_dta("data/soep-extract-09.dta")))
soep <- spread_attrs(droplevels(gather_attrs(soep)))


### Inspecting the data set

# Displaying variables and values
dim(soep)       # number of observations (rows) and variables (columns)
View(soep)      # data as spreadsheet

# selecting variables
soep$emp        # variable: employment status
names(soep)     # all variable names at a glance


### Inspecting individual variables

## one-way frequency tables

# employment status
table(soep$emp, useNA = "always")

# frequencies as proportions
prop.table(table(soep$emp, useNA = "always"))


## two-way frequency tables

# employment status by gender
table(soep$sex, soep$emp, useNA = "always")

# frequencies as (row) proportions
prop.table(table(soep$sex, soep$emp, useNA = "always"), margin = 1)


## mean, median, and spread of income
soep$income
median(soep$income, na.rm = TRUE)
IQR(soep$income, na.rm = TRUE)
range(soep$income, na.rm = TRUE)
mean(soep$income, na.rm = TRUE)
sd(soep$income, na.rm = TRUE)

# if one or more values of income are NA, the entire result is NA
mean(soep$income)  

# summary statistics for income
summary(soep$income)  

# for categorical variables (like employment), summary returns a table
summary(soep$emp)


## Inspecting variables graphically

# categorical variables
plot(soep$emp, col = "lightblue")

# quantitative variables
hist(soep$ybirth, col = "lightblue")



### Regression analysis: gender wage gap

# regression of income on gender and employment status
lm(income ~ emp + sex, data = soep)

# more detailed results
summary(lm(income ~ emp + sex, data = soep))


