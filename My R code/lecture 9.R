library(pacman)
p_load(hexbin, patchwork, ggrepel, geomtextpath, ggridges, paletteer, sf)

library(pacman)
p_load(devtools)

library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(hrbrthemes, gapminder, scales, wesanderson, tidyverse, ggthemes)

theme_set(theme_ipsum())

p <-
  ggplot(
    data = coges,
    aes(x = pgg_contribution_round1, y = pgg_contribution_round2)
  ) +
  geom_point(alpha = 0.8)

print(p)

p <-
  coges |>
  ggplot(
    aes(
      x = pgg_contribution_round1, 
      y = pgg_contribution_round2
    )
  ) +
  geom_jitter() +
  labs(
    x = "round 1",
    y = "round 2",
    title = "Contribution by round"
  )

print(p)

p <-
  coges |>
  ggplot(
    aes(
      x = pgg_contribution_round1, 
      y = pgg_contribution_round2
    )
  ) +
  geom_count() +
  labs(
    x = "round 1",
    y = "round 2",
    title = "Contribution by round"
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_density_2d() +
  labs(
    x = "GDP per capita",
    y = "Life expactency"
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_density_2d_filled() + 
  labs(
    x = "GDP per capita",
    y = "Life expactency"
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_density_2d_filled(show.legend = FALSE) + 
  labs(
    x = "GDP per capita",
    y = "Life expactency"
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_density_2d_filled(show.legend = FALSE) + 
  labs(
    x = "GDP per capita",
    y = "Life expactency"
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  ) +
  scale_fill_brewer()

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_density_2d_filled(show.legend = FALSE) + 
  labs(
    x = "GDP per capita",
    y = "Life expactency"
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  ) +
  scale_fill_paletteer_d("nord::frost")

print(p)

p <-
  gapminder |>
  ggplot(
    aes(
      x = gdpPercap,
      color = continent
    )
  ) +
  geom_histogram(bins = 30
  ) +
  facet_wrap(. ~continent) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(
      x = gdpPercap,
      color = continent
    )
  ) +
  geom_histogram(bins = 30
  ) +
  facet_wrap(. ~continent) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  ) +
  scale_fill_manual(values = wes_plaette("Bottle"))

print(p)

p <-
  gapminder |>
  ggplot(
    aes(
      x = gdpPercap,
      fill = continent
    )
  ) +
  geom_density(alpha = 0.8) +
  facet_wrap(. ~continent) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  ) +
  scale_fill_manual(values = wes_palette("BottleRocket2"))

print(p)

p <-
  gapminder |>
  ggplot(
    aes(
      x = gdpPercap,
      fill = continent,
      color = continent
    )
  ) +
  geom_density(alpha = 0.8) +
  facet_wrap(. ~continent) +
  scale_fill_manual(values = wes_palette("BottleRocket2")) +
  scale_color_manual(values = wes_palette("BottleRocket2")) +
  theme(legend.title = element_blank()) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(
      x = gdpPercap,
      label = continent,
      color = continent
    )
  ) +
  geom_textdensity(
    size = 5,
    linewidth = 2,
    show.legend = FALSE
  ) +
  scale_color_paletteer_d("lisa::OskarSchlemmer") +
  theme(
    legend.title = element_blank()
    ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap)
  ) +
  geom_density() +
  facet_grid(year ~ .) +
  labs(
    x = "Log GDP per capita",
    y = NULL
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap, y = factor(year))
  ) +
  geom_density_ridges() +
  labs(
    x = "Log GDP per capita",
    y = NULL
  ) +
  scale_x_continuous(
    trans = "log10",
    labels = label_currency()
  )

print(p)

p <-
  gapminder |>
  filter(country == "China") |>
  ggplot(
    aes(x = year, y = lifeExp)
  ) +
  geom_line() +
  labs(
    title = "Life expactency in China by year",
    x = "Year",
    y = "Life expactency"
  )

print(p)

p <-
  gapminder |>
  filter(country == "China") |>
  ggplot(
    aes(x = year, y = gdpPercap)
  ) +
  geom_line() +
  labs(
    title = "Life expactency in China by year",
    x = "Year",
    y = "Life expactency"
  ) +
  scale_y_continuous(trans = "log10")

print(p)

print(whales)

p <-
  whales |>
  ggplot(
    aes(long, lat)
  ) +
  geom_point()

print(p)

p <-
  whales |>
  ggplot(
    aes(long, lat)
  ) +
  geom_path()

print(p)

theme_set(theme_tufte())

ggsave("whales.png", p, width = 16, height = 8)

setwd("/Users/edisonkung/desktop/R for empirical research/My R code")

theme_set(theme_ipsum())

us_sf

ggplot(us_sf) +
  geom_sf()

election_2016



p <- us_sf |>
  left_join(election_2016) |>
  ggplot(aes(fill = winner)) +
  geom_sf()

print(p)