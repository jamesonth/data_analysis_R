##########################
# Data Analysis with R
# Michael Herrmann
# University of Konstanz
# Lesson 4.2
##########################


### Linear regression I

#   - bivariate regression analysis
#   - interpretation and visualization
#   - exporting results



## Load data for analysis

load("data/ggss.RData")


## Bivariate regression analysis

# correlation of income and height

cor(ggss$height, ggss$income, use = "complete.obs")  
cor(ggss[, c("height", "income")], use = "complete.obs")

# linear regression

lm(income ~ height, data = ggss) 

model1 <- lm(income ~ height, data = ggss) 
summary(model1) 

# confidence intervals for coefficients
confint(model1)

# N and number of vars used
nrow(model.frame(model1))

# data used in the estimation
model.frame(model1)

# the coefficients (as a named vector)
coef(model1)

# variance covariance matrix of coefficients
vcov(model1)


## Interpretation and visualization

summary(model1)

# "Each additional cm of body height is associated with an 
# increase in net monthly income of 31 euros, on average."

# "The effect of body height on income is statistically 
# significant at the 5 percent level."

# scatterplot including the regression line
plot(income ~ height, data = ggss)
abline(model1)



## Exporting results

# Graphs

# open a pdf file
pdf("results/inc-hgt-m1.pdf", width = 8, height = 6)

# Other good graphics formats:
# postscript("results/inc-hgt-m1.eps", width = 8, height = 6)
# win.metafile("results/inc-hgt-m1.wmf", width = 8, height = 6)

# draw the plot into the file
plot(income ~ height, data = ggss)
abline(model1)

# close the pdf file
dev.off()


# Regression tables

library(stargazer)

stargazer(model1, type = "text")

stargazer(
  model1, 
  type = "text", 
  dep.var.labels = "Monthly net income (euros)", 
  covariate.labels = "Body height (cm)", 
  digits = 2
  )

# This looks better and can be copied and pasted into your 
# document or an email (to your instructor or supervisor).
# But if you do this, you won't be able to edit the table 
# anymore. To get a fully editable table, do this:

# 1. Save the stargazer table as an html file (see below)
# 2. Open the html file and copy and paste the table from 
#    the browser window into your document (MS Word or other)

stargazer(
  model1, 
  type = "html",
  out = "results/inc-hgt-m1.html", 
  dep.var.labels = "Monthly net income (euros)", 
  covariate.labels = "Body height (cm)", 
  digits = 2
  )

# Stargazer works best for those who use LaTeX to typset their 
# documents. Just select type = "latex" to get the table in 
# latex code.
