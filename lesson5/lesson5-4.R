##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 5.4
##########################


### Logistic regression III

#   - interaction
#   - interpretation


## Load data for analysis

load("data/ggss-lesson5.RData")


## Interaction

# Does the effect of body height on turnout, perhaps, 
# differ between men and women?

model3 <- glm(
  turnout ~ height * gender + agegroup + income,
  family = binomial(link = "logit"), 
  data = ggss
  )
summary(model3)


## Interpretation

# store coefficients
beta <- coef(model3)

# coefficient of height for women
beta["height"]

# coefficient of height for men
beta["height"] + beta["height:gendermale"]

# we can also estimate these coefficients directly
model3_alt <- glm(
  turnout ~ height:gender + gender + agegroup + income,
  family = binomial(link = "logit"),
  data = ggss
  )
summary(model3_alt)

# Note

# model3 and model3_alt are mathematically and 
# substantively equivalent. model3 allows for testing 
# whether the coefficient of height differs significantly  
# between men and women; model3_alt is easier to
# interpret as it shows the coefficients of body height  
# directly for men and women, and it allows you to test
# whether each coefficient is different from zero.


# We know that the coefficients do not have an intuitive
# interpretation. To better understand the estimated
# effects of body height, we

# 1. plot the regression curve
# 2. calculate how much the regression curve changes for  
#    a maximum change in body height. 

# Since there are two coefficients of body height, one 
# for men and one for women, we do both steps separately 
# for each group.

library(margins)


# 1. plot the regression curve

# men
cplot(
  model3,
  x = "height", 
  data = ggss[ggss$gender == "male", ],
  ylim = c(0, 1)
  )

# women
cplot(
  model3, 
  x = "height", 
  data = ggss[ggss$gender == "female", ],
  ylim = c(0, 1)
  )

# 2. calculate effect of a maximum change in height

# men
effmen <- margins(
  model3, 
  change = "minmax", 
  data = ggss[ggss$gender == "male", ]
  )

# women
effwomen <- margins(
  model3, 
  change = "minmax", 
  data = ggss[ggss$gender == "female", ]
  )

summary(effmen)
summary(effwomen)

# "Among men, an increase in body height from the
# smallest to the largest observed value is associated 
# with a decrease in the probability of voting by only
# 1.2 percentage points, on average, holding all other 
# variables constant at observed values."

# "Among women, an increase in body height from the 
# smallest to the largest observed value is associated 
# with an increase in the probability of voting by only 
# 20.2 percentage points, on average, holding all other 
# variables constant at observed values."

# To describe the effects of age and income, it's best 
# to use the entire sample.

summary(margins(model3, change = "minmax"))
