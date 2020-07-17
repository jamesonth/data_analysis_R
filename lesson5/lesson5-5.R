##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 5.5
##########################


### Exporting all regression results


## Run all regression analyses

# Make sure to enlarge your graphics window before 
# executing the scripts below, or else you will get 
# the error message: "figure margins too large"

# run script for lesson 5.2
source("lesson5/lesson5-2.R", echo = TRUE)

# run script for lesson 5.3
source("lesson5/lesson5-3.R", echo = TRUE)

# run script for lesson 5.4
source("lesson5/lesson5-4.R", echo = TRUE)


### Table with regression results

library(stargazer)

# get a sense of how things will look
stargazer(model1, model2, model3, type = "text")

# informative variable names for regression table
varnames <- c(
  "Body height (cm)",
  "Male",
  "Age 35-65",
  "Age 66+",
  "Income (euros)",
  "Body height*male"
  )

# see how things are looking now
stargazer(
  model1, 
  model2, 
  model3, 
  type = "text",
  digits = 2,
  dep.var.labels = "Turnout at last election",
  covariate.labels = varnames
  )

# save the last table as html file
stargazer(
  model1, 
  model2, 
  model3, 
  type = "html",
  out = "results/vote_height.html", 
  digits = 2,
  dep.var.labels = "Turnout at last election",
  covariate.labels = varnames
  )
