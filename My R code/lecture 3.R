# rm(list = ls()) *Empty the all the elements in the environment.

library(tidyverse)

today()

now()

x <- today()
y <- now()

print(x)
print(y)

typeof(x)
typeof(y)

str(x)
class(x)
is.Date(x)

str(y)
class(y)
is.Date(y)

x <- "2024-12-20"

# Error here.
# x <- "24-12-2024"
# which returns "0024-12-20", "24" is identified as the year, "12" for the month, and "2024" for the day
# where "20" from the "2024" is identified and "24" is ignored.

typeof(x)

x <- as.Date(x)
typeof(x)
class(x)

x <- "12-24-2024"
x <- as.Date(x)
typeof(x)

x <- "12-24-2024"
x <- as.Date(x, tryFormats = c("%m-%d-%y"))
typeof(x)
class(x)


stand <- function(x){
  if (length(x)==1){
    stop()
  }
  stand = (x - mean(x))/sd(x)
  return(stand)
}

stand(c(1,2))

x <- list(1, "hello", TRUE)
x

x[2]
x[[1]]
x[[2]]

typeof (x[[2]])
typeof (x[[1]])

is.list(x[1])
typeof (x)

x[1]
typeof (x[1])

x <- list(a = 1,ch = "hello", b = TRUE)

typeof (x[["a"]])
x[["a"]]
x$a

x <- list(n = 1:10,
          ch = c("hello", "goodbye"),
          b = c(TRUE, FALSE))

x$n
x$ch
x$b

x$ch[1]


x [["ch"]][2]
x [[2]]

typeof(x [["ch"]][2])
is.list(x [["ch"]][2])

mtcars

y ~ x
lm(mpg ~ cyl, mtcars)

result <- lm(mpg ~ cyl, mtcars)
print (result)

typeof (result)

str(result)
str(result)

result[2]

class(result)
unclass(result)

result[["coefficients"]]