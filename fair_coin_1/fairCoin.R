# Exercises 1-3, Ch. 5 from BStFW. These exercises
# ask the reader to use the beta distribution,
# as described in the chapter, to determine if a
# coin toss is fair. It gives the observed data so
# far as: 4 heads and 6 tails. The subsequent 
# exercises build on that, and I've merely followed 
# along here.

# The observed data so far:
heads <- 4
tails <- 6

# This wraps integrate() and dbeta() to return the
# probability that the true probability of an
# event is within [lo, hi] based on an observed
# number of successes and failures. It returns
# the probability of a probability.
pInRange <- function(s, f, lo, hi) {
    fn <- function(p) dbeta(p, s, f)
    return(integrate(fn, lo, hi)$value)
}

# This function wraps pInRange with bounds of
# [.45, .55]. This is a rough approximation of
# fairness. 
fairness <- function(a, b) {
    return(pInRange(a, b, .45, .55))
}        

# Exercise 1 asks the reader: "What is the 
# probability that the probability of getting 
# heads is greater than 60%?" It should be pretty 
# low, since the rate of success so far is 40%.
p1 <- pInRange(heads, tails, .6, 1) # about 10%

# I don't know much about calculus or integrals,
# yet, but I assume here that the amount of
# granularity is relative, regarding how close
# to > .6 you want to measure: .61? .60000001?

# To keep things clear, I just decided to use .6 
# inclusive, and to use inclusive values in general 
# here. I'm not sure if that's the right approach in
# all cases.

# The next exercise has the coin flip ten more 
# times, until it is 9 heads and 11 tails.
# It than asks if the coin seems fair within a 
# margin of error of 5%.
heads <- 9
tails <- 11
p2 <- fairness(heads, tails) # about 31%

# Finally, it increases the results from 109 to 111.
# And the next exercise repeats the question:
heads <- 109
tails <- 111
p3 <- fairness(heads, tails) # about 86%

data <- data.frame(
    "experiment"=c(
        "p(p(heads) >= .6))",
        "p(fair coin | 9H, 11T)",
        "p(fair coin | 109H, 111T)"
    ),
    "result"=c(
        p1,
        p2,
        p3
    )    
)

print(data)

