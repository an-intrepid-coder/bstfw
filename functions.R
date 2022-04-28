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
# given the n trials and probability p of the event 
# occuring:
atLeast <- function(k, n, p) {
   return(pbinom(k - 1, n, p, lower.tail=FALSE))
}

