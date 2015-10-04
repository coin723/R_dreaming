movie_data$cumGross %>% 
  str_replace_all('[\\$,]', '') %>% 
  as.numeric()

temp = aapl %>% 
  mutate(month = months(date)) %>% 
  group_by(month) %>% 
  summarise(price = mean(adj_price))

#월 순서로 정렬하고 싶다