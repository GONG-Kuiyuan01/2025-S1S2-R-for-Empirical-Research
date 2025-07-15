library(pacman)
p_load(griffen, griffendata)

library(pacman)
p_load(tidyverse)

library(pacman)
p_load(stringi)

library(pacman)
p_load(devtools)

#---------------------------
gettysburg

punc <- c(".", ","," ")
g <- 
 gettysburg |>
  stri_replace_all_fixed(punc, "", vectorise_all = FALSE)

g <- g |>
  str_split("") |>
  unlist() |>
  tolower()

g_df = tibble(g)

g_df <-
  g_df |>
  mutate(g = factor(g))

# After doing this, the g inside of g_df is now factor.

g_df_pct <-
  g_df |>
  pct(g)

g_df_pct

g_df <-
  g_df |>
  mutate(g = factor(g, levels = letters))

g_df_pct <-
  g_df |>
  pct(g)

g_df_pct

ggplot(g_df_pct, aes(pct,g)) + geom_point()

g_df_pct <-
  g_df_pct |>
  mutate(g = fct_reorder(g,pct))

ggplot(g_df_pct, aes(pct,g)) + geom_point()

g_df_pct <-
  g_df_pct |>
  mutate(g = fct_reorder(g,-pct))

ggplot(g_df_pct, aes(pct,g)) + geom_point()

#-----------------------------------

x
y

left_join(x, y)

inner_join(x, y)

x |> left_join(y)

y |> left_join(x)

cps |>
  group_by(year, state) |>
  summarise(mean_wage = mean(wage)) |>
  left_join(cps) |>
  left (year, state, mean_wage, wage)

full_join(x, y)

semi_join(x, y)

anti_join(x, y)

state_population

full_join(cps, state_population)

left_join(cps, state_population)
inner_join(cps, state_population)
anti_join(cps, state_population)

anti_join(state_population, cps)

cps |> filter(year == 1970)
cps |> filter(state == 'Alabama') |> arrange(year)

bind_rows(classroom1, classroom2, classroom3)

list_classroom <-
  list(classroom1, classroom2, classroom3)

bind_rows(list_classroom)

pivot_longer(df, cols)
pivot_wider(data, names_from, values_to)

tbl1

pivot_longer(-id)

tbl1 |>
pivot_longer(cols = contains("andrew"))

pivot_longer(df, cols, names_to = )


tbl2 |>
pivot_longer(cols = a:c)

tbl3 |> pivot_longer(-id)


tbl3 |>
pivot_longer(cols = contains('a'))

tbl3 |>
  left(id) |>
  pivot_longer(cols = contains('a'))

tbl4

tbl4 |>
  pivot_longer(cols = contains('contribution'), names_to = 'round', values_to = 'contribution') |>
  mutate(round = if_else(round == "contribution_round1", 1, 2))
