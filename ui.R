library(shiny)
shinyUI(fluidPage(
    headerPanel("Car comparator"),
    mainPanel(
        p("Enter 1 or 2 cars' names to see their specifications and compared them."),
        p("Example: Datsun, Cadillac, Ford, Lincoln, Chrysler, Pontiac, Toyota, Mazda,  Hornet, ..."),
        p("Some keyword returns more than 1 results (e.g. fiat), in that case you have so specify your keyword until 1 result is return (e.g. fiat 128) in order to display more information about the car."),
        textInput(inputId="text1", label = "Car 1", value=""),
        textInput(inputId="text2", label = "Car 2", value=""),
        h2('Car 1 specification'),
        htmlOutput('table1'),
        h3('More information'),
        textOutput('hp1'),
        textOutput('mpg1'),
        p(),
        h2('Car 2 specification'),
        htmlOutput('table2'),
        h3('More information'),
        textOutput('hp2'),
        textOutput('mpg2')
    )
))
