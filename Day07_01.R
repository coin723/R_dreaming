score <- read.csv('score_data.csv', encoding = 'utf-8')

colnames(score) <- c("X1", "X2", "X3", "y")
score[is.na(score)] <- 0

sample <- score[sample(nrow(score), 50),]

mean(score$X1)
var(score$X1)
sd(score$X1)
se = function(x) sd(x) / sqrt(length(x))
se(score$X1)

plot(density(score$X1))
qqnorm(score$X1); qqline(score$X1)

summary(score$X1)
boxplot(score$X1)

mean(sample$X1)
plot(density(sample$X1))

t.test(sample$X1, mu = mean(score$X1))
#If the p-value is equal to or smaller than the significance level (α), 
#it suggests that the observed data are inconsistent with the assumption 
#that the null hypothesis is true and thus that hypothesis must be rejected 
#(but this does not automatically mean the alternative hypothesis can be accepted 
#as true).
#Null hypothesis <-> Alternative hypothesis

x <- 1:10; y <- x^2
cor(x, y)

cor(attitude, method = "pearson", use = "pairwise.complete.obs")
pairs(attitude)

cor.test(attitude$complaints, attitude$learning)
cor.test(attitude$complaints, attitude$critical)
plot(attitude$complaints, attitude$learning)

cars <- data.frame(cars)
out <- lm(dist ~ speed, data = cars)
summary(out)

plot(dist ~ speed, data = cars);
abline(out, col = "red")
