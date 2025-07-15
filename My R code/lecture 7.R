library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(tidyverse)

library(pacman)
p_load(stringi)

library(pacman)
p_load(devtools)

#---------------------------

tbl5 |>
  pivot_longer(cols = contains('contribution'), names_to = 'round', values_to = 'contribution') |>
  mutate(round = if_else(round == "contribution_round1", 1, 2))

tbl5 |>
  privot_longer(cols = starts_with("contribution"))

full_cps |>
  group_by(education_category) |>
  summarise(mean_wage = mean(wage))

capm |>
  pivot_wider(names_from = parameter, values_from = estimate)

library(pacman)
p_load(gapminder, ggthemes, Hmisc, wesanderson, ggridges)

gapminder
#?ggplot

ggplot(
  data = gapminder,
  mapping = aes(x = gdpPercap, y = lifeExp)
) + 
  geom_point()

ggplot(
  data = gapminder,
  mapping = aes(y = gdpPercap, x = lifeExp)
) + 
  geom_point()

ggplot(
  gapminder,
  aes(y = gdpPercap, x = lifeExp)
) + 
  geom_point()

gapminder |>
  ggplot(
    aes(y = gdpPercap, x = lifeExp)
  ) + 
  geom_point()

p <- gapminder |>
  ggplot(
    aes(y = gdpPercap, x = lifeExp)
  ) + 
  geom_point()