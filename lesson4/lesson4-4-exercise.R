### Exercise 4.4

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Load the data set ex4dt that you created in exercise 4.1.
# like so:

load("data/ex4-data.RData")

# 1. Does the effect of income on ideology differ by region?
#    Test this hypothesis by running a linear regression of
#    ideology (dependent variable) on the interaction of 
#    income_1k (independent variable) and region (independent
#    variable). Save your result in the object model3 and
#    summarize model3.

model3 = lm(ideology ~ income_1k * region, data=ex4dt)
summary(model3)

# There is no significant east-west difference in the effect
# of income on ideology. Still, the model suggests that the 
# effect is more than twice as large in the west. 

# 2. To see this, re-estimate the model such that the 
#    effects of income in each group are being estimated 
#    directly. Save your result in the object model3_alt and
#    summarize model3_alt.

model3_alt = lm(ideology ~ income_1k:region, data=ex4dt)
summary(model3_alt)



# Among East Germans the effect of income on ideolgy is weak
# and not significantly different from zero at the 5 percent
# level. Among West Germans the effect is considerably 
# stronger and significantly different from zero at the 5
# percent level. Although the two effects do not differ 
# from each other significantly at the 5 percent level, 
# these results nevertheless suggest that the effect of 
# income on ideology is driven mainly by West Germans. 


# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R
