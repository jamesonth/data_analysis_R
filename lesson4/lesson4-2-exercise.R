### Exercise 4.2

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# 1. Load the data set ex4dt that you created in exercise 4.1.
load("data/ex4-data.RData")

# 2. Compute the Pearson correlation coefficient between ideology  
#    and income_1k.
cor(ex4dt$ideology, ex4dt$income_1k, use = "complete.obs")  


# 3. Run a linear regression of ideology (dependent variable) on  
#    income_1k (independent variable) and save your result in the 
#    object model1. Then summarize model1.
model1 = lm(ex4dt$ideology ~ ex4dt$income_1k) 

summary(model1) 

# 4. Draw a scatterplot of ideology (y-axis) on income_1k (x-axis)
#    and superimpose the regression line from model1.
plot(ideology ~ income_1k, data = ex4dt)
abline(model1)

# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R