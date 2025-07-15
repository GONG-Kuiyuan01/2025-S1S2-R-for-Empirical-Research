library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(tidyverse)

library(pacman)
p_load(stringi)

library(pacman)
p_load(devtools)

library(pacman)
p_load(gapminder, ggthemes, Hmisc, wesanderson, ggridges)

library(pacman)
p_load(hrbrthemes)

library(scales)

library(pacman)
p_load(ggrepel)
#---------------------------

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point()

print(p)

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  )

print(p)

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Plot 1"
  )

print(p)

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    caption = "Plot 1"
  )

print(p)


p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(color = "red") +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    caption = "Plot 1"
  )

print(p)

#---------------------------Google "Hex color"
p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp)
  ) +
  geom_point(color = "#a503fc") +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    caption = "Plot 1"
  )

print(p)

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp, color = continent)
  ) +
  geom_point() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    caption = "Plot 1"
  )

print(p)


p <-
    ggplot(
      data = gapminder,
      mapping = aes(x = gdpPercap, y = lifeExp, color = continent)
    ) +
    geom_point() +
    labs(
      x = "GDP per capita",
      y = "Life expectancy",
      title = "Life expectancy vs. GDP",
      caption = "Plot 1"
    ) +
    scale_color_manual(
      values = c("red", "blue", "green", "purple", "yellow")
    )
  
  print(p)
  
  p <-
    ggplot(
      data = gapminder,
      mapping = aes(x = gdpPercap, y = lifeExp, color = continent)
    ) +
    geom_point() +
    labs(
      x = "GDP per capita",
      y = "Life expectancy",
      title = "Life expectancy vs. GDP",
      caption = "Plot 1"
    ) +
    scale_color_manual(
      values = wes_palette("Rushmore1")
    )
  
  print(p)

wes_palette("Rushmore1")
class(wes_palette("Rushmore1"))
unclass(wes_palette("Rushmore1"))


p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = gdpPercap, y = lifeExp, color = country)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_color_manual(
    values = country_colors
  )

print(p)

country_colors

p <-
  ggplot(
    data = gapminder,
    mapping = aes(x = log10(gdpPercap), y = lifeExp, color = country)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
  ) +
  scale_color_manual(
    values = country_colors
  )

print(p)

gapminder |>
  mutate(log_gdpPercap = log10(gdpPercap)) |>
  ggplot(
    aes(x = log_gdpPercap, y = lifeExp, color = country)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
  ) +
  scale_color_manual(
    values = country_colors
  ) -> p

print(p)

p <- gapminder |>
  mutate(log_gdpPercap = log10(gdpPercap)) |>
  ggplot(
    aes(x = log_gdpPercap, y = lifeExp, color = country)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10")

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥"))

print(p)

ggthemes

theme_set(theme_economist())
print(p)

theme_set(theme_excel())
print(p)

theme_set(theme_wsj())
print(p)

theme_set(theme_tufte())
print(p)

theme_set(theme_stata())
print(p)

theme_set(theme_ipsum())
print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥"))

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE, alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥"))

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE, alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥")
                     ) +
  facet_grid(. ~ continent) +

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE, alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥")
  ) +
  facet_grid(. ~ continent) +
  geom_smooth(
    aes(x = gdpPercap, y = lifeExp, group = continent),
    formula = y ~ x,
    method = "loess",
    color = "black",
    se = FALSE,
    show.legend = FALSE
  )

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE, alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥")
  ) +
  facet_grid(. ~ continent) +
  geom_smooth(
    aes(x = gdpPercap, y = lifeExp, group = continent),
    formula = y ~ x,
    method = "lm",
    color = "black",
    se = FALSE,
    show.legend = FALSE
  )

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, color = country, size = pop)
  ) +
  geom_point(show.legend = FALSE, alpha = .5
  ) +
  labs(
    x = "GDP per capita",
    y = "Life expectancy",
    title = "Life expectancy vs. GDP",
    subtitle = "Praticing plotting"
  ) +
  scale_color_manual(
    values = country_colors
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency(prefix = "¥")
  ) +
  facet_wrap(. ~ continent)

print(p)

p <- gapminder |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, label = country)
  ) +
  geom_text() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency())

print(p)

p <- gapminder |>
  filter(continent == "Asia", year == 1952) |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, label = country)
  ) +
  geom_text() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency())

print(p)

p <- gapminder |>
  filter(continent == "Asia", year == 1952) |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, label = country)
  ) +
  geom_text() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency()) +
  geom_label()

print(p)

p <- gapminder |>
  filter(continent == "Asia", year == 1952) |>
  ggplot(
    aes(x = gdpPercap, y = lifeExp, label = country)
  ) +
  geom_text() +
  labs(
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency()) +
  geom_label() +
  geom_text_repel()

print(p) 

p <- gapminder |>
  ggplot(
    aes(x = log(gdpPercap), y = lifeExp, label = country)
  ) +
  geom_point() +
  geom_text_repel(
    data = filter(gapminder, lifeExp < 33 | log(gdpPercap) > 11)
  )

print(p) 

p <- gapminder |>
  geom_point(
    data = gapminder,
    mapping = aes(x = log(gdpPercap), y = lifeExp, label = country)
  ) +
  geom_text_repel(
    data = filter(gapminder, lifeExp < 33 | log(gdpPercap) > 11)
  )

print(p) 