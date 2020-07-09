##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 4.4
##########################


### Linear regression III

#   - interaction
#   - interpretation



## Interaction

# Does the effect of body height on income differ between 
# men and women?

# So far we assumed the effect of body height to be the
# same for everyone. But perhaps the effect is different
# for men and women. We can test whether the effect of
# body height differs between men and women by interacting 
# height and gender.


## Load data for analysis

load("data/ggss.RData")


## Interaction of height and gender

model3 <- lm(
  income ~ height * gender + agegroup, 
  data = ggss
  )
summary(model3)

# also this way
also_model3 <- lm(
  income ~ height + gender + height:gender + agegroup, 
  data = ggss
  )
summary(also_model3)


## Interpretation

# store coefficients
beta <- coef(model3)
beta

# effect of height among women
beta["height"]

# effect of height among men
beta["height"] + beta["height:gendermale"]

# we can also estimate these effects directly
model3_alt <- lm(
  income ~ gender + height:gender + agegroup, 
  data = ggss
  )
summary(model3_alt)

# Interpretation

# "For each additional cm of body height, income  
# increases by 24 euros among women and 20 euros among   
# men, on average. Each effect is statistically   
# significant at the 5 percent level. The difference 
# between the two effects, however, is not statistically 
# significant at the 5 percent level."

# Note

# model3 and model3_alt are mathematically and  
# substantively equivalent. model3 allows for testing 
# whether the effect of height differs significantly  
# between men and women; model3_alt is easier to 
# interpret as it shows the effects of body height  
# directly for men and women, and it allows you to test
# whether each effect is different from zero.
