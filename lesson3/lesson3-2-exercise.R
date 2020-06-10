### Exercise 3.2

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Run the following lines to read the data set from lesson 3:

library(rio)
library(haven)
soep <- data.frame(as_factor(read_dta("data/soep-extract-09.dta")))
soep <- spread_attrs(droplevels(gather_attrs(soep)))

# 1. Sort the rows of soep (permanently) by dvisits, the 
#    number of annual doctoral visits, in descending order 
#    (starting with the most doctoral visits).
soep <- soep[order(soep$dvisits, decreasing = TRUE), ]             

# 2. Rename variable pib into party_id
names(soep)[names(soep)=="pib"] = "party_id"

# 3. Create a data frame soep_sat containing only the 
#    variables dsat, lsat, and hsat.
soep_sat = soep[,c("dsat","lsat","hsat")]

# How to submit:

# Save this file using the last six digits of your 
# matriculation number and your family name as follows:

#                sixdigits-familyname.R