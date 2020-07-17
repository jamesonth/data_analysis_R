### Exercise 5.4

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Load the data set ex5dt that you created in exercise 5.1
# like so:

load("data/ex5-data.RData")

# 1. Does the effect of income on religiousness differ by 
#    region? Test this hypothesis by running a logit 
#    regression of religiousness (dependent variable) on 
#    the interaction of income_1k (independent variable) 
#    and region (independent variable), while controlling 
#    for agegroup (independent variable, not interacted). 
#    Save your result in the object model3 and summarize 
#    model3.

model3 = glm(relig~income_1k*region+agegroup,
             family = binomial(link="logit"),
             data=ex5dt)

summary(model3)

# There is a significant east-west difference in the 
# effect of income on religiousness. The effect seems to 
# be mainly driven by East Germans.

# 2. To see this, re-estimate the model such that the 
#    effects of income in each group are being estimated 
#    directly. Save your result in the object model3_alt
#    and summarize model3_alt.


model3_alt = glm(
  relig ~ income_1k:region +region+ agegroup,
  family = binomial(link = "logit"),
  data = ex5dt
)


summary(model3_alt)

# Among East Germans the effect of income on 
# religiousness is strong and significantly different
# from zero at the 5 percent level. Among West Germans    
# the effect is considerably smaller and not  
# significantly different from zero at the 5 percent 
# level.

# 3. Let's see how big these effects are. Load the 
#    margins package and use the function cplot() to 
#    draw the regression curves of income_1k in model3 
#    separately for East and West Germans. In each plot, 
#    restrict the y-axis to run from 0 to 1.

library(margins)

#east
cplot(model3, x="income_1k", ylim=c(0,1),
      data=ex5dt[ex5dt$region=="east",])

#west
cplot(model3, x="income_1k", ylim=c(0,1),
      data=ex5dt[ex5dt$region=="west",])

# 4. Now use the margins() function to compute the change 
#    in the probability that someone attends church for a 
#    change in each of the independent variables from its 
#    minimum to maximum. Compute two sets of effects: one 
#    for East Germans and one for West Germans and store  
#    them in separate objects called effeast and effwest.  
#    Display both objects with the summary() function.


effeast = margins(model3, change = "minmax",data=ex5dt[ex5dt$region=="east",])

effwest = margins(model3,change="minmax",data=ex5dt[ex5dt$region=="west",])

summary(effeast)
summary(effwest)


# How to submit:

# Save this file using the last six digits of your matriculation
# number and your family name as follows:

#                sixdigits-familyname.R
