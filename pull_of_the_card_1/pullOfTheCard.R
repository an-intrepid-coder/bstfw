# Exercise 2, Chapter 4 from BStFW:

# Exercise 2 asks how many ways you can draw 1
# Ace in 5 pulls (with replacement). The answer 
# given in the back of the book is 5, but that
# answer is not taking suits in to account.
# If taking suits in to account then the answer is 
# 20 because there are 4 ways to draw an Ace each 
# pull, and there are 5 pulls.

# Exercise 3 asks the probability of drawing
# exactly 5 aces in ten such pulls. I included 
# additional problems as well. All pulls are with
# replacement, so the drawn card is shuffled back
# in to the deck before the next one.

exactly <- function(k, n, p) {
    return(choose(n, k) * (p^k) * ((1 - p)^(n-k)))
}

deckSize <- 52

numAces <- 4

pDrawAce <- numAces / deckSize

pAtLeastOneAceInFivePulls <- pbinom(0, 5, pDrawAce, lower.tail=FALSE)

pExactlyOneAceInFivePulls <- exactly(1, 5, pDrawAce)

pAtLeastFiveAcesInTenPulls <- pbinom(4, 10, pDrawAce, lower.tail=FALSE)

pExactlyFiveAcesInTenPulls <- exactly(5, 10, pDrawAce)

data <- data.frame(
    "experiment"=c(
        "p(at least 1 Ace in 5 pulls)",
        "p(exactly 1 Ace in 5 pulls)",
        "p(at least 5 Aces in 10 pulls)",
        "p(exactly 5 aces in 10 pulls)"
    ),
    "result"=c(
        pAtLeastOneAceInFivePulls,
        pExactlyOneAceInFivePulls,
        pAtLeastFiveAcesInTenPulls,
        pExactlyFiveAcesInTenPulls
    )
)

print(data)

