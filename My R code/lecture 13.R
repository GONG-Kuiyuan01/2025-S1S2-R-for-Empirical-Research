library(pacman)
p_load(shiny, griffendata, tidyverse, class, devtools, palmerpenguins, gapminder, ggthemes)


print(oecd)
class(oecd)

getAnywhere(print.data.frame)
class(mtcars)
mtcars2 <- unclass(mtcars)
class(mtcars2)

x <- 3L
class(x) <- "integer2"
print(x)

print.integer2 <- function(x){
  cat("This number", x, "is an integer.\n")
}

print.integer2(2)
create_package("growth")
setwd("/Users/edisonkung/desktop/R for empirical research/My R code")

cd(1, 2)

library(usethis)
use_mit_license()
document()
check()
install("/Users/edisonkung/desktop/R for empirical research/My R code/growth")

library(growth)

?cd

ui <- fluidPage(
  # front end interface
)

server <- function(input, output, session){
  # back and logic
}


ui <- fluidPage(
  numericInput(
    inputId = "N",
    lable = "N",
    value = 100
  ),
  textOutput("double")
)

server <- function(input, output, session){
  output$double <- renderPrint(2*input$N)
}

shinyApp(ui, server)

ui <- fluidPage(
  sliderInput(
    inputId = "N",
    lable = "N",
    value = 10,
    min = 0,
    max = 200
  ),
  plotOutput("density")
)

server <- function(input, output, session){
  output$density <- renderPlot({
    x = rnorm(input$N)
    df = tibble(x)
    ggplot(df, aes(x)) + geom_density()
  })
}

shinyApp(ui, server)

ui <- fluidPage(
  titlePanel("Palmer Penguins"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "island",
        label = "Island",
        choices = c("Torgersen", "Biscoe", "Dream")
      )
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session){
  data <- reactive(
    {
     dplyr::filter(penguins, island == input$island) 
    })
  output$plot <- renderPlot({
      data() |>
        ggplot(
          aes(bill_length_mm, body_mass_g)
        ) +
        geom_point() +
        labs(
          x = "Bill length (mm)",
          y = "Body mass (g)"
        )
    }
  )
}

shinyApp(ui, server)


ui <- fluidPage(
  titlePanel("Gapminder Data"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "continent",
        label = "Continent",
        choices = c("Asia", "Africa", "Europe", "Americas", "Oceania")
      )
    ),
    mainPanel(
      plotOutput("plot")
    )
  )
)

server <- function(input, output, session){
  data <- reactive(
    {
      dplyr::filter(gapminder, continent == input$continent) 
    })
  output$plot <- renderPlot({
    data() |>
      ggplot(
        aes(log(gdpPercap), lifeExp, color = country)
      ) +
      geom_point(show.legend = FALSE) +
      labs(
        title = "Life expectancy vs. log GDP per capita",
        x = "log GDP per capita",
        y = "Life expectancy"
      ) +
      theme_tufte() +
      scale_color_manual(values = country_colors) 
  }
  )
}

shinyApp(ui, server)