# Playing around with subsetting and stuff
# As a general rule, square brackets indicate that we are subsetting

# c is a function, so when we use c(), we are using a function to combine things into something

x <- c(5.3,8.2,6.9,0.2,3.4)
names(x)
names(x) <- c("a", "b", "c", "d", "e")
x
x[1]
x[[1]]
x[2,3,5]
x[2:4]
x[2,3]
x[c(2,3,5)]
x[[c(2,3,5)]]
x[1:90]
x[0]
x[b]
x["b"]
x
x[-2]

names(x)
typeof(names(x))

#THIS IS A GOOD ONE
"b" %in% names(x) #Teacher got TRUE, strange...
names(x) == "b"  

x[names(x) !="b"]
y <- x[names(x) !="b"]
y

#note that doing this keeps the labels for the new object y

x > 7
x[x > 7]
z <- x[x > 7]
z

#Some logical stuff
TRUE
FALSE
TRUE | FALSE
TRUE & FALSE

#Applying the logical stuff:
x < 6 & x > 3
x
x[x<6 & x>3]
x
x[x>6 | x<3]
x



