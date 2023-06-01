library(shiny)
library(dplyr)
library(ggplot2)

source("data_wrangling.R")
source("functions.R")

#pages
introductory_pg <- tabPanel("Technology and Reproductive Health",
   titlePanel("WELCOME!!!"),
   br(),
   p("Thank you for checking out our page! This application uses three types of data visualizations and data storytelling
     to explore the possible connections between technology access and reproductive health for adolecent women. Feel free
     to click on any of our three pages that display these stories and data!"),
   br(),
   sidebarLayout(
     sidebarPanel(
       radioButtons(
         inputId = "data",
         label = "Choose a group of data",
         choices = c("average technolgy vs", "countries vs", "autonomy levels vs")
       )
     ),
     mainPanel(
       h3("learn more here"),
       #htmlOutput(outputId = "data_viz"),
       #htmlOutput(outputId = "description"),
       #htmlOutput(outputId = "notices"),
     )
   ),
   br(),
   h1("Goals of this Project"),
   p("Our analysis will involve comparing two datasets that provide information on technology and financial 
     inclusion and sexual and reproductive health outcomes for adolescent females, defined as 15-19, in multiple 
     countries. We will use our knowledge of R and statistical analysis methods to identify any patterns or trends 
     that emerge from these variables in our two datasets."), 
   br(),
   p("Our hypothesis is that there will be a positive correlation 
     between access to technology and positive sexual and reproductive health outcomes among adolescent females. We 
     believe that greater access to mobile phones, digital payments and the internet can provide individuals with 
     greater agency and autonomy to seek out and utilize resources and support related to sexual and reproductive health. 
     This can be particularly valuable for individuals who may face stigma or discrimination related to their sexual and 
     reproductive health, and who may not have access to accurate and up-to-date information through traditional channels 
     such as schools."),
   br(),
   p("This angle is important to note as technology is increasingly playing a bigger role in youth 
     education. Updating curriculum in school systems at the speed of the internet is not realistic. With greater access 
     to the internet, people, more specifically adolescence, will be more likely to be able to identify trustworthy 
     educational resources with a stronger internet literacy. Additionally, financial autonomy can empower female 
     adolescents to make decisions related to their health."),
   br(),
   p("Overall, our project has the potential to contribute to a 
     deeper understanding of the sexual and reproductive health in adolescents. A potential correlation between the two 
     would highlight the importance of utilizing technology and the mobile payment systems to promote greater autonomy 
     for female adolescents seeking to exercise their sexual and reproductive health rights. With our findings, 
     policymakers, healthcare providers, and other stakeholders working to improve sexual and reproductive health outcomes 
     for adolescent females worldwide could make larger advancements in reducing these inequalities."),
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
  output$data_viz <- renderUI({
  })
}

shinyApp(ui, server)
