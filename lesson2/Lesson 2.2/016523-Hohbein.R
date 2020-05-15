### Exercise 2.2

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Run the following lines to create factors party and approve:

set.seed(123)
party <- factor(
  sample(c("Dem", "none", "Rep"), 222, replace = TRUE)
  )
set.seed(123)
approve <- factor(
  sample(c(-5:5), 222, replace = TRUE)
  )

# 1. Suppose party is a variable measuring the partisanship of 
#    a sample of 222 survey respondents. The response options 
#    are "Dem"(ocrat), "none", and "Rep"(ublican). Change the 
#    category "none" to "Ind" so that the result is a factor 
#    party with outcome categories "Dem", "Ind", "Rep". Do NOT 
#    use the function levels() to achieve this!

party = as.character(party)
party[party=="none"] = "Ind"
party = factor(party)



# 2. Suppose approve is a variable measuring government 
#    approval on a scale from -5 to 5. This variable shouldn't 
#    be a factor, but unfortunately it is. Write one line of 
#    code to turn approve into a numeric vector with values 
#    running from -5 to 5.

approve = as.numeric(as.character(approve))


# How to submit:

# Save this file using the last six digits of your 
# matriculation number and your family name as follows:

#                sixdigits-familyname.R