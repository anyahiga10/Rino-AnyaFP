library(stringr)
library(dplyr)
library(ggplot2)
source("data_wrangling.R")

#box plot : constrast
box_plt <- ggplot(extracted_df, aes(x = autonomy_levels, y = pct_mod_inneed)) +
  geom_boxplot() 
#        geom_text(aes(label = ifelse(a_pct_upreg >= 0.6, Country.Name, "")))

#plot(box_plt)

# scatter1 <- ggplot(extracted_df, aes(x = avg_technology, y = pct_mod_inneed)) + 
#           geom_point(aes(col = a_region)) +
#           geom_text(aes(label = ifelse(pct_mod_inneed >= 75 | avg_technology >= 40, Country.Name, "")))
# plot(scatter1)
# 
# scatter2 <- ggplot(extracted_df, aes(x = avg_technology, y = a_pct_matdeaths_unsafeabs)) +
#   geom_point(aes(col = a_region)) +
#   geom_text(aes(label = ifelse(a_pct_matdeaths_unsafeabs >= 0.2 | avg_technology >= 40, Country.Name, "")))
# plot(scatter2)
# 

# scatterplot : outlier

# scatter3 <- ggplot(adolescent_technology_df, aes(x = avg_technology, y = a_pct_matdeaths_unsafeabs)) +
#   geom_point(aes(col = a_region)) +
#   geom_text(aes(label = ifelse(a_pct_matdeaths_unsafeabs >= 0.2 | avg_technology >= 40, Country.Name, "")))
# 
# plot(scatter3)


# world_shape <- map_data("world")
# map <- ggplot(world_shape) +
#        geom_polygon(
#          mapping = aes(x = long, y = lat, group = group),
#          color = "white", 
#          linewidth = .1
#        ) +
#       coord_map()
# 
# plot(map)

# visits to anc by region violin plot

violin <- ggplot(extracted_df, aes(x = autonomy_levels, y = a_pct_upreg, fill = autonomy_levels)) +
  geom_violin()

plot(violin)

africa_filter <- extracted_df[extracted_df$a_region == "Africa", ]
africa_scatter <- ggplot(africa_filter, aes(x = avg_technology, y = a_rate_matdeaths)) +
  geom_point()

plot(africa_scatter)

africa_bar <- ggplot(africa_filter, aes(x = reorder(Country.Name, a_rate_matdeaths), y = a_rate_matdeaths)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = ifelse(a_rate_matdeaths > 500, Country.Name, "")))

plot(africa_bar)

asia_filter <- extracted_df[extracted_df$a_region == "Asia", ]
asia_bar <- ggplot(asia_filter, aes(x = reorder(Country.Name, a_rate_matdeaths), y = a_rate_matdeaths)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = ifelse(a_rate_matdeaths > 500, Country.Name, "")))

#plot(asia_bar)