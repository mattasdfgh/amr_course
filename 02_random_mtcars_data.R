# Playing with mtcars

mtcars
class(mtcars)
head(mtcars)
cars <- mtcars
cars

head(cars)
str(cars)
cars$mpg

mtcars[1]
mtcars[1,1]
mtcars[1,2]

mtcars[1:3]
mtcars[ ,1:3]
mtcars[1:3, ]

cars[1:3, c(2,4)]
cars[1:3, c("mpg", "cyl")]

mtcars["hp"]
mtcars["AMC Javelin"]
mtcars["AMC Javelin", ] #Looking at rows requires the comma






