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
  a(h3(em("Adding It Up: Investing in Sexual and Reproductive Health 2019 - Adolescent Dataset")), href = "https://osf.io/nmf8k/?view_only="),
  
  tags$ul(
    tags$li("Observations: 133"), 
    tags$li("Features: 156"), 
    tags$li("This dataset is about sexual and reproductive health costs and outcomes of adolescent females 
    (defined as 15-19) across a multitude of developing countries.")
  ),
  
  p("This dataset has extensive demographic data that are sourced in late 2010's. It covers a wide range of topics, and the organization behind it has published a methodology report detailing their data collection process. 
  Notable strategies include utilizing various surveys, external data sources, and their own estimates. They also incorporate data from their previous reports. 
  Specifically, the demographic and health data sources include surveys such as the Demographic and Health Surveys, UNICEF Multiple Indicator Cluster Surveys, 
  U.S. Centers for Disease Control Reproductive Health Surveys, The Lancet Stillbirth Epidemiology Investigator Group, and Performance Monitoring for Action Surveys, among others."),
  a(em("How are the Adding it Up estimates generated?"), href = "https://www.guttmacher.org/report/adding-it-up-investing-in-sexual-reproductive-health-2019"),
  p("^Source for information found above"),
  a(em("Adding It Up: Investing in Sexual and Reproductive Health 2019—Methodology Report"), href = "https://www.guttmacher.org/report/adding-it-up-investing-in-sexual-reproductive-health-2019-methodology"),
  p("^ A methodology report that goes further into the specific region's sources can be downloaded here."),
  
  br(),
  
  p("For our analysis, we focus on these indicators:"),
  p(strong(em("% of unintended pregrancies")), ": Percent of all pregnancies that are unintended, country level"),
  p(strong(em("% of maternal deaths due to unsafe abortions")), ": Percent of maternal deaths due to unsafe induced abortion"),
  p(strong(em("Total maternal deaths per 100,000 live births"))),
  p(strong(em("% of traditional/no contraceptive method use")), ": Percent of traditional/no contraceptive method use among women needing/wanting to avoid pregnancy"), 
  p("We created this numerical variable by adding the number of adolescent women using traditional method and number of women using no method, and dividing the sum by the number of adolescents who are needing/wanting to avoid pregnancy"),
  p(strong(em("% of women with less than four ANC visits")), ": Percent of women 15-19 with less than four ANC visits (antenatal care)"),
  p(strong(em("% of women who did not deliver in a health facility")), ": Percent of women 15-19 who did not deliver in a health facility"),

  br(),
  
  a(h3(em("The World Bank: Gender Data Portal")), href = "https://genderdata.worldbank.org/topics/technology/"),
  
  tags$ul(
    tags$li("Observations: 14941"), 
    tags$li("Features: 24"), 
    tags$li("This dataset is compiled of multiple indicators that assesses female access to technology through 
    online accounts across a multitude of countries.")
  ),

  p("This dataset incorporates data from various sources, such as demographic and health surveys, the Global Findex database, the UNESCO Institute for Statistics, the International Monetary Fund, the World Bank, the OECD National Accounts, and the WHO/UNICEF Joint Monitoring Programme for Water Supply, Sanitation, and Hygiene."),
  
  br(),
  
  p("For our analysis, we performed a data merge using five different datasets that contained the following indicators for the female population and the year 2017:"),
  p("1. Account ownership at a financial institution or with a mobile-money-service provider"),
  p("2. Made or received digital payments in the past year"),
  p("3. Used a mobile phone or the internet to access an account"),
  p("4. Used a mobile phone or the internet to buy something online in the past year"),
  p("5. Used a mobile phone or the internet to pay bills in the past year"),
  p("From these data, we created two variables:"),
  p(strong(em("Autonomy Levels")), ": This categorical variable indicates the level of online financial autonomy among female adolescents in each country. It is de rived by calculating the average of two indicators: %of women who made or received digital payments and % of women who have made online purchases. It ranges from below 10%, between 10-20%, between 20-30%, between 30-40%, between 40-50%, and over 50%."),
  p(strong(em("Average % of Technology Access")), ": This variable represents the average percentage of technology and financial autonomy. It is computed by adding up the percentages of five technology indicators and then dividing the sum by 5."),
  
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
        choices = colnames(df_for_plot[5:10]),
      ),
      p("By utilizing the scatter plot, we can analyze the relationship between the percentage of technology access and reproductive health outcomes.
              countries that deviate significantly from the overall trend and serve as outliers. 
             Additionally, grouping the countries by region enables us to explore specific narratives within each region and understand if there are any localized factors 
             influencing the relationship between technology access and reproductive health outcomes."),
    ),
    mainPanel(
      plotlyOutput(
        outputId = "scatter"
      ),
    ),
  ),
  br(),
  h3("Story"),
  p("Notably, certain health indicators exhibit stronger correlations than others in the scatter plot analysis. For instance, when examining traditional/no method contraceptive usage, a strong negative correlation is evident. This implies that as technology access increases, there is a corresponding decrease in the percentage of women using non-modern contraceptive methods."),
  p("Interestingly, a notable outlier is observed in the case of Maldives, represented by a dot in the upper right corner. Despite having a high percentage of average female technology access, the country shows a significant proportion (close to 90%) of women using traditional or no methods of birth control. This observation prompts us to consider additional factors such as tourism, which may provide greater online financial access but might not directly influence changes in traditional practices for women."),
  p("Overall, these findings emphasize the importance of considering contextual factors and outliers when interpreting the strength and nuances of the correlations observed in the scatter plot analysis."),
  br(),
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
        choices = colnames(df_for_plot[5:10]),
      ),
      p("The box plot contrasts the levels of technology/financial autonomy and visually compares the distribution of numerical value for a reproductive health indicator. The box plots illustrate the center, spread, and presence of outliers within each autonomy level, enabling us to identify trends and disparities."),
    ),
    mainPanel(
      plotlyOutput(
        outputId = "box"
      ),
    ),
  ),
  br(),
  h3("Story"),
  p("The analysis of unintended pregnancies in relation to technology/financial autonomy levels reveals intriguing findings. Countries with higher levels of autonomy (greater than 40%) exhibit a wider range of percentages for unintended pregnancies compared to countries with lower autonomy. Surprisingly, the data indicates that as financial autonomy increases, there is a corresponding increase in the percentage of unintended pregnancies in these countries. This challenges the assumption that higher autonomy is directly associated with lower rates of unintended pregnancies among women."),
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
        choices = colnames(df_for_plot[5:10]),
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
  br(),
  h3("Story"),
  p("Notably, when looking at the indicator ‘Total maternal deaths per 100,000 lives’, significant disparities are evident between a few countries and the rest of their respective regions, except for Europe. 
      However, for the majority of indicators, it is apparent that countries with autonomy levels of 10-20% or below consistently exhibit less desirable reproductive health outcomes across all regions."),
  br(),
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
