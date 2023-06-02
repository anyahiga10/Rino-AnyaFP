library(shiny)
library(dplyr)
library(ggplot2)

source("data_wrangling.R")
source("functions.R")

#NOTES
#figure out image options

#pages
introductory_pg <- tabPanel("Technology and Reproductive Health",
   titlePanel(h1("WELCOME!!!")),
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
   img("Data Nutrition Label", src = "C:\\Users\\anyah\\OneDrive\\Desktop\\info 201\\Final Project\\Rino-AnyaFP\\DataNutritionLabel.pdf"),
   p("Our hypothesis is that there will be a positive correlation 
     between access to technology and positive sexual and reproductive health outcomes among adolescent females. We 
     believe that greater access to mobile phones, digital payments and the internet can provide individuals with 
     greater agency and autonomy to seek out and utilize resources and support related to sexual and reproductive health. 
     This can be particularly valuable for individuals who may face stigma or discrimination related to their sexual and 
     reproductive health, and who may not have access to accurate and up-to-date information through traditional channels 
     such as schools."),
   p("This angle is important to note as technology is increasingly playing a bigger role in youth 
     education. Updating curriculum in school systems at the speed of the internet is not realistic. With greater access 
     to the internet, people, more specifically adolescence, will be more likely to be able to identify trustworthy 
     educational resources with a stronger internet literacy. Additionally, financial autonomy can empower female 
     adolescents to make decisions related to their health."),
   p("Overall, our project has the potential to contribute to a 
     deeper understanding of the sexual and reproductive health in adolescents. A potential correlation between the two 
     would highlight the importance of utilizing technology and the mobile payment systems to promote greater autonomy 
     for female adolescents seeking to exercise their sexual and reproductive health rights. With our findings, 
     policymakers, healthcare providers, and other stakeholders working to improve sexual and reproductive health outcomes 
     for adolescent females worldwide could make larger advancements in reducing these inequalities."),
)

background_pg <- tabPanel("Background",
  titlePanel(h1("Learn more about our data and inspiration behind this project")),
  br(),
  
  h2("Inspiration"),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "article_name",
        label = "Choose an article",
        choices = c("Women's Autonomy",
                    "A Time for Change", 
                    "Lack of Access",
                    "In a post-Roe era",
                    "Women’s Equality Day"
        )
      ),
    ),
    mainPanel(
      h3(htmlOutput(outputId = "article_display")),
      p(htmlOutput(outputId = "article_description")),
    ),
  ),
  
  br(),
  
  h2("Data Sources"),
  a(h3(em("Adding It Up: Investing in Sexual and Reproductive Health 2019 - Methodology Report Supplementary Materials")), href = "https://osf.io/nmf8k/?view_only="),
  p("- Observations: 133"),
  p("- Features: 156"),
  p("- This dataset is about sexual and reproductive health costs and outcomes of adolescent females 
    (defined as 15-19) across a multitude of countries."),
  p("Because this dataset spans such a large area of topics they had published a methodology report 
  about how they collected all their findings. While reading through multiple reports, there are a 
  couple notable strategies to their data collection. They pull from a variety of surveys and other 
  foundations data with the addition of their own estimates. They also pull data from their past reports. 
  Costs are broken up into indirect and direct costs. \"Direct costs are estimated using a bottom-up, 
  ingredients approach, meaning that the costs of resources required to provide a given service are added 
  together to produce a total cost...\"Indirect costs, referred to as programs and systems costs, are 
  estimated by applying region-specific markup rates to direct costs...Estimates of the types and 
  quantities of resources required to provide contraceptive services, pregnancy-related and newborn 
  health care, and STI care are based on assumptions from the Lives Saved Tool (Spectrum Version 5.73) 
  and the OneHealth Tool, supplemented by scientific literature, World Health Organization (WHO) policies
  and general recommendations, and expert review. Country-specific personnel salaries come from WHO-CHOICE
  personnel cost estimates from 2010 and have been inflated to 2019 levels. Contraceptive commodity costs 
  are average prices for 2015–2018 and come from the Reproductive Health Interchange database. Nearly all
  prices for drugs and supplies are drawn from the United Nations Population Fund (UNFPA), UNICEF, 
  Management Sciences for Health and IDA Foundation. The programs and systems costs are based on estimates
  from UNFPA.\" The demographics and health data sources come from surveys from the,\"Demographic and Health
  Surveys, UNICEF Multiple Indicator Cluster Surveys, U.S. Centers for Disease Control Reproductive Health 
  Surveys, The Lancet Stillbirth Epidemiology Investigator Group, and Performance Monitoring for Action 
  Surveys, among others.\""),
  a(em("How are the Adding it Up estimates generated?"), href = "https://www.guttmacher.org/report/adding-it-up-investing-in-sexual-reproductive-health-2019"),
  p("^Source for information found above"),
  a(em("Adding It Up: Investing in Sexual and Reproductive Health 2019—Methodology Report"), href = "https://www.guttmacher.org/report/adding-it-up-investing-in-sexual-reproductive-health-2019-methodology"),
  p("^ A methodology report that goes further into the specific region's sources can be downloaded here."),
  br(),
  a(h3(em("The World Bank: Gender Data Portal")), href = "https://genderdata.worldbank.org/topics/technology/"),
  p("- Observations: 14941"),
  p("- Features: 24"),
  p("- This dataset is compiled of multiple indicators that assesses female access to technology through 
    online accounts across a multitude of countries."),
  p("This dataset contains data sourced from a couple of sources. Including but not limited to, 
  demographic and health surveys, the Global Findex database, UNESCO Institute for Statistics, 
  International Monetary Fund, International Financial Statistics and data files., World Bank national 
  accounts data, and OECD National Accounts data files., UNESCO Institute for Statistics (UIS). 
  UIS.Stat Bulk Data Download Service., and WHO/UNICEF Joint Monitoring Programme (JMP) for Water 
  Supply, Sanitation and Hygiene."),
  
  a(h2(em("link to our github repository!")), href = "https://github.com/anyahiga10/Rino-AnyaFP.git"),
)

scatter_pg <- tabPanel("Scatter Plot",
  titlePanel("Looking at outliers/factors with a scatter plot"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare to the", strong(em("average technology autonomy"))),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_scatter",
        label = "Choose a factor",
        choices = colnames(extracted_df),
      )
    ),
    mainPanel(
      p(htmlOutput(outputId = "scatter")),
    ),
  ),
)

box_pg <- tabPanel("Box Plot",
  titlePanel("Looking at contrasts with a box plot"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare to different", strong(em("average technology autonomy"))),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_box",
        label = "Choose a factor",
        choices = colnames(extracted_df),
      )
    ),
    mainPanel(
      p(htmlOutput(outputId = "box")),
    ),
  ),
)

bar_pg <- tabPanel("Bar Chart",
  titlePanel("Zooming in with a bar chart"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare different", strong(em("developing countries"))),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_bar",
        label = "Choose a factor",
        choices = colnames(extracted_df),
      )
    ),
    mainPanel(
      p(htmlOutput(outputId = "bar")),
    ),
  ),
)

#ui and server stuff down
ui <- navbarPage("Rino and Anya Final Project",
                 introductory_pg,
                 background_pg,
                 scatter_pg,
                 box_pg,
                 bar_pg)

server <- function(input, output) {
  
  #background page
  output$article_display <- renderUI({
    get_article(input$article_name)
  })
  output$article_description <- renderUI({
    get_description(input$article_name)
  })
  
  #scatter page
  output$scatter <- renderUI({
    paste("you chose:", input$choose_scatter)
  })
  output$box <- renderUI({
    paste("you chose:", input$choose_box)
  })
  output$bar <- renderUI({
    paste("you chose:", input$choose_bar)
  })
}

shinyApp(ui, server)