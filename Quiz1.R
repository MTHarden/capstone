setwd("~/R/capstone/data/en_US")

#Question 1
file.info("en_US.blogs.txt")$size / 1024000

#Question 2
twitter = readLines("en_US.twitter.txt")
length(twitter)

#Question 3
blogs = readLines("en_US.blogs.txt")
news = readLines("en_US.news.txt")

max(nchar(blogs))
max(nchar(news)) 
max(nchar(twitter))

#Question 4
love = sum(grepl(pattern="love", twit))
hate = sum(grepl(pattern="hate",twit))
ratio = love/hate
ratio

#Question 5
twitter_biostats = grep(pattern="biostats", twitter)
twitter[twitter_biostats]

#Question 6
sum(grepl("A computer once beat me at chess, but it was no match for me at kickboxing",twitter))
