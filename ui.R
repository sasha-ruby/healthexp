# Use global max/min for axes so the view window stays
# constant as the user moves between years
xlim <- list(
#     min = min(data$Health.Expenditure) - 1000,
#     max = max(data$Health.Expenditure) + 1000
    min = 0,
    max = 1200    
)
ylim <- list(
    min = 72,
    max = 83
)

shinyUI(fluidPage(
    
#     plotOutput(motion),
    
    # This line loads the Google Charts JS library
    googleChartsInit(),
    
    # Use the Google webfont "Source Sans Pro"
    tags$link(
        href=paste0("http://fonts.googleapis.com/css?",
                    "family=Source+Sans+Pro:300,600,300italic"),
        rel="stylesheet", type="text/css"),
#     tags$link(
#         href=paste0("http://www.rubyind.com/css/bootstrap.min.css"),
#         rel="stylesheet", type="text/css"),
#     tags$link(
#         href=paste0("http://www.rubyind.com/css/main.css"),
#         rel="stylesheet", type="text/css"),
        
    tags$style(type="text/css",
               "body {font-family: Helvetica, Arial, 'Source Sans Pro'}"
    ),
    
#     h1("Life Expectancy by Health Expenditure by Province"),
    
    googleBubbleChart("chart",
                      width="100%", height = "475px",
                      # Set the default options for this chart; they can be
                      # overridden in server.R on a per-update basis. See
                      # https://developers.google.com/chart/interactive/docs/gallery/bubblechart
                      # for option documentation.
                      options = list(
                          fontName = "sans-serif",
                          fontSize = 13,
                          # Set axis labels and ranges
                          hAxis = list(
                              title = "Health expenditure per capita (C$)",
                              viewWindow = xlim
                          ),
                          vAxis = list(
                              title = "Life expectancy (years)",
                              viewWindow = ylim
                          ),
                          # The default padding is a little too spaced out
                          chartArea = list(
                              top = 50, left = 75,
                              height = "75%", width = "75%"
                          ),
                          # Allow pan/zoom
                          explorer = list(
                              'keepInBounds' = TRUE,
                              'maxZoomIn' = 1,
                              'maxZoomOut' = 1
                          ),
                          # Set bubble visual props
                          bubble = list(
                              opacity = 0.60, 
                              stroke = "none",
                              textStyle = list(
                                  fontSize = 11
                              )
                          ),
                          # Set fonts
                          titleTextStyle = list(
                              fontSize = 16
                          ),
                          tooltip = list(
                              textStyle = list(
                                  fontSize = 12
                              )
                          ),
                          colorAxis = list(
                              colors = list(
                                  'yellow', 'red', 'blue', 'green', 'orange', 'pink', 'grey', 'purple', 'magenta', 'cyan', 'beige', 'lavender', 'gold'
                              )
                          ),
                          sizeAxis = list(
                              minSize = 5,
                              maxSize = 20,
                              minValue = min(dataset$Population),
                              maxValue = max(dataset$Population)
                          ),
                          animation = list(
                              'duration' = 1000,
                              'easing' = 'inAndOut'
                          )
                      )
    ),
    
    fluidRow(
        shiny::column(4, offset = 4,
                      sliderInput("year", "Year",
                                  min = min(dataset$Year), max = max(dataset$Year),
                                  value = min(dataset$Year), animate = TRUE)
        )
    ),
    fluidRow(
    )
))