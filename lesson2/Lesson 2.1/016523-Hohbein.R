### Exercise 2.1

# Each problem is worth 1 point. No partial credit, answers
# must be complete and entirely correct. Write your solution
# below each problem. We only need your R code, not your 
# results!

# Run the following lines to create vectors coins and tbbt:

coins <- c(20, 5, 50, 2, 2, 10, 10, 5, 1, 1, 5)
tbbt <- c("Leonard", "Penny", "Sheldon", "Amy", 
          "Raj", "Howard", "Bernadette")

# 1. Suppose you didn't know the content of coins. Create a 
#    vector coppers that contains all elements of coins whose 
#    value is below 10.

coppers <- coins[coins<10]

# 2. Write on line of code to determine how many coppers are 
#    fives. 
sum(coppers==5)


# 3. Replace all elements of coppers whose value is below 2 
#    with the value zero.
coppers[coppers<2] = 0

# 4. From tbbt select the names of all characters who are 
#    physicists in the TV series The Big Bang Theory (hint: 
#    their initials are L, S, and R) and store their names in 
#    the vector physicists.

physicists <- tbbt[tbbt == "Leonard" | tbbt == "Sheldon" | tbbt == "Raj"]

# 5. Assign names to the elements of coppers. Use the vector 
#    tbbt as names.

names(coppers) = tbbt

# 6. Select from coppers the elements "Sheldon" and "Leonard".
#    Select both values at once, not each one individually.

coppers[names(coppers) %in% c("Leonard","Sheldon")]

# 7. Below is an example of bad coding style. Use a different
#    function to produce the same result in a shorter and more
#    readable way.

c(tbbt, tbbt, tbbt, tbbt, tbbt, tbbt, tbbt)

rep(tbbt,7)


# How to submit:

# Save this file using the last six digits of your 
# matriculation number and your family name as follows:

#                sixdigits-familyname.R
