for (i in c(1,2,3)){
  print(i)
}
for (m in month.name){
  print(m)
}
if(5 > 4) {
  print('this is true')
} else {
  print('this is false')
}
if(3 > 4) {
  print('this is true')
} else {
  print('this is false')
}
5 > 4 #true
5 >= 4 #true
4 < 3 #false
4 <= 3 #false
4 == 4 #true
4 != 4 #false
'May' %in% month.name #true
5 %in% 10:20
for(a in letters) {
  if(a %in% c('a','e','l','o','u')) {
    print(a)
  }
}
for(g in score_df$art){
  if(g == 'A') {
    print(100)
  } else if(g == 'B') {
    print(80)
  } else if(g == 'C') {
    print(60)
  }
}
art_score = c()
for(art in score_df$art) {
  if(art == 'A') {
    art_score = c(art_score, 100)
  } else if(art == 'B') {
    art_score = c(art_score, 80)
  } else if(art == 'C') {
    art_score = c(art_score, 60)
  }
}
art_score
score_df$art = art_score
for(index in dim(score_df)[2]) {
  print(mean(score_df[, index]))
}
score_mean = c()
for(index in 1:dim(score_df)[2]) {
  mean_value = mean(score_df[, index])
  score_mean = c(score_mean, mean_value)
}
names(score_mean) = names(score_df)
sapply(score_df, mean)
iris_Mean = c()
for(i in 1:4) {
  iris_Mean = c(iris_Mean, mean(iris[, i]))
  names(iris_Mean)[i] = names(iris)[i]
}
temperature = read.csv('weather_data.csv', fileEncoding = 'UTF-8')
str(temperature)
temperature$location = as.character(temperature$location)
temperature$date = as.character(temperature$date)
seoul_temp = temperature[temperature$location == '서울', 'temp']
barplot(seoul_temp)
seoul_color = c()
for(temp in seoul_temp) {
  if(temp > mean(seoul_temp)) {
    seoul_color = c(seoul_color, '#821122')
  } else {
    seoul_color = c(seoul_color, '#cccccc')
  }
}
barplot(seoul_temp, col = seoul_color, border = NA)