library(pacman)
p_load(tidyverse, griffen)

source("lecture 2.R")

x <- 1:10
x
print(x)

as.double(x)
x <- as.integer(x)

#function_name <- function(arguments){
  #do someting
#}

griffen <- function(x){
  x <- x^2
  return(x)
}
griffen(2)
print (griffen(2))

z <- c("Todai", "Econ")
griffen <- z

griffen <- function(x){
  x <- 10
  return(x)
}
print(griffen())

griffen <- function(x = 4){x^2}
print (griffen())
print (griffen(2))

griffen <- function(x, z){x^z}
griffen(3, 2) # taking calculation by default
griffen(2, 3)
griffen(z = 2, x = 3) #specifying the name that you can put any position you want.

griffen <- function(x,z){
  if (is.numeric(x)){
    x <- x^2
    return(x)
  }else{
    z <- z^2
    return(z)
  }
}

x <- c(2)
z <- c("Econ")

griffen (x, z)
griffen (z, z)

# z is outside of the function, so, if z changes, the function value changes.
z <- 3
griffen <- function(x){
  x <- x^z
  return(x)
}

griffen(2)

z <- "Econ"

griffen(2)

griffen <- function(w){
  w <- w^2
  return(w)
}
# w is inside of the function, so, if you type the w in console, it returns nothing.

