setwd("~/R/capstone/data/en_US")


library(NLP)
library(RColorBrewer)
library(stringi)
library(tm)
library(wordcloud)

## Load data
blogs = readLines("en_US.blogs.txt")
news = readLines("en_US.news.txt")
twitter = readLines("en_US.twitter.txt")

## Blogs basic info
length(blogs)
object.size(blogs)

## News basic info
length(news)
object.size(news)

## Twitter basic info
length(twitter)
object.size(twitter)          

##Sampling the Data 
set.seed(12345) # Just like my luggage
blogSample = sample(blogs, 1000)
newsSample = sample(news, 1000)
twitterSample = sample(twitter, 1000)


## Blogs advanced
## Join the elements of a character vector into one string
blogString <- stri_flatten(blogSample, collapse =" ")
## Extracts all words from the string
blogWords <- unlist(stri_extract_all_words(blogString, locale = "en"))
## Transform strings to lower case to identify unique words correctly
blogWords <- stri_trans_tolower(blogWords, locale = "en")
## Total number of words in blogs sample
bwordsNum <- length(blogWords)
bwordsNum
## Unique number of words in blogs sample
ubwordsNum <- length(unique(blogWords))
ubwordsNum

## News advanced
## Join the elements of a character vector into one string
newsString <- stri_flatten(newsSample, collapse =" ")
## Extracts all words from the string
newsWords <- unlist(stri_extract_all_words(newsString, locale = "en"))
## Transform strings to lower case to identify unique words correctly
newsWords <- stri_trans_tolower(newsWords, locale = "en")
## Total number of words in news sample
nwordsNum <- length(newsWords)
nwordsNum
## Unique number of words in news sample
unwordsNum <- length(unique(newsWords))
unwordsNum

## Twitter advanced
## Join the elements of a character vector into one string
twitterString <- stri_flatten(twitterSample, collapse =" ")
## Extracts all words from the string
twitterWords <- unlist(stri_extract_all_words(twitterString, locale = "en"))
## Transform strings to lower case to identify unique words correctly
twitterWords <- stri_trans_tolower(twitterWords, locale = "en")
## Total number of words in tweet sample
twordsNum <- length(twitterWords)
twordsNum
## Unique number of words in tweet sample
utwordsNum <- length(unique(twitterWords))
utwordsNum

## Corpus
blogCorpus = Corpus(VectorSource(blogWords))
newsCorpus = Corpus(VectorSource(newsWords))
twitterCorpus = Corpus(VectorSource(twitterWords))

## Visualizing with Word Clouds
##Blogs
wordcloud(blogCorpus, scale=c(3,0.5),
          min.freq=5, max.words=150, random.order=TRUE,
          rot.per=0.5, use.r.layout=FALSE,
          colors=brewer.pal(8, "Dark2"))

##News
wordcloud(newsCorpus, scale=c(3,0.5),
          min.freq=5, max.words=150, random.order=TRUE,
          rot.per=0.5, use.r.layout=FALSE,
          colors=brewer.pal(8, "Dark2"))

##Twitter
wordcloud(twitterCorpus, scale=c(3,0.5),
          min.freq=5, max.words=150, random.order=TRUE,
          rot.per=0.5, use.r.layout=FALSE,
          colors=brewer.pal(8, "Dark2"))
