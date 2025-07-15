#API Key: d5d257ae-e753-40c2-afa1-917a47c666c8

library(pacman)
p_load(devtools, ggplot2, ggmap, leaflet)

library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(hexbin, patchwork, ggrepel, geomtextpath, ggridges, paletteer, sf)

library(pacman)
p_load(hrbrthemes, gapminder, scales, wesanderson, tidyverse, ggthemes, gganimate, gifski)

library(pacman)
p_load(gganimate)

election_map_2016 <- us_sf |>
  st_transform(crs = "wgs84") |>
  left_join(election_2016) |>
  mutate(winner = factor(winner, levels = c("Trump", "Clinton"))) |>
  ggplot(
    aes(fill = winner)
  ) +
  geom_sf() +
  scale_fill_manual(values = party_colors) +
  labs(
    title = "U.S Presidential Election 2016"
  ) +
    geom_sf_text(
    aes(label = electoral_votes)
    )

election_map_2020 <-us_sf |>
  st_transform(crs = "wgs84") |>
  left_join(election_2020) |>
  mutate(winner = factor(winner, levels = c("Trump", "Biden"))) |>
  ggplot(
    aes(fill = winner)
  ) +
  geom_sf() +
  scale_fill_manual(values = party_colors) +
  labs(
    title = "U.S Presidential Election 2020"
  ) +
  geom_sf_text(
    aes(label = electoral_votes)
  )

election_map_2024 <- us_sf |>
  st_transform(crs = "wgs84") |>
  left_join(election_2024) |>
  mutate(winner = factor(winner, levels = c("Trump", "Harris"))) |>
  ggplot(
    aes(fill = winner)
  ) +
  geom_sf() +
  scale_fill_manual(values = party_colors) +
  labs(
    title = "U.S Presidential Election 2024"
  ) +
  geom_sf_text(
    aes(
      label = electoral_votes)
  )

class(election_map_2016)
class(election_map_2020)
class(election_map_2024)

p <- election_map_2016 + election_map_2020 + election_map_2024

p <- (election_map_2016 + election_map_2020) / election_map_2024
print(p)

library(leaflet)

m <- leaflet() |>
  addTiles() |>
  setView(
    lng = 139.7614,
    lat = 35.7104,
    zoom = 17
  ) |>
  addMarkers(
    lng = 139.7614,
    lat = 35.7104,
    popup = "UTokyo Economics"
  )

print(m)

m <- leaflet() |>
  addTiles() |>
  setView(
    lng = 139.7614,
    lat = 35.7104,
    zoom = 17
  ) |>
  addProviderTiles("Esri.WorldImagery")

print(m)

m <- leaflet() |>
  addTiles() |>
  setView(
    lng = 139.7614,
    lat = 35.7104,
    zoom = 5
  ) |>
  addProviderTiles("NASAGIBS.ViirsEarthAtNight2012")

print(m)

m <- leaflet() |>
  addTiles() |>
  setView(
    lng = -0.136,
    lat = 51.513,
    zoom = 16
  ) |>
  addMarkers(data = snow_deaths,
             ~lng,
             ~lat,
             clusterOptions = makeRweaveLatexCodeRunner(),
             group = "Deaths") |>
  addMarkers(data = snow_pumps,
             ~lng,
             ~lat,
             group = "Pumps")
print(m)

register_stadiamaps("d5d257ae-e753-40c2-afa1-917a47c666c8", write = FALSE)

bbox_whales <- make_bbox(long, lat, whales)
bbox_whales

map_whales <-
  get_stadiamap(
    bbox = bbox_whales,
    zoom = 9,
    maptype = "stamen_toner_lite"
  )

w <- ggmap(map_whales) +
  geom_path(
    data = whales,
    mapping = aes(long, lat),
    color = "#afc6b0"
  )
print(w)

theme_set(theme_ipsum())

p <-
  gapminder |>
  ggplot(
    aes(x = gdpPercap,
        y = lifeExp,
        color = country,
        size = pop)
  ) + 
  geom_point(alpha = 0.8, show.legend = FALSE) +
  scale_color_manual(values = country_colors) +
  facet_wrap(.~ continent, ncol = 5) +
  labs(
    title = "Year: {frame_time}",
    x = "GDP per capita",
    y = "Life expectancy"
  ) +
  scale_x_continuous(trans = "log10", labels = label_currency()) +
  transition_time(year) + ease_aes("linear")

print(p)

animate(p,
        duration = 7,
        renderer = gifski_renderer("rosling.gif"),
        height = 350,
        width = 600,
        unit = "px")

print(p)

