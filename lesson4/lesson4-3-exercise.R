### Exercise 4.3

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Load the data set ex4dt that you created in exercise 4.1 
# like so:

load("data/ex4-data.RData")

# 1. Run a linear regression of ideology (dependent variable)   
#    on income_1k (independent variable), while controlling 
#    for region (independent variable), and save your result 
#    in the object model2. Then summarize model2.

model2 = lm(ideology ~ income_1k + region, data=ex4dt)
summary(model2)


# From the result we can see that higher income is still 
# associated with self-placements further to the right, but
# the effect is weaker than in model1, because we've 
# adjusted for east-west differences (i.e., people in East 
# Germany have lower incomes and they tend to be more left 
# leaning than people in the east).

# 2. Now let's test if the effect of income on ideology is
#    truly linear: run a linear regression of ideology 
#    (dependent variable) on incgroup (independent 
#    variable), while controlling for region (independent 
#    variable), and save your result in the object 
#    model2_cat. Then summarize model2_cat.

model2_cat = lm(ideology ~ incgroup + region, data=ex4dt)
summary(model2_cat)

# Apparently, people with higher incomes place themselves 
# further to the right, on average, than people with low 
# incomes. People in the mid-income range place themselves 
# further to the right, on average, than people with low
# incomes, but not as much as high-income people. That's 
# the pattern we would expect if income has a steady
# effect on political ideology.

# 3. We can see that the difference between high and low
#    incomes is significant at the 5 percent level. The 
#    difference between mid and low incomes is not. What 
#    about the difference between high and mid incomes? 
#    Change the reference category of incgroup to "mid"
#    and re-run model2_cat. Save your result in the object
#    model2_cat_alt and summarize model2_cat_alt.

model2_cat_alt = lm(ideology ~ relevel(incgroup, "mid") + region, data=ex4dt)
summary(model2_cat_alt)


# Overall, the evidence for differences in ideology by
# income group is not overwhelming (one contrast is 
# significant, another is marginally significant, the
# third is insignificant).

# 4. Let's test if our entire grouping of income into 
#    low, mid, and high helps explain ideology. To do 
#    this, estimate a model that excludes incgroup and
#    then perform a Wald test of this model vs. 
#    model2_cat.

reduced <- lm(ideology ~ region, data = model.frame(model2_cat))

library(lmtest)
waldtest(model2_cat, reduced)

# incgroup is marginally significant: we can reject the
# hypothesis of no income differences in ideology at the
# 10 percent level. It seems the effect of income on 
# ideology is mostly driven by high income people placing
# themselves further to the right.


# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R
