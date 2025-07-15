# Lecture 1

library(pacman)
p_load(tidyverse, quarto)

x <- 4
y <- 5
x = y
x <- "hello"
typeof(x)

is.character(x)
is.double(x)
x <- c(2, 3, 4)

x[1]
x[4]

x[2] <- 37

z <- c("a", "b", "c")
z^2

x / 2
x <- x / 2

length(x)

grepl("a", z)

library(xml2)

install.packages("languageserver")

is.logical(grepl("a", z))
is.numeric(grepl("a", z))

c("True", 1)

k <- c("True", 1)

is.logical(grepl("True", k))

grepl("True", k)

# Lecture 2
x <- 1:10
x <- 10:1

typeof(x)
seq (1, 10)

?seq()

identical ()

z <- 1:10
z <- seq(1, 10, 1)

identical (x, z)

str(x)
str(z)

as.integer(z)
identical(z, as.integer(z))
# if you want change the value, you have to reassign the value.
z <- as.integer(z)
str(z)
z <- as.numeric(z)
str(z)
x <- as.double(x)
str(x)


identical(as.numeric(x), as.double(x))
identical(as.integer(x), as.double(x))

as.character(x)

x <- c(1, 2, 3, pi)
mean(x)
max(x)
min(x)
var(x)
median(x)
sd(x)
sort(x)
sort(x, decreasing = FALSE)
sort(x, decreasing = TRUE)

x <- c(x, NA)
mean(x)
?mean()
x <- c(0:10, 50)
xm <- mean(x)

c (xm, mean(x, trim = 0.3))

x <- c(x, NA)
mean(x, na.rm = TRUE)

library(pacman)
p_load(tidyverse, griffen)

