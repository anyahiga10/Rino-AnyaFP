library(stringr)
library(dplyr)
library(ggplot2)
library(plotly)
source("data_wrangling.R")

# make a df for plot and rename the columns to make it UI-friendly
df_for_plot <- select(extracted_df, -pct_mod_inneed, -a_anc_4plus, -a_facility_delivery_yes)
names(df_for_plot) [1] <- "Country"
names(df_for_plot) [2] <- "Region"
names(df_for_plot) [3] <- "Average % of Technology Access"
names(df_for_plot) [4] <- "Autonomy Level"
names(df_for_plot) [5] <- "% of unintended pregrancies"
names(df_for_plot) [6] <- "% of maternal deaths due to unsafe abortions"
names(df_for_plot) [7] <- "Total maternal deaths per 100,000 live births"
#make note that they are needing/wanting to avoid pregnancy in notes
names(df_for_plot) [8] <- "% of traditional/no contraceptive method use"
names(df_for_plot) [9] <- "% of women with less than four ANC visits"
names(df_for_plot) [10] <- "% of women who did not deliver in a health facility"

# box plot : contrast (by autonomy levels)

autonomy_vs_plot <- function(column) {
  select_colname <- select(df_for_plot, matches(column), "Autonomy Level", Country)

  box_plt <- ggplot(df_for_plot, aes(x = select_colname[,2], y = select_colname[,1], text = Country)) + 
            geom_boxplot() +
            labs(x = "Level of technology/financial autonomy", y = column,
                 title = paste("Technology/Financial autonomy VS", column))     
  
  box_plt <- ggplotly(box_plt, tooltip = "text")
  
  return(box_plt)
}
#(autonomy_vs_plot("% of modern contraceptive method use among women needing/wanting to avoid pregnancy"))

# scatterplot : outlier (by percentage of avg technology access)

tech_pct_vs_plot <- function(column) {
  
  select_colname <- select(df_for_plot, matches(column), "Average % of Technology Access", Region, Country)

  scatter_plt <- ggplot(select_colname, aes(x = select_colname[,2], y = select_colname[,1], text = Country)) +
                geom_point(aes(col = Region)) +
                labs(x = "Avg % of technology access", y = column,
                     title = paste("Avg % of technology access VS", column),
                     color = "Region")
  
  scatter_plt <- ggplotly(scatter_plt, tooltip = "text")
  
  return(scatter_plt)
}
#plot(tech_pct_vs_plot("% of modern contraceptive method use among women needing/wanting to avoid pregnancy"))

# bar chart : zoom in to regions (by region)

country_vs_plot <- function(column, region) {
  by_region <- df_for_plot[df_for_plot$Region == region,]
  
  select_colname <- select(by_region, matches(column), Country, `Autonomy Level`)
  select_colname <- na.omit(select_colname)
  
  bargraph <- ggplot(select_colname, aes(x = reorder(select_colname[,2], select_colname[,1]), y = select_colname[,1], fill = select_colname[,3], text = Country)) +
              geom_bar(stat = "identity") +
              labs(x = "", y = column,
                   title = paste("Countries in a sepcific region vs", column),
                   fill = "Autonomy Level") +
              theme(axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1)) +
              coord_flip() 
  
  bargraph <- ggplotly(bargraph, tooltip = "text")
  
  return(bargraph)
}
#plot(country_vs_plot("% of maternal deaths due to unsafe abortions", "Africa"))
