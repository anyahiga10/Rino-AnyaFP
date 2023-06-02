library(stringr)
library(dplyr)
library(ggplot2)
library(shiny)

source("data_viz.R")
source("data_wrangling.R")

get_viz <- function(viz_selection){
  if(viz_selection == "average technolgy vs"){
    return(tech_pct_vs_plot("% of modern contraceptive method use"))
  } else if(viz_selection == "countries vs"){
    return(country_vs_plot("% of maternal deaths due to unsafe abortions", "Africa"))
  } else {
    return(autonomy_vs_plot("% of modern contraceptive method use"))
  }
}

get_viz_title <- function(viz_selection){
  if(viz_selection == "average technolgy vs"){
    return(h1("Scatter Plot: outliers/factors"))
  } else if(viz_selection == "countries vs"){
    return(h1("Bar Chart: Zoom in"))
  } else {
    return(h1("Box plot: Contrast"))
  }
}

get_viz_description <- function(viz_selection){
  if(viz_selection == "average technolgy vs"){
    return(p("Through utilizing the scatter plot to discover
              outliers one can evaluate the countries with
              extreme differences between percentage of
              technology autonomy and percentage of
              maternal deaths due to unsafe abortions. We
              can see here some Asian countries, such as,
              Malaysia, Thailand, and Mongolia, tend to be
              the extreme outliers with high percentage of
              technology autonomy, however, also a high
              maternal death rate with unsafe abortions. 
             In addition to seeing the outliers, by grouping 
             the countries by region we can see a trend within 
             the regions and also see how these factors can influence 
             the bigger region of each country. These outliers support 
             the story that abortions are a taboo topic in a lot of countries 
             in Southeast Asia, despite their high percentage of technology 
             autonomy for women."))
  } else if(viz_selection == "countries vs"){
    return(p("The use of a bar chart and multiple filters allowed us to use
              the \"zoom\" in data story type for a bar chart. In the bar chart: zoom in page,
             you will be able to choose two filters, the region and the factor.
             With the region filter, one is able to "))
  } else {
    return(p("For the box plot we can look at our 5
              categories of autonomy levels and observe a
              trend in how it may correlate with the amount of
              women who use modern contraceptives with
              the goal to prevent pregnancy. We can look at
              the graph and the two extremes show a very
              insightful story. The higher the technology
              autonomy levels are the higher use of modern
              birth control methods are. This would make
              sense because with more access to technology, 
             the more informed adolescent women are, and the 
             more they can seek out these modern birth control 
             methods. we could also look at the outliers within 
             this graph, similar to the last one, to look at what 
             factors may contribute to the lack of reproductive 
             information and safe resources."))
  }
}

get_article <- function(article_name){
  if(article_name == "A Time for Change") {
    return(a(em("A Time for Change: Advancing Sexual and Reproductive Health and Rights in a New Global Era"), href = "https://www.guttmacher.org/gpr/2021/02/time-change-advancing-sexual-and-reproductive-health-and-rights-new-global-era"))
  } else if(article_name == "Lack of Access") {
    return(a(em("Lack of Access to Sexual, Reproductive Health Education and Rights Results in Harmful Practices, Impedes Sustainable Development, Speakers Tell Population Commission"), href = "https://press.un.org/en/2023/pop1106.doc.htm"))
  } else if(article_name == "In a post-Roe era") {
    return(a(em("In a post-Roe era, the internet could help or hurt women seeking abortions. Here's how."), href = "https://www.northjersey.com/story/news/2022/06/24/roe-vs-wade-2022-activists-online-abortion-access-digital-privacy/7624068001/"))
  } else if(article_name == "Women’s Equality Day"){
    return(a(em("Women’s Equality Day: Celebrating the 19th Amendment’s Impact on Reproductive Health and Rights"), href = "https://www.americanprogress.org/article/womens-equality-day-celebrating-the-19th-amendments-impact-on-reproductive-health-and-rights/"))
  } else {
    return(a(em("Women's Autonomy, Equality and Reproductive Health in International Human Rights: Between Recognition, Backlash and Regressive Trends"), href = "https://www.ohchr.org/sites/default/files/Documents/Issues/Women/WG/WomensAutonomyEqualityReproductiveHealth.pdf"))
  }
}

get_description <- function(article_name){
  if(article_name == "A Time for Change") {
    return("This article focuses more on the impacts of the politics (Biden-Harris/ Trump-Pence 
    administration and other donor governments, multilateral institutions, low- and middle-income 
    country (LMIC) governments, and civil society organizations). This article also talks a lot about 
    the pre-pandemic, pandemic, and post pandemic state of reproductive healthcare and the impact of 
    COVID-19")
  } else if(article_name == "Lack of Access") {
    return("This article explains how education is a key driver of gender equality and access to sexual 
    education gives women and girls the ability to make informed decisions about their own lives. It has 
    inspired us to question whether access to sexual education is greater for those with internet and 
    technology.")
  } else if(article_name == "In a post-Roe era") {
    return("This article explains how social media greatly affects reproductive rights and access to 
    information in the US. From this, we think that there is a correlation between the rate of ICT 
    access and adolescent’s reproductive health outcomes across the world.")
  } else if(article_name == "Women’s Equality Day"){
    return("This article compares US Women's rights throughout history and some on the impacts of 
    reproductive rights. It also explains how economics has impacted women's rights in the US and 
    thus impacted policy through women and the realization of how big an economic role is in 
    reproductive rights.")
  } else {
    return("This talks about the UN and more specific to rights specifically within pregnancy.
    They talk about women's autonomy and how each country's policies have pushed back on these topics.
    They also go more into the specifics about abortions.")
  }
}