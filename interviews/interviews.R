# Exercises 4 and 5 from Chapter 4:

source("../functions.R")

# The first scenario is asking what the
# chance of getting >=2 job offers in a month
# is, if the job seeker has a 1/5 chance of
# getting an offer from each interview and
# attends seven interviews.
pAtLeastTwoOffersIn7 <- atLeast(2, 7, 1/5)

# The second scenario ups the number of
# interviews/month to 25, and lowers the
# chance of getting an offer to 1/10.
pAtLeastTwoOffersIn25 <- atLeast(2, 25, 1/10)

# It asks the reader: Is the second scenario
# more likely?
secondScenarioMoreLikely <- pAtLeastTwoOffersIn25 > pAtLeastTwoOffersIn7

data <- data.frame(
    "experiment"=c(
        "p(first scenario)",
        "p(second scenario)",
        "p(first) > p(second)"
    ),
    "result"=c(
        pAtLeastTwoOffersIn7, 
        pAtLeastTwoOffersIn25,
        secondScenarioMoreLikely
    )
)

print(data)

