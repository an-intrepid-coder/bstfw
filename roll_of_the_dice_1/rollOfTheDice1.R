# Expanding on Chapter 4, Ex. 1 from "Bayesian 
# Statistics the Fun Way"

# Returns B(k; n, p).
# Or, the chance of exactly k events occurring in 
# n trials with probability p:
exactly <- function(k, n, p) {
    return(choose(n, k) * (p^k) * ((1 - p)^(n-k)))
}

# Returns sum(B(k; n, p) for all k in 1:n).
# Or, the chance of at least k events happening
# given n trials and probability p of the event 
# occuring:
atLeast <- function(k, n, p) {
   return(pbinom(k - 1, n, p, lower.tail=FALSE))
}

# When lower.tail=FALSE, it is summing the values 
# greater than the first parameter, while if 
# lower.tail=TRUE then it is summing the values less
# than or equal to the first parameter. To make it 
# determine the chance for something happening at 
# least once, it sums all values in 1:n.

# The book asks: "If you roll 12d20, what are the 
# odds that you will get a 1 or a 20?"

# The probability of rolling a single d20 and 
# getting a 1 or 5:
p1 <- .1

# The exercise is only to find the appropriate way 
# to describe the problem using the nomenclature in 
# the book, which is: "B(1; 12, 0.1)" according to 
# the book's answer key. Using the lessons from the 
# Chapter, it can also be worked out further:

# There are 12 rolls of d20. If we assume the 
# question to mean "exactly" one instance of 
# rolling a 1 or a 20 then it is:
rolls <- 12
successes <- 1
p2 <- exactly(successes, rolls, p1)

# The wording in the question does not specify "at 
# least" one instance of a 1 or a 20. But, if it 
# did, then it could be calculated in the same way 
# as the example problem just before the exercises 
# in the chapter.

# Computing according to the summation formula in 
# the book for finding at least one instance of an 
# event in a series: 
#   sum([choose(n, k) * p^k * (1 - p)^(n-k)]
#       for all k in [1,rolls])
p3 <- 0
for (i in 1:rolls) {
    p3 <- p3 + exactly(i, rolls, p1)
}

# Computing with atLeast for comparison:
p3a <- atLeast(successes, rolls, p1)

# Note: Comparing p3 == p3a directly will return 
# FALSE. You must use all.equal() to compare 
# floating point numbers:
all.equal(p3, p3a) # TRUE
        
# As demonstrated above, the method for computing 
# "at least x events out of n trials" in BStFW
# is consistent between the long-form method
# (demonstrated in the for-loop) and the pbinom()
# function (wrapped in atLeast()).

# The results of the experiments:
data <- data.frame(
    "experiment"=c(
        "p(exactly once)", 
        "p(at least once)-A", 
        "p(at least once)-B"
    ),
    "result"=c(
        p2, 
        p3,
        p3a
    )
)

print(data)

