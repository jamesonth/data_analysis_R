##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 4.3
##########################


### Linear regression II

#   - multiple regression analysis
#   - categorical predictor variables
#   - interpretation and testing



## Load data for analysis

load("data/ggss.RData")


## Multiple Regression

# controlling for gender and age differences
model2 <- lm(income ~ height + gender + agegroup, data = ggss)
summary(model2)


## Interpretation

# Effect of body height:

# "Holding gender and age constant, each additional cm of 
# body height is associated with an increase in monthly net 
# income of 22 euros, on average. The effect is 
# statistically significant at the 5 percent level."

# Effect of gender:

# "Holding body height and age constant, men make 283 euros
# more each month, on average, than women do. The difference
# is statistically significant at the 5 percent level."


# Effect of age:

# "Holding body height and gender constant, people between
# 35 and 65 years of age make 590 euros more each month, on 
# average, than people under 35 do."

# "Holding body height and gender constant, people over 65
# years of age make 344 euros more each month, on average,
# than poeple under 35 do."

# "Both contrasts are statistically significant at the 5
# percent level."

# changing the base category for agegroup to "66+":
summary(
  lm(
    income ~ height + gender + relevel(agegroup, "66+"), 
    data = ggss
    )
  )

# "Holding body height and gender constant, people between
# 35 and 65 years of age make 245 euros more each month, on
# average, than people over 65 do. The difference is 
# statistically significant at the 5 percent level.


# Testing for overall significance of age

# H0: all coefficients of agegroup are equal to zero
# H1: at least one coefficient is not equal to zero

# fit a model without agegroup
reduced <- lm(
  income ~ height + gender, 
  data = model.frame(model2)
  )

# Note that the reduced model must be estimated on the same 
# data as the full model. This can be achieved by 
# restricting the sample to those observations that were 
# used in the estimation of model 2 (i.e. the "model frame" 
# of model 2).

# test of H0
library(lmtest)
waldtest(model2, reduced)

# The difference in model fit is statistically significant 
# at the 5 percent level. We can reject the null hypothesis 
# that all coefficients of agegroup are equal to zero. We  
# thus conclude that age has a significant effect on income.
