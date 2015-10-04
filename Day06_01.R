#install.packages('ggplot2')
library(ggplot2)

ggplot() + 
  geom_point(data = iris, aes(x = Sepal.Length, y = Sepal.Width, colour = Species))
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width)) + 
  geom_point() + 
  geom_smooth()
iris_plot = ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))
iris_plot + 
  geom_point() + 
  geom_smooth()

dia_plot = ggplot(data = diamonds, aes(x = carat, y = price))
dia_plot + geom_point()

iris_plot + 
  geom_point(size = 3, colour = 'red') + 
  geom_smooth()
?geom_point
iris_plot + 
  geom_point(size = 3, colour = 'red') + 
  geom_smooth(method = 'lm')
iris_plot + 
  geom_point(size = 3, colour = 'red') + 
  geom_smooth(lintype = 2)
iris_plot + 
  geom_point(size = 3, colour = 'red') + 
  geom_smooth(se = FALSE)

ggplot(data = iris, aes(x = Species, y = Sepal.Width)) + 
  geom_boxplot(fill = '#3399ff', colour = '#c8b923')

ggplot(data = mpg, aes(displ, hwy)) + 
  geom_point(position = "jitter") + 
  geom_smooth()

ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + 
  geom_bar(position = "stack")
ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + 
  geom_bar(position = "fill")
ggplot(mtcars, aes(factor(cyl), fill = factor(vs))) + 
  geom_bar(position = "dodge")

str(mtcars)

ggplot(mtcars, aes(factor(cyl), fill = factor(1:length(mtcars$vs)))) + 
  geom_bar()
ggplot(mtcars, aes(factor(cyl))) + 
  geom_bar()

ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar()

dia_bar <- ggplot(diamonds, aes(x = cut, fill = cut)) + geom_bar()
dia_bar + scale_fill_brewer()

RColorBrewer::display.brewer.all()
dia_bar + scale_fill_brewer(palette = 'Paired')
dia_bar + scale_fill_brewer(palette = 'Accent')

ggplot(mpg, aes(displ, hwy)) + 
  geom_point() + 
  geom_smooth() + 
  scale_x_continuous(limits = c(4,6))
dia_bar + 
  scale_fill_brewer(palette = 'Accent') +
  scale_y_continuous(trans = "log10")
dia_bar + 
  coord_flip()
dia_bar + 
  coord_polar()

mtc_point <- ggplot(mtcars, aes(mpg, wt)) + geom_point()
mtc_point + 
  facet_wrap(~cyl)
mtc_point + 
  facet_wrap(~cyl + gear, ncol = 2)
mtc_point + 
  facet_grid(gear ~ cyl)

ggplot(iris, aes(Sepal.Width, Sepal.Length)) + 
  geom_point() + 
  facet_wrap(~Species)

dia_bar + theme_bw()
dia_bar + theme_classic()

#install.packages('ggthemes')
library(ggthemes)
dia_bar + theme_economist() + scale_colour_economist()
dia_bar + theme_excel()
dia_bar + theme_solarized()
