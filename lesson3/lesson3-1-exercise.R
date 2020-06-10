### Exercise 3.1

# Each sub-problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Run the following lines to read the data set from lesson 3:

library(rio)
library(haven)
soep <- data.frame(as_factor(read_dta("data/soep-extract-09.dta")))
soep <- spread_attrs(droplevels(gather_attrs(soep)))

# 1a) Use variables ybirth and ymove to create the variable 
#     age_moved measuring respondents' age at the time they 
#     moved into the place that they currently inhabit. Create
#     age_moved as a variable within soep. NA's on ymove or 
#     birthyear should be retained. If someone was born after 
#     the move-in date, their value should be zero. 

soep$age_moved = 0 # initialize the new column at 0 
soep$age_moved = soep$ymove - soep$ybirth # Subtracts their move date to their birth year which will return age of when they moved
# If either ymove or ybirth are NA, that index of aged_moved will also be NA
soep[which(soep$age_moved<0),]$age_moved = 0 # converts values below 0 to 0. Fulfills last requirement if born after move in date, value should be zero


# 1b) Verify that you created age_moved correctly (incl. 
#     missing values).

soep[1:100, c("ymove","ybirth","age_moved")] # Allows for the specific check of the first 100 instances 
summary(soep$age_moved) # Summary shows we have 92 NAs and the median of 32 and mean of 33.24


# 2a) Use variable polint to create a factor hi_polint 
#     indicating respondents with  much interest in politics. 
#     The factor should have two levels: "Yes" (corresponding 
#     to "Very much" and "much" interested in politics) and 
#     "No" (corresponding to "Not much" and "Not at all" 
#     interested in politics). Create hi_polint as a variable 
#     within soep. Make sure all missing values on polint are 
#     retained. 

soep$hi_polint = NA # initialize the new variable with NA to retain missing values 
soep[which(soep$polint == "Very much" | soep$polint == "Much"),]$hi_polint = "Yes"
soep[which(soep$polint == "Not much" | soep$polint == "Not at all"),]$hi_polint = "No"
soep$hi_polint = factor(soep$hi_polint)

# 2b) Verify that you created hi_polint correctly (incl.  
#     missing values).
soep[1:100, c("polint","hi_polint")] # Allows for the specific check of the first 100 instances 
summary(soep$hi_polint) # Summary shows we have 89 NAs 


# 3a) Use variable state to create a factor region indicating
#     whether a respondent lives in "East" or "West" Germany. 
#     Code Berlin as East Germany. Crate region as a variable 
#     within soep. 

soep$region = "West" # A summary of soep$state shows there are no NA values. This means it is not necessary to initialize the new variable with NA

which(is.na(soep$state)) # also seen here, there are no missing values in NA so there is no need to check for both lists of states

# Instead of checking conditions for the two lists of states, I check the conditions for the 5 original east states plus Berlin and everything else is automatically set to West by default
soep[which(soep$state == "Brandenburg" | soep$state == "Mecklenburg-V." | soep$state == "Saxony"| soep$state == "Saxony-Anhalt" | soep$state == "Thueringen" | soep$state == "Berlin"),]$region = "East"

#Create the factor 
soep$region = factor(soep$region)

# 3b) Verify that you created region correctly (incl. missing  
#     missing values).
soep[1:100, c("state","region")]
summary(soep$region)

# How to submit:

# Save this file using the last six digits of your 
# matriculation number and your family name as follows:

#                sixdigits-familyname.R

