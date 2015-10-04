movie_thiswk = read.csv('weekly_thiswk.csv', stringsAsFactors = FALSE)
movie_lastwk = read.csv('weekly_lastwk.csv', stringsAsFactors = FALSE)
movie_data = read.csv('weekly_boxoffice_data.csv', stringsAsFactors = FALSE)
library(dplyr)

#dplyr:inner_join(); dplyr:left_join()
movie_thiswk %>% inner_join(movie_lastwk, by = 'title')
movie_thiswk %>% left_join(movie_lastwk, by = 'title')
movie_thiswk %>% left_join(movie_data, by = c('title' = 'titl'))

movie_rank = movie_thiswk %>% left_join(movie_lastwk, by = 'title')
movie_rank$lastwk
is.na(movie_rank$lastwk)
complete.cases(movie_rank)
movie_rank %>% filter(is.na(movie_rank$lastwk))
movie_rank %>% filter(complete.cases(movie_rank$lastwk))

mean(c(1,2,3,4,5))
mean(c(1,2,3,4,5,NA))
numbers = c(1:4, NA, 5:10)
mean(numbers)
mean(numbers, na.rm = TRUE)
numbers_nona = ifelse(is.na(numbers) == TRUE, 0, numbers)
mean(numbers_nona)

movie_rank %>% mutate(lastwk_na = ifelse(is.na(lastwk) == TRUE, 0, lastwk))

#install.packages('stringr')
library(stringr)
str_replace('꿈꾸는 데이터 디자이너', '꿈꾸는', '나는')
str_replace_all('꿈꾸는 꿈꾸는 데이터 디자이너', '꿈꾸는', '나는')
#두 번째 '꿈꾸는'만 바꾸려면 어떻게?
str_detect(movie_data$distributor, 'Pictures')
movie_data %>% filter(str_detect(distributor, 'Pictures'))
str_detect(movie_data$distributor, 'Pictures$')
movie_data %>% filter(str_detect(distributor, 'Pictures$'))
str_detect(movie_data$distributor, '^Sony')
movie_data %>% filter(str_detect(distributor, '^Sony'))

time = Sys.time()
weekdays(time)
months(time)
quarters(time)
?strftime
strftime(time, "%m/%d")
strftime(time, "%Y-%m-%d")
strftime(time, '%y-%m-%d')
strftime(time, '%Y')
strftime(time, "%w")
str_time = '20150909'
date_time = as.Date(str_time, "%Y%m%d")
date_time + 30
date_time + 1:10

#install.packages('gcookbook')
library(gcookbook)
aapl %>% 
  mutate(year = strftime(date, "%Y")) %>% 
  group_by(year) %>% 
  summarise(price = mean(adj_price)) %>% 
  print(n = 30)
aapl %>% 
  mutate(weekday = weekdays(date)) %>% 
  group_by(weekday) %>% 
  summarise(price = mean(adj_price))
