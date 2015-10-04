install.packages('tidyr');
library(tidyr);
weather_wide = read.csv('weather_wide.csv', encoding = 'UTF-8');
weather_long = gather(weather_wide, hour, temp, hour03:hour21);

install.packages('dplyr');
library(dplyr)
select(weather_long, location, temp)
select(weather_long, loc = location, temp)
filter(weather_long, location == '강릉')
filter(weather_long, location == '강릉', temp > 26)
filter(weather_long, location == '강릉'| location == '서울')
mutate(weather_long, mean_temp = mean(temp))
mutate(weather_long, mean_temp = mean(temp), diff = temp - mean_temp)
mutate(weather_long, country = 'Korea')

weather_long_f = 
  mutate(weather_long, temp_f = (9/5) * temp + 32)
weather_long_f = filter(weather_long_f, temp_f > 90)
select(weather_long_f, location, temp)
select(filter(mutate(weather_long, temp_f = (9 / 5) * temp + 32), temp_f > 90), location, temp)

summarise(weather_long, mean(temp))
summarise(weather_long, count = n())
View(group_by(weather_long, location))
group_by(weather_long, hour)
weather_loc = group_by(weather_long, location)
weather_hour = group_by(weather_long, hour)
summarise(weather_loc, mean_temp = mean(temp))
summarise(weather_hour, mean_temp = mean(temp))
mutate(weather_loc, mean_temp = mean(temp))
mutate(weather_hour, mean_temp = mean(temp))

iris_spec = group_by(iris, Species)
summarise(iris_spec, mean(Sepal.Width))
summarise(iris_spec, mean(Sepal.Length))
summarise(iris_spec, max(Petal.Width))
summarise(iris_spec, min(Petal.Width))
