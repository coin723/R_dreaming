score <- read.csv('score_data.csv', encoding = 'utf-8')
score[is.na(score)] <- 0
out <- lm(final ~ mid, data = score)
summary(out)

plot(final ~ mid, data = score)
abline(out, col = "red")
