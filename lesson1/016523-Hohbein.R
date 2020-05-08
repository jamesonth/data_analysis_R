### Exercise 1

# Each problem is worth 1 point. No partial credit, 
# answers must be complete and entirely correct. Write in
# your solution below each problem. We only need your R 
# code, not your results!

# 1. Create an object b that contains your birthyear.
b<-1996
# 2. Test whether your birthyear minus 2000 is zero.
b-2000==0

# Run the following lines to read the data set from lesson 1

library(rio)
library(haven)
soep <- data.frame(as_factor(read_dta("data/soep-extract-09.dta")))
soep <- spread_attrs(droplevels(gather_attrs(soep)))

# Using the data set soep: 

# 3. Produce a two-way frequency table of marital status by
#    gender, based on the variables "sex" and "mar". Make
#    sure the tabulation includes NAs.
addmargins(table(soep$sex , soep$mar, useNA = c("always")))
# 4. Compute the median birth year, based on the variable
#    "ybirth".
median(soep$ybirth)


# How to submit:

# Save this file using the last six digits of your 
# matriculation number and your family name as follows:

#                sixdigits-familyname.R
