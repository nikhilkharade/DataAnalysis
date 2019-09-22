#  Install Requried Packages
#installed.packages("SnowballC")
#installed.packages("tm")
#install.packages("twitteR")
#installed.packages("syuzhet")

# Load Requried Packages
library("SnowballC")
library("tm")
library("twitteR")
library("syuzhet")

consumer_key <- 'OfqLaY0tbHmJCMinb8wHZ01v8'
consumer_secret <- 'AuYWOk0NAqPfIsVJ4PqrBCLew2gGXqJ2BmrBj9vRibxPGaPo3U'
access_token <- '1001147315774619648-XPTtMs4HXiE815usTldVx96JSaqS7k'
access_secret <- 'RX2GWyhExJ7GHe8SFywiQboF5icqVQavNInmUUArGNk50'

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tweets <- userTimeline("elonmusk", n=200)

n.tweet <- length(tweets)
tweets.df <- twListToDF(tweets) 
head(tweets.df)


tweets.df2 <- gsub("http.*","",tweets.df$text)

tweets.df2 <- gsub("https.*","",tweets.df2)

tweets.df2 <- gsub("#.*","",tweets.df2)

tweets.df2 <- gsub("@.*","",tweets.df2)


head(tweets.df$text)
head(tweets.df2)


word.df <- as.vector(tweets.df2)

emotion.df <- get_nrc_sentiment(word.df)

emotion.df2 <- cbind(tweets.df2, emotion.df) 

head(emotion.df2)


sent.value <- get_sentiment(word.df)

most.positive <- word.df[sent.value == max(sent.value)]

most.positive


most.negative <- word.df[sent.value <= min(sent.value)] 
most.negative 

sent.value

positive.tweets <- word.df[sent.value > 0]

head(positive.tweets)

neutral.tweets <- word.df[sent.value == 0] 
head(neutral.tweets)

category_senti <- ifelse(sent.value < 0, "Negative", ifelse(sent.value > 0, "Positive", "Neutral"))
head(category_senti)

tc = table(category_senti)
category_senti

plot(tc)
barplot(tc,xlab = 'Sentiment Parameters',ylab = 'Number of tweets' )

