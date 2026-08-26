#' A data frame of all quote by Rocky, excluding his non-translated vocalizations
rocky_quotes <- read.csv("~/Harvard/Teaching/PHS TF 2026-27/Bootcamp/get_rocky_quotes/rocky_quotes_df.csv")

# create new column that is 'true' if the quote starts with the word "you"
rocky_quotes['starts_with_you'] <-  grepl("^you ", rocky_quotes$quote)

# create new column that is 'true' if the quote ends with the word "question"
rocky_quotes['ends_question'] <-  grepl("question$", rocky_quotes$quote)

#' calculate: among Rocky's quotes where he starts with 'you...', what proportion 
#' end with ' question?'

starts_with_you <- rocky_quotes[rocky_quotes$starts_with_you, ]

p_question_GIVEN_you <- mean(starts_with_you$ends_question) # this is P(A|B)!
print(paste("The probability of Rocky asking a question, given that he starts his sentence with 'you', is",
            round(p_question_GIVEN_you, 4)))

# check that this equals P(A,B) / P(B)

p_question_AND_you <- mean(rocky_quotes$ends_question & rocky_quotes$starts_with_you)

p_you <- mean(rocky_quotes$starts_with_you)

print(paste("The probability of Rocky's sentence starting with 'you' AND ending with a question,",
            "divided by the probability of it starting with you, is:",
            round( p_question_AND_you/p_you, 
                   4)))
