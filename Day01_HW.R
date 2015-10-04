# 1
iris2 = iris[iris$Species == 'virginica',]
plot(iris2$Sepal.Length, iris2$Sepal.Width)

# 2
## Data type
### Numeric (num)
10
10.0
### Character (chr)
'10'
'a'
'안뇽'
### Logical (logi)
TRUE
FALSE
T
F
0
1
TRUE + TRUE # = ????
### Factor
#### Nomial (Factor w/ n levels)
factor(c('x','x','x','y','y'))
iris$Species
table(iris$Species)
#### Oridinal (Ord. factor w/ n levels)
factor(c('x','x','x','y','y'), ordered = TRUE)
ordered(c('x','x','x','y','y'))
ordered(c('x','x','x','y','y'), levels = c('y','x'))

## Data Structure
### Vector
#### Vector - Numeric
1:10
c(1.1, 1.2, 1.3)
#### Vector - Character
month.name
str(month.name)
#### Make a vector: c()
new_vector = c(1,2,3,4,5)
new_vector
#### Pick elements wanted to be showed
letters[1]
letters[1:5]
letters[c(1,3,5)]
letters[-3]
#### Merge vectors
c(1,3,5,7,9, c(4,5,6)) #A vector cannot be nested in another vector
#### Name vectors
score = c(100, 70, 90)
names(score) #NULL
names(score) = c('Korean', 'Math', 'English')
names(score)
score
score['Math']
#### One vector, one type of data
num_vector = 1:10
  str(num_vector)
num_vector[5] = 'a'
  str(num_vector)
#### Functions manipulating vectors
length(score) #The length of the vector 'score'
seq(from = 1, to = 10, by = 2) #Show the sequence of data in the vector 1:10 
#with the common difference 2
rep(x = c(1,3,5), times = 3) #Repeat to show c(1,3,5) 3 times
rep(x = c(1,3,5), each = 3) #Repeat, but by each element
rep(x = c(1,3,5), times = 3, each = 3) #'Each' is applied first, being independent of 
#the order
#### Plotting
plot(score)
plot(score, type='l') #'l' for the line graph
barplot(score)

## Matrix
str(volcano) #num
class(volcano) #matrix
### Make a matrix
new_matrix = matrix(c(1:9), nrow = 3, ncol = 3) #Fill by column; [1,1], [2,1], ...
matrix(c(1:9), nrow = 3, ncol = 3, byrow = TRUE) #If byrow is TRUE, fill by row
### Exercise
scores = matrix(c(70,80,90, 40,50,60, 50,95,70), nrow = 3, byrow = TRUE)
### Access to the data
new_matrix[,3]
new_matrix[1,2]
new_matrix[3,c(1,2)]
### Arithmetic of matrices
new_matrix + 10
new_matrix * 5
new_matrix + scores
new_matrix * scores #Multiplication between elements in same position, not matrix mult.
new_matrix %*% scores #Matrix multiplication. It changes vector factor into appropriate 
#matrix.
### Functions manipulating matrices
dim(new_matrix) #'dim' for dimension
t(new_matrix) #Transpose
### Plotting
barplot(scores)
filled.contour(scores)

## Array
class(Titanic[,,,1])
names(Titanic[,,,1])
plot(Titanic)

## List
### Make a list
score_list = list(
  student01 = c(100, 40, 50),
  student02 = c(40,50,60,70),
  student03 = c(50, 80, 30, 50, 60),
  test_list = list(test_name = c('A', 'B', 'C', 'D', 'E'),
                   test_date = c('20150801', '20150803', '20150805', '20150807',
                                 '20150809')
                   )
) #List contains data of type key:value; multiple types of data can be stored in a list
### Access to data
score_list$student01
score_list$test_list
score_list$test_list$test_date
score_list[1] #key:value
score_list[[1]] #value
score_list[[4]][[1]] #{score_list[[4]]}[[1]]. Access to the value of 'test_list' first.
score_list[[4]][1]

## data.frame
str(iris)
### Make a data.frame
score_df = data.frame(
  math = c(40, 70, 80),
  korean = c(50, 60, 70),
  english = c(30, 40, 50),
  art = c('A', 'A', 'C')
)
### Access to data
score_df$math #As in the case of list
score_df[,1]
score_df[,'math']
score_df[,1:2]
score_df[,c('math','korean')]
### Plotting
plot(score_df)
plot(iris)

# 3
Nile > mean(Nile)
hist(Nile[Nile > mean(Nile)])
#To pick a element, use []