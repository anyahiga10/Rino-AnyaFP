library(shiny)
library(dplyr)
library(ggplot2)


#pages
introductory_pg <- tabPanel("Technology and Reproductive Health"
                            
)

scatter_pg <- tabPanel("Scatter Plot"

)

box_pg <- tabPanel("Box Plot"
  
)

bar_pg <- tabPanel("Bar Chart"
  
)

#ui and server stuff down
ui <- navbarPage("Rino and Anya Final Project",
                 introductory_pg, 
                 scatter_pg,
                 box_pg,
                 bar_pg)

server <- function(input, output) {
  
}

shinyApp(ui, server)
