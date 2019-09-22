#wasuupp data analysis
#install.packages('syuzhet')#syentimal analysis 
library(syuzhet)

#install.packages('ggplot2')#plot
library(ggplot2)


#install.packages('tm')#text mining 
library(tm)

#install.packages('wordcloud')#
library(wordcloud)


texts=readLines("xxxx.txt")
texts

#sentiment analysis of wasupp

sentiment=get_nrc_sentiment(texts)
print(sentiment)


text=cbind(texts,sentiment)
totalsentiment=data.frame(colSums(text[,c(2:11)]))
totalsentiment

#ploting anylysis of wasup

names(totalsentiment)="count"
totalsentiment=cbind("sentiment"=rownames(totalsentiment),totalsentiment)
rownames(totalsentiment)=NULL

ggplot(data = totalsentiment,aes(x=sentiment,y=count))+geom_bar(aes(fill=sentiment),stat = "identity")+theme(legend.position = "top")+xlab('sentiment')+ylab('total Count')+
  ggtitle('Total Sentiment Score')  

