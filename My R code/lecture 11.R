library(pacman)
p_load(devtools, ggplot2, ggmap, leaflet)

library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(hexbin, patchwork, ggrepel, geomtextpath, ggridges, paletteer, sf)

library(pacman)
p_load(hrbrthemes, gapminder, scales, wesanderson, tidyverse, ggthemes,gganimate, gifski)

library(pacman)
p_load(gganimate, broom)


for (i in 1:5){
  print(i)
}

for (i in 1:5){
  sqrt(i)
}

a <- 1:5
b <- vector()

for(i in a){
  b[i] <- sqrt(i)
}

print(a)
print(b)

a <- 1:5
b <- vector()

for(i in a){
  b <- c(b, sqrt(i))
}

print(a)
print(b)

a <- 1:5
df <- tibble(a)
df

df <- df |>
  mutate(b = sqrt(a))

print(df)

map(a, sqrt)
b = map(a, sqrt)

df <- df |>
  mutate(b = map_dbl(a, sqrt))
df

map(mtcars, mean)

map_dbl(mtcars, mean)
map_df(mtcars, mean)

growth <- function(df) {
  model <- lm(log(gdpPercap) ~ year, df)
  return(model)
}

japan_growth <- gapminder |>
  filter(country == "Japan") |>
  growth()

japan_growth$coefficients

gapminder |>
  filter(country == "Japan") |>
  growth() |>
  tidy(conf.int = TRUE, conf.level = 0.95)

gapminder_nested <- gapminder |>
  group_by(country) |>
  nest()

gapminder_nested

gapminder_nested$data[1]

gapminder_nested <- gapminder_nested |>
  mutate(model = map(data, growth))

gapminder_nested$model

gapminder_nested <- gapminder_nested |>
  mutate(tidy_model = map(model, tidy, conf.int = TRUE))

gapminder_nested

gapminder_nested <- gapminder_nested |>
  select(-data, -model)

gapminder_cof <- gapminder_nested |>
  unnest(cols = c("tidy_model"))

gapminder_cof |>
  filter(term == "year")

gapminder_continent <- gapminder |>
  select(country, continent) |>
  nest(cols = continent)


gapminder_cof <- gapminder_cof |>
  filter(term == "year") |>
  left_join(gapminder |> select(country, continent) |> distinct(), by = "country")


