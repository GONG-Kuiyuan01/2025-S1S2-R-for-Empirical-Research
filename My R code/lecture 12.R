library(pacman)
p_load(estimatr, broom, gsynth, tidysynth, fixest, sandwich, lmtest, ivreg)

library(pacman)
p_load(devtools, gt, gtExtras, webshot2, tidyverse, griffendata, gapminder)

install_github("andrew-griffen/classicecon")
library(classicecon)

lm(formula = re78 ~ treated,  data = nsw)
lm(re78 ~ treated, nsw)

nsw |>
  group_by(treated) |>
  summarise(mean(re78))

nsw |>
  lm(re78 ~ treated)
# |> passes it to the first argument where in this case, the first argument is formula.

nsw |>
  lm(formula = re78 ~ treated)

m1 <-
  lm(re78 ~ treated, nsw)

summary(m1)

lm(
  re78 ~ treated + age + I(age^2),
  nsw
)

lm(
  re78 ~ treated + treated:black,
  nsw
)

m4 <-
  lm(
    re78 ~ treated + treated:black + black,
    nsw
  ) |>
  summary() |>
  print()

nsw |>
  group_by(black, treated) |>
  summarise(mean(black))

m1_hw <-
  lm(re78 ~ treated, nsw) |>
  coeftest(
    vcov = vcovHC,
    type = "HC1"
  )
m1_hw
summary(m1)

m1_feols <-
  feols(
    re78 ~ treated,
    nsw
  ) |>
  print()

m1_feols_hw <-
  feols(
    re78 ~ treated,
    nsw,
    vcov = "HC1"
  ) |>
  print()

m_df <-
  lm(re78 ~ treated, nsw) |>
  tidy() |>
  print()

m5 <-
  feols(
    log(wage) ~ educ_years + age + I(age^2) + state,
    full_cps
  ) |>
  print()

ms <-
  feols(
    log(wage) ~ educ_years + age + I(age^2) + factor(year) + factor(state),
    full_cps
  ) |>
  print()

titanic

titanic <-
  titanic |>
  mutate(
    survived_binary = if_else(survived == "Yes", 1, 0)
  )
    
    
    
glm(
  survived_binary ~ age + sex, titanic, family = binomial(link = "probit")
  )|>
  summary() |>
  print()

titanic_logit <-
  glm(
    survived_binary ~ (sex == "Female")*factor(passenger_class) + age + (age <= 10),
    titanic,
    family = binomial(link = "logit")
  ) |>
  print()

titanic2 <-
  titanic |>
  select(age, survived, sex) |>
  na.omit()

D <- 1L*(titanic2$survived == "Yes")
m <- model.matrix(~ sex + age, titanic2)
m |> head()

my_logit <- function(par) {
  v1 <- m %*% par
  p1 <- exp(v1) / (1 + exp(v1))
  LL = D*log(p1) + (1 - D)*log((1 - p1))
  return(sum(LL))
}


optim(c(0, 0, 0), my_logit, control = list(fnscale = -1), hessian = TRUE)

ak_iv1 <-
  ivreg(
    formula = log_wage ~ education | factor(quarter_birth),
    data = ak91) |>
  print()

ak_iv2 <-
  iv_robust(
    formula = log_wage ~ education | factor(quarter_birth),
    data = ak91,
    se_type = "HC1") |>
  print()

ck94 |>
  mutate(state = factor(state, levels = c("PA", "NJ"))) |>
  feols(
    fml = FTE ~ wave*state
  ) |>
  summary()

gap_lifeExp <- gapminder |>
  select(continent, lifeExp) |>
  group_by(continent) |>
  mutate(lifeExp_mean = mean(lifeExp)) |>
  select(-lifeExp) |>
  distinct() |>
  print()

gap_lifeExp |>
  gt()