# Handy functions for including in the R REPL which 
# are from Bayesian Statistics the Fun Way, or are 
# implied by it. This can be included in an R REPL 
# with source("functions.R").

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

# This wraps integrate() and dbeta() to return the
# probability that the true probability of an
# event is within lo:hi based on an observed
# number of successes and failures. It returns
# the probability of a probability.
pInRange <- function(s, f, lo, hi) {
    fn <- function(p) dbeta(p, s, f)
    return(integrate(fn, lo, hi)$value)
}

