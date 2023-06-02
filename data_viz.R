library(stringr)
library(dplyr)
library(ggplot2)
source("data_wrangling.R")

# make a df for plot and rename the columns to make it UI-friendly
df_for_plot <- extracted_df
names(df_for_plot) [1] <- "Country"
names(df_for_plot) [2] <- "Region"
names(df_for_plot) [3] <- "Average % of Technology Access"
names(df_for_plot) [4] <- "Autonomy Level"
names(df_for_plot) [5] <- "% of unwanted pregrancies"
names(df_for_plot) [6] <- "% of maternal deaths due to unsafe abortions"
names(df_for_plot) [7] <- "Total maternal deaths per 100,000 live births"
names(df_for_plot) [8] <- "% of modern contraceptive method use among women needing/wanting to avoid pregnancy"
names(df_for_plot) [9] <- "% of traditional/no contraceptive method use among women needing/wanting to avoid pregnancy"
names(df_for_plot) [10] <- "% of women with less than four ANC visits"
names(df_for_plot) [11] <- "% of women with four or more ANC visits"
names(df_for_plot) [12] <- "% of women who delivered in a health facility"
names(df_for_plot) [13] <- "% of women who did not deliver in a health facility"

# box plot : contrast (by autonomy levels)

autonomy_vs_plot <- function(column) {
  select_colname <- df_for_plot[, colnames(df_for_plot) == column]

  box_plt <- ggplot(df_for_plot, aes(x = df_for_plot[4], y = select_colname)) + 
            geom_boxplot() +
            labs(x = "Level of technology and financial autonomy", y = select_colname,
                 title = paste("Technology and Financial autonomy VS", select_colname))             
  #print(select_colname)
  
  return(plot(box_plt))
}
#autonomy_vs_plot("Total maternal deaths per 100,000 live births")

# scatterplot : outlier (by percentage of avg technology access)

tech_pct_vs_plot <- function(column) {
  select_colname <- df_for_plot[, colnames(df_for_plot) == column]
  
  scatter_plt <- ggplot(df_for_plot, aes(x = "Average % of Technology Access", y = select_colname)) +
                geom_point(aes(col = Region)) +
                labs(x = "Average percentage of technology access", y = select_colname,
                     title = paste("Average percentage of technology access VS", select_colname),
                     color = "Region")
  
  return(plot(scatter_plt))
}
#tech_pct_vs_plot("pct_mod_inneed")

# bar chart : zoom in to regions (by region)

country_vs_plot <- function(column, region) {
  select_colname <- df_for_plot[, colnames(df_for_plot) == column]
  
  by_region <- select_colname[select_colname$Region == region, ]
  
  bargraph <- ggplot(by_region, aes(x = reorder(Country, select_colname), y = select_colname)) +
              geom_bar(stat = "identity") 
}
country_vs_plot("% of maternal deaths due to unsafe abortions", Africa)