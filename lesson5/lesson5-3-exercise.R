### Exercise 5.3

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Load the data set ex4dt that you created in exercise 5.1 
# like so:

load("data/ex5-data.RData")

# 1. Run a logit regression of religiousness (dependent  
#    variable) on income_1k (independent variable), while 
#    controlling for agegroup (independent variable) and 
#    region (independent variable), and save your result 
#    in the object model2. Then summarize model2.

model2 = glm(relig~income_1k+agegroup+region,  
             family = binomial(link = "logit"),
             data = ex5dt)

summary(model2)

# From the result we can see that higher income is still 
# associated with religiosness, but the effect is weaker
# than in model1 because we've adjusted for east-west 
# differences (i.e., people in East Germany have lower 
# incomes, and they tend to be less religious than people 
# in the west) and for age (i.e., older people tend to
# have higher incomes than young people and they tend to 
# be more religious).

# 2. Now let's see how big these effects are. Load the 
#    margins package and use the function cplot() to draw
#    the regression curves for every variable of model2 
#    (i.e., draw three plots: one that has income on the 
#    x-axis, one that has age, and one that has region on
#    the x-axis). In each plot, restrict the y-axis to 
#    run from 0.2 to 1.

library(margins)

cplot(model2, x="income_1k", ylim=c(0.2,1) )

cplot(model2, x="agegroup", ylim=c(0.2,1))

cplot(model2, x="region", ylim=c(0.2,1))

# So income still seems to have a substantial effect on
# religiousness, but by far the biggest difference is 
# between East and West Germans.

# 3. To see these differences more clearly, use the 
#    margins() function to compute the change in the 
#    probability that someone attends church for a 
#    change in each of the independent variables from
#    its minimum to maximum. Display the result of
#    margins() with the summary() function.

summary(margins(model2, change = "minmax"))

# 4. Use a likelihood ratio test to test if age as a
#    whole makes a significant contribution to the
#    model. To do this, estimate a model that excludes
#    agegroup. Call this model reduced and then perform
#    a likelihood ratio test of reduced vs. model2.

reduced <- glm(
  relig ~ income_1k+region,
  family = binomial(link = "logit"),
  data = model.frame(model2)
)

library(lmtest)
waldtest(model2, reduced)
lrtest(model2, reduced)

# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R
