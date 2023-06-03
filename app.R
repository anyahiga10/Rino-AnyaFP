library(shiny)
library(dplyr)
library(ggplot2)
library(plotly)
library(shinythemes)

source("data_wrangling.R")
source("functions.R")
source("data_viz.R")

#NOTES
#figure out image options
#write more about data on each page
#tooltip fix

#pages
main_pg <- tabPanel("Technology and Reproductive Health",
                    
  tags$div(class = "jumbotron text-center", style = "margin-bottom:0px;margin-top:0px",
             tags$h2(class = 'jumbotron-heading', stye = 'margin-bottom:0px;margin-top:0px', strong("Comparing Technology and Reproductive Health in Developing Countries")),
             h4("Thank you for checking out our page! This application uses three types of data visualizations and data storytelling
     to explore the possible connections between technology access and reproductive health for adolecent women. Feel free
     to click on any of our three pages that display these stories and data!")
    ),
  
   br(),
   
   sidebarLayout(
     sidebarPanel(
       h3(strong("LEARN MORE HERE")),
       p("Get a preview of what our graphs look like and what actions you can make!"),
       radioButtons(
         inputId = "data",
         label = "Choose a group of data",
         choices = c("average technolgy vs", "countries vs", "autonomy levels vs")
       ),
     ),
     mainPanel(
       h3(htmlOutput(outputId = "viz_title")),
       p(htmlOutput(outputId = "viz_description")),
     ),
   ),
   
   plotlyOutput(
     outputId = "sample_graph"
   ),
   
   br(),
  
  sidebarLayout(
    sidebarPanel(
      img(src = "Page1.png", height = 2500/8, width = 1904/8),
      img(src = "Page2.png", height = 812/8, width = 1904/8),
    ),
    mainPanel(
      h1("Goals of this Project"),
      p("Our analysis will involve comparing two datasets that provide information on technology and financial 
     inclusion and sexual and reproductive health outcomes for adolescent females, defined as 15-19, in multiple 
     countries. We will use our knowledge of R and statistical analysis methods to identify any patterns or trends 
     that emerge from these variables in our two datasets."),
      
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
    ),
  ),
)

background_pg <- tabPanel("Background",
                          
  tags$div(class = "jumbotron text-center", style = "margin-bottom:0px;margin-top:0px",
             tags$h2(class = 'jumbotron-heading', stye = 'margin-bottom:0px;margin-top:0px', strong("Learn More About our Inspiration and Data Behind our Project!")),
           h4("This page talks about the articles we looked at for inspiration for this project and dives deep into our data.")
    ),                        
  hr(),
  
  h3(strong("Inspiration")),
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
  
  hr(),
  
  h3(strong("Data Sources")),
  a(h3(em("Adding It Up: Investing in Sexual and Reproductive Health 2019 - Methodology Report Supplementary Materials")), href = "https://osf.io/nmf8k/?view_only="),
  
  tags$ul(
    tags$li("Observations: 133"), 
    tags$li("Features: 156"), 
    tags$li("This dataset is about sexual and reproductive health costs and outcomes of adolescent females 
    (defined as 15-19) across a multitude of countries.")
  ),
  
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
  
  tags$ul(
    tags$li("Observations: 14941"), 
    tags$li("Features: 24"), 
    tags$li("This dataset is compiled of multiple indicators that assesses female access to technology through 
    online accounts across a multitude of countries.")
  ),

  p("This dataset contains data sourced from a couple of sources. Including but not limited to, 
  demographic and health surveys, the Global Findex database, UNESCO Institute for Statistics, 
  International Monetary Fund, International Financial Statistics and data files., World Bank national 
  accounts data, and OECD National Accounts data files., UNESCO Institute for Statistics (UIS). 
  UIS.Stat Bulk Data Download Service., and WHO/UNICEF Joint Monitoring Programme (JMP) for Water 
  Supply, Sanitation and Hygiene."),
  
  br(),
  br(),

  a(h2(em("link to our github repository!")), href = "https://github.com/anyahiga10/Rino-AnyaFP.git"),
)

scatter_pg <- tabPanel("Outliers",
  titlePanel("Looking at outliers with a scatter plot"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare to the", strong(em("average technology autonomy"))),
  br(),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_scatter",
        label = "Choose a Factor",
        choices = colnames(df_for_plot[5:13]),
      ),
      p("Through utilizing the scatter plot to discover
              outliers one can evaluate the countries with
              extreme differences between percentage of
              technology autonomy and percentage of
              maternal deaths due to unsafe abortions. 
             In addition to seeing the outliers, by grouping 
             the countries by region we can see a trend within 
             the regions and also see how these factors can influence 
             the bigger region of each country."),
    ),
    mainPanel(
      plotlyOutput(
        outputId = "scatter"
      ),
    ),
  ),
)

box_pg <- tabPanel("Contrast",
  titlePanel("Looking at contrasts with a box plot"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare to different", strong(em("average technology autonomy"))),
  br(),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_box",
        label = "Choose a Factor",
        choices = colnames(df_for_plot[5:13]),
      ),
      p("For the box plot we can look at our 5
              categories of autonomy levels and observe a
              trend in how it may correlate with the amount of
              women who use modern contraceptives with
              the goal to prevent pregnancy. We can look at
              the graph and the two extremes show a very
              insightful story. The higher the technology
              autonomy levels are the higher use of modern
              birth control methods are."),
    ),
    mainPanel(
      plotlyOutput(
        outputId = "box"
      ),
    ),
  ),
)

bar_pg <- tabPanel("Zoom In",
  titlePanel("Zooming in with a bar chart"),
  p("Here you should select a", strong(em("reproductive/sexual health factor")) ,"to compare different", strong(em("developing countries"))),
  br(),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "choose_region",
        label = "Choose a Region",
        choices = unique(df_for_plot$Region),
      ),
      selectInput(
        inputId = "choose_bar",
        label = "Choose a factor",
        choices = colnames(df_for_plot[5:13]),
      ),
      p("The use of a bar chart and multiple filters allowed us to use
              the \"zoom\" in data story type for a bar chart. In the bar chart: zoom in page,
             you will be able to choose two filters, the region and the factor.
             With the region filter, one is able to zoom into the region and only look at 
             the countries within the region. Once you select the region you can also choose 
             a specific reproductive/sexual health factor. There are so many possibilities 
             to choose from and lots of stories that can come from them.")
    ),
    mainPanel(
      plotlyOutput(
        outputId = "bar"
      ),
    ),
  ),
)

#ui and server stuff down
ui <- navbarPage("Rino and Anya Final Project", 
                 theme = shinytheme("flatly"),
                 main_pg,
                 background_pg,
                 scatter_pg,
                 box_pg,
                 bar_pg)

server <- function(input, output) {
  #main page
  output$sample_graph <- renderPlotly({
    return(get_viz(input$data))
  })
  output$viz_title <- renderUI({
    get_viz_title(input$data)
  })
  output$viz_description <- renderUI({
    get_viz_description(input$data)
  })
  
  #background page
  output$article_display <- renderUI({
    get_article(input$article_name)
  })
  output$article_description <- renderUI({
    get_description(input$article_name)
  })
  
  #scatter page
  output$scatter <- renderPlotly({
    return(tech_pct_vs_plot(input$choose_scatter))
  })
  
  #box page
  output$box <- renderPlotly({
    return(autonomy_vs_plot(input$choose_box))
  })
  
  #bar page
  output$bar <- renderPlotly({
    return(country_vs_plot(input$choose_bar, input$choose_region))
  })
}

shinyApp(ui, server)
