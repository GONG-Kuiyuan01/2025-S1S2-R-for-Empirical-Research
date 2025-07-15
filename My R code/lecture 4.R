install.packages("devtools")
library(devtools)

install_github("andrew-griffen/griffen")
install_github("andrew-griffen/griffendata")

library(griffen)
library(griffendata)

library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(tidyverse)

#-------------------------------------------

typeof(mtcars)
str(mtcars)
class(mtcars)
is.data.frame(mtcars)

is.tibble(mtcars)
as.tibble(mtcars)
mtcars
as_tibble(mtcars)
mtcars <- as_tibble(mtcars)
mtcars
class(mtcars)

my_tibble <- tibble(1:3)
my_tibble

my_dataframe <- data.frame(1:3)
my_dataframe

oj
?oj

getwd()
setwd("/Users/edisonkung/Desktop/M2第一学期/R for empirical research/My R code")
write_csv(oj, "oj.csv")
oj1 = read.csv("oj.csv")
oj2 = read_csv("oj.csv")

?read_csv
?read.csv

class(oj1)
class(oj2)

mini_cps
names(mini_cps)
my_names <- names(mini_cps)
class(my_names)

#dplyr

select(mini_cps, race)
select(mini_cps, race, wage)

select(mini_cps, -wage)
mini_cps

mutate(date.frame, new_variable = f(old_variables))

f <- function(x){
  log(x)
}
  
# change the values of variables as you want.
mutate(mini_cps, lnwage = log(wage))

mini_cps <- mutate(mini_cps, lnwage = log(wage))
mini_cps <- mutate(mini_cps, experience_square = experience^2)

# change the names of variables as you want.
mini_cps <- rename(mini_cps, exp2 = experience_square)
mini_cps <- rename(mini_cps, educ = years_of_education)

mini_cps

# select the variable you want
select(mini_cps, race)
mini_cps |> select(race)

# move the position of the variable
mini_cps |>
  relocate(lnwage, educ)
mini_cps

mini_cps |>
  left(exp2)

mini_cps |>
  mutate(lnwage = log(wage), .before = 1)

mini_cps |>
  mutate(lnwage = log(wage), .before = 4)

mini_cps |>
  summarise(mean_wage = mean(wage))

mini_cps |>
  group_by(race) |>
  summarise(mean_wage = mean(wage))

mini_cps