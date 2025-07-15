library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(tidyverse)

library(pacman)
p_load(devtools)

library(pacman)
p_load(stringi)

#----------------------------

mini_cps |>
  filter(race == 'black')

mini_cps |>
  filter(wage > 20)

mini_cps |>
  drop_na(years_of_education)

mini_cps |>
  arrange(experience, education_category)

mini_cps |>
  arrange(race, education_category)

mini_cps |>
  distinct(race, education_category)

mini_cps |>
  count(race)

nrow(mini_cps)
ncol(mini_cps)

names(mini_cps)
names(mini_cps)[2] <- 'educ'
mini_cps

cps

cps |>
  distinct(year) |>
  arrange(year) |>
  pull()

cps |>
  distinct(year) |>
  arrange(year) |>
  print()

cps |>
  distinct(year) |>
  arrange(year) |>
  print_all()

ncol(cps)
nrow(cps)

pull()

cps |>
  filter(educ_years <= 12)

cps |>
  filter(educ_years > 16) |>
  filter(state == 'Kentucky')

cps |>
  filter(educ_years > 16 | state == 'Kentucky')

full_cps2 <- cps |>
  select(year, wage) |>
  drop_na() |>
  mutate(lnwage = log(wage)) |>
  left(lnwage) |>
  arrange(year)

full_cps2

full_cps2 <- full_cps2 |>
  group_by(year) |>
  summarise(median_wage = median(wage))

ggplot(
  data = full_cps2,
  aes(year, median_wage)
) +
  geom_point()

cps |>
  group_by(year) |>
  summarise(
    across(
      c(black, white, married),
      mean
    )
  )

cps |>
  group_by(year) |>
  summarise(
    across(
      where(is.numeric),
      mean
    )
  )

cps |>
  select(where(is.character))

cps |>
  select(where(is.numeric))

cps |>
  select(where(is.character)) |>
  mutate(
    across(everything(),
           toupper
      
    )
  )

# 'toupper' is used to capitalize

x <- c('a', 'b', 'c')
x <- factor(x)
typeof(x)
is.factor(x)

levels(x)

levels(x[1:2])

x <- c('a', 'b', 'c')
x <- factor(x, levels = letters)
x

x <- c('a', 'b', '龚')
x <- factor(x, levels = letters)
x