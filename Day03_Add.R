library(dplyr)
library(rvest)
daum_bball = 'http://score.sports.media.daum.net/record/baseball/kbo/prnk.daum'
daum_bball_html = html(daum_bball)
bball_table = html_node(daum_bball_html, '#table1')
html_table(bball_table)
daum_bball_html %>% 
  html_node('#table1') %>% 
  html_table()
