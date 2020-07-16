### Exercise 5.2

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# 1. Load the data set ex5dt that you created in exercise 5.1.

load("data/ex5-data.RData")

# 2. Run a logit regression of religiousness (dependent variable)  
#    on income_1k (independent variable) and save your result in  
#    the object model1. Then summarize model1.

model1 = glm(relig~income_1k, data=ex5dt,
             family = binomial(link = "logit"))
summary(model1)

# 3. Load the margins package and use the function cplot() to 
#    draw the regression curve for model 1, i.e., the probability 
#    that someone attends church (y-axis) for different values of 
#    income_1k (x-axis).

library(margins)

cplot(model1)

# 4. Use the margins() function to compute the change in the 
#    probability that someone attends church for a change in
#    income_1k from its minimum to maximum. Display the result
#    of margins() with the summary() function.

summary(margins(model1, change = "minmax"))


# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R