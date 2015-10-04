plot(iris)
plot(Nile)
filled.contour(volcano)
hist(Nile)
plot(cars)
boxplot(InsectSprays$count ~ InsectSprays$spray)
vector01 = c(1,2,3,4,5)
vector02 = 1:10
vector03 = c('a','b','c','d')
vector04 = c(1,2,3,4,'5')
vector05 = c(1,2,3,4,5.0)
vector02[vector02 %% 2 != 0]
vector02[{vector02 * 2 - 1}[1:5]]
score_df = data.frame(
  math = c(40,70,80), 
  korean = c(50,60,70), 
  english = c(30,40,50), 
  art = c('A','A','C')
  )
score_df$sum = score_df$math + score_df$korean + score_df$english
score_df$mean = score_df$sum / 3
iris[iris$Sepal.Length > 7,]
iris[iris$Species == 'setosa',]
