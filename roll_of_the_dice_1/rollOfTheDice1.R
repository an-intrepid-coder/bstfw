# Expanding on Chapter 4, Ex. 1 from "Bayesian Statistics the Fun Way"

exactly <- function(k, n, p) {
    return(choose(n, k) * (p^k) * ((1 - p)^(n-k)))
}

atLeast <- function(k, n, p) {
   return(pbinom(k - 1, n, p, lower.tail=FALSE))
}

# The probability of rolling a d20 and getting a 1 or 5:
p1 <- .1

# The book asks: "If you roll 12d20, what are the odds that you will get 
# a 1 or a 20?"

# The exercise is only to find the appropriate way to describe the
# problem using the nomenclature in the book, which is: "B(1; 12, 0.1)"
# according to the book's answer key. Using the lessons from the Chapter, 
# it can also be worked out further:

# There are 12 rolls of d20:
n <- 12

# If we assume the question to mean "exactly" one instance of rolling a
# 1 or a 20 then it is:
k <- 1
p2 <- exactly(k, n, p1)

# The wording in the question does not specify "at least" one instance of
# a 1 or a 20. But, if it did, then it could be calculated in the same way 
# as the example problem just before the exercises in the chapter.

# Computing according to the summation formula in the book for finding
# at least one instance of an event in a series:
# sum(B(k; n, p) = choose(n, k) * p^k * (1 - p)^(n-k) for all k in 1:n) :
p3 <- 0
for (i in 1:n) {
    p3 <- p3 + exactly(i, n, p1)
}

# Computing with pbinom for comparison. When lower.tail=FALSE, 
# it is summing the values greater than the first parameter, while
# if lower.tail=TRUE then it is summing the values less than or equal
# to the first parameter. To make it determine the chance for something
# happening at least once, it sums all values in 1:n.
p3a <- atLeast(1, n, p1)

# Note: Comparing p3 == p3a directly will return FALSE.
# Casting them to integers beforehand returns TRUE.
print(as.integer(p3) == as.integer(p3a)) # TRUE

# As demonstrated above, the method for computing 
# "at least x events out of n trials" in BStFW
# is consistent between the long-form method
# (demonstrated in the for-loop) and the pbinom()
# function.

# The results of the experiments:
data <- data.frame(
    "experiment"=c("exactly once", "at least once"), 
    "result"=c(p2, p3)
)
print(data)

