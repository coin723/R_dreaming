# 1
daegu_temperature = temperature[temperature$location == '대구', 'temp'] #'temp', not temp
daegu_color = c()
for(temp in daegu_temperature) {
  if(temp > mean(daegu_temperature)) {
    daegu_color = c(daegu_color, '#821122')
  } else {
    daegu_color = c(daegu_color, '#cccccc')
  }
}
barplot(daegu_temperature, col = daegu_color, border = NA)

# 2
#temperature[temperature$location == '대구', temp] results in NULL.
#sapply(x, f) is 
#for(i in 1:dim(x)[n]) {
# f(x)
#}

# Additional
temperature = read.csv('weather_data.csv')
str(temperature)
# character
as.character(temperature$location)
temperature$location = as.character(temperature$location)
temperature$date = as.character(temperature$date)
str(temperature)
seoul_temp = temperature[temperature$location == '서울', 'temp']
plot(seoul_temp)
barplot(seoul_temp)
seoul_color = c()
for(temp in seoul_temp) {
  if(temp > mean(seoul_temp)) {
    seoul_color = c(seoul_color, '#821122')
  } else {
    seoul_color = c(seoul_color, '#cccccc')
  }
}
seoul_color
barplot(seoul_temp, col = seoul_color, border = NA)
seoul_color = sapply(seoul_temp, function(x) ifelse(x > mean(seoul_temp), '#821122', '#cccccc'))
barplot(seoul_temp, col = seoul_color, border = NA)
