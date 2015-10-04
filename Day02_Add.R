# Arithmetic
2 + 4 #6
2 - 4 #-2
2 * 4 #8
2 / 4 #0.5
2 ^ 4 #Exponential: 2 to 4
7 %/% 3 #Quotient of 7 divided by 3
7 %% 3 #Remainder of 7 devided by 3

# Comparison
3 > 4
3 >= 4
3 < 4
3 <= 4
4 == 4 #Equal
4 != 4 #Not equal
'May' %in% month.name
5 %in% 10:20

# 'for' loop
for(i in c(1,2,3)) {
  print(i)
}
month.name
for(m in month.name) {
  print(m)
}

# 'if'; conditional statement
if(TRUE) {
  print('this is true')
} else {
  print('this is false')
}
if(FALSE) {
  print('this is true')
} else {
  print('this is false')
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
for(chr in letters) {
  if(chr %in% c('a', 'e', 'i', 'o', 'u')) {
    print(chr)
  }
}

# Conditional / loop examples
score_df = data.frame(
  math = c(40, 70, 80),
  korean = c(50, 60, 70),
  english = c(30, 40, 50),
  art = c('A', 'A', 'C')
)
score_df$art
for(art in score_df$art) {
  print(art)
}
for(art in score_df$art) {
  if(art == 'A') {
    print('100')
  } else if(art == 'B') {
    print('80')
  } else {
    print('60')
  }
}
c(1,2,3,4,5, c(6,7,8)) #results in
1:8 #or c(1,2,3,4,5,6,7,8)
a = 10
b = c()
print(b)
b = c(b, a)
print(b)
b = c(b, a)
print(b)
b = c(b, a)
print(b)
art_score = c()
for(art in score_df$art) {
  if(art == 'A') {
    art_score = c(art_score, 100)
  } else if(art == 'C') {
    art_score = c(art_score, 60)
  } else {
    art_score = c(art_score, 80)
  }
}
art_score
score_df$art = art_score
score_df
names(score_df)
dim(score_df)
dim(score_df)[2]
for(index in 1:dim(score_df)[2]) {
  print(names(score_df)[index])
}
for(index in 1:dim(score_df)[2]) {
  print(score_df[, index])
}
for(index in 1:dim(score_df)[2]) {
  print(mean(score_df[, index]))
}
for(index in 1:dim(score_df)[2]) {
  print(names(score_df[index]))
  print(mean(score_df[, index]))
}
score_mean = c()
for(index in 1:dim(score_df)[2]) {
  mean_value = mean(score_df[, index])
  score_mean = c(score_mean, mean_value)
}
names(score_mean) = names(score_df)
score_mean
sapply(score_df, mean)