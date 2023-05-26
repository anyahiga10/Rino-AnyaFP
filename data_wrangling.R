library(stringr)
library(dplyr)
library(ggplot2)

#merging and cleaning

#cleaning adolescent dataframe

adolescent_df <- read.csv("AIU Adolescent Dataset.csv")
#rename the column name to match the internet df
colnames(adolescent_df)[1] <- "Country.Name"
#remove unnecessary / no data columns 
adolescent_df <- subset(adolescent_df, select = -c(a_data_source_year, a_subregion, a_iso_numeric, a_ipreg_abortion))


#cleaning technology dataframe

#read in technology datasets
account_ownership_df <- read.csv("Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+).csv")
made_received_digital_payments_df <- read.csv("Made or received digital payments in the past year (% age 15+).csv")
umpi_access_account_df <- read.csv("Used a mobile phone or the internet to access an account (% with an account, age 15+).csv")
umpi_buy_something_online_df <- read.csv("Used a mobile phone or the internet to buy something online in the past year(% age 15+).csv")
umpi_pay_bills_df <- read.csv("Used a mobile phone or the internet to pay bills in the past year (% age 15+).csv")

#get only female population
account_ownership_df <- account_ownership_df[str_detect(account_ownership_df$Indicator.Name, "female") == TRUE,]
made_received_digital_payments_df <- made_received_digital_payments_df[str_detect(made_received_digital_payments_df$Indicator.Name, "female") == TRUE,]
umpi_access_account_df <- umpi_access_account_df[str_detect(umpi_access_account_df$Indicator.Name, "female") == TRUE,]
umpi_buy_something_online_df <- umpi_buy_something_online_df[str_detect(umpi_buy_something_online_df$Indicator.Name, "female") == TRUE,]
umpi_pay_bills_df <- umpi_pay_bills_df[str_detect(umpi_pay_bills_df$Indicator.Name, "female") == TRUE,]

#get only 2017 years, rename columns, and delete columns
account_ownership_df <- account_ownership_df[account_ownership_df$Year == 2017,]
colnames(account_ownership_df)[6] <- "account"
account_ownership_df <- subset(account_ownership_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

made_received_digital_payments_df <- made_received_digital_payments_df[made_received_digital_payments_df$Year == 2017,]
colnames(made_received_digital_payments_df)[6] <- "digital_payment"
made_received_digital_payments_df <- subset(made_received_digital_payments_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

umpi_access_account_df <- umpi_access_account_df[umpi_access_account_df$Year == 2017,]
colnames(umpi_access_account_df)[6] <- "umpi_access_account"
umpi_access_account_df <- subset(umpi_access_account_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

umpi_buy_something_online_df <- umpi_buy_something_online_df[umpi_buy_something_online_df$Year == 2017,]
colnames(umpi_buy_something_online_df)[6] <- "umpi_buy_smt_online"
umpi_buy_something_online_df <- subset(umpi_buy_something_online_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

umpi_pay_bills_df <- umpi_pay_bills_df[umpi_pay_bills_df$Year == 2017,]
colnames(umpi_pay_bills_df)[6] <- "umpi_pay_bills"
umpi_pay_bills_df <- subset(umpi_pay_bills_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

#merge all technology df by country
technology_df <- merge(account_ownership_df, made_received_digital_payments_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_access_account_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_buy_something_online_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_pay_bills_df, by = "Country.Name")


#merge adolescent df with internet df
adolescent_technology_original_df <- merge(technology_df, adolescent_df, by = "Country.Name")

#additional cleaning
adolescent_technology_df <- data.frame(adolescent_technology_original_df)
#remove columns about number of women with pregnancy related / new born diseases
adolescent_technology_df <- subset(adolescent_technology_df, select = -c(
                                                   a_pct_sev_preeclamp_need,
                                                   a_pct_eclamp_need,
                                                   a_pct_obstlabor_need,
                                                   a_pct_sepsis_need,
                                                   a_pct_aphem_need,
                                                   a_pct_pphem_need,
                                                   a_pct_sev_preeclamp_care,
                                                   a_pct_eclamp_care,
                                                   a_pct_obstlabor_care,
                                                   a_pct_sepsis_care,
                                                   a_pct_aphem_care,
                                                   a_pct_pphem_care,
                                                   
                                                   a_pct_asphyxia_need,
                                                   a_pct_lbw_need,
                                                   a_pct_sepsisinf_need,
                                                   a_pct_asphyxia_care,
                                                   a_pct_lbw_care,
                                                   a_pct_sepsisinf_care,
                                                   
                                                   a_hivpos_livebirth,
                                                   a_hivpos_livebirth_art,
                                                   a_hiv_perinatal_current,
                                                   a_hiv_perinatal_full,
                                                   a_hiv_general_epidemic))
#remove columns about contraceptive failure rates
adolescent_technology_df <- subset(adolescent_technology_df, select = -c(a_femster_failrate,
                                                                         a_malester_failrate,
                                                                         a_iud_failrate,
                                                                         a_implant_failrate,
                                                                         a_inj_failrate,
                                                                         a_pill_failrate,
                                                                         a_condom_failrate,
                                                                         a_otherhorm_failrate,
                                                                         a_femcondom_failrate,
                                                                         a_lam_failrate,
                                                                         a_fabm_failrate,
                                                                         a_othersup_failrate,
                                                                         a_perabs_failrate,
                                                                         a_withdraw_failrate,
                                                                         a_othertrad_failrate,
                                                                         a_nomethod_failrate))
#remove estimates of the costs to the public or private health facilities for providing services
adolescent_technology_df <- subset(adolescent_technology_df, select = -c(a_curr_costs,
                                                                         a_curr_costs_percap,
                                                                         a_curr_costs_direct,
                                                                         a_curr_costs_progsys,
                                                                         
                                                                         a_curr_cp_costs,
                                                                         a_curr_costs_cp_percap,
                                                                         a_curr_cp_costs_direct,
                                                                         a_curr_cp_costs_progsys,
                                                                         
                                                                         a_curr_prnc_costs,
                                                                         a_curr_costs_prnc_percap,
                                                                         a_curr_prnc_costs_direct,
                                                                         a_curr_prnc_costs_progsys,
                                                                         a_curr_prnc_costs_ipreg,
                                                                         a_curr_prnc_costs_upreg,
                                                                         a_curr_prnc_costs_anc,
                                                                         a_curr_prnc_costs_delpostnatal,
                                                                         a_curr_prnc_costs_newborn,
                                                                         a_curr_prnc_costs_pmtct,
                                                                         
                                                                         a_curr_abortion_pac_costs,
                                                                         a_curr_abortion_pac_costs_percap,
                                                                         a_curr_abortion_costs_direct,
                                                                         a_curr_abortion_costs_progsys,
                                                                         a_curr_abortion_costs_service,
                                                                         a_curr_pac_costs,
                                                                         
                                                                         a_all_costs,
                                                                         a_all_costs_percap,
                                                                         a_all_costs_direct,
                                                                         a_all_costs_progsys,
                                                                         a_all_inc_costs_percap_curr2all,
                                                                         
                                                                         a_all_costs_cp,
                                                                         a_all_costs_cp_percap,
                                                                         a_all_cp_costs_direct,
                                                                         a_all_cp_costs_progsys,
                                                                         
                                                                         a_all_prnc_costs,
                                                                         a_all_costs_prnc_percap,
                                                                         a_all_prnc_costs_direct,
                                                                         a_all_prnc_costs_progsys,
                                                                         a_all_prnc_costs_ipreg,
                                                                         a_all_prnc_costs_upreg,
                                                                         a_all_prnc_costs_anc,
                                                                         a_all_prnc_costs_delpostnatal,
                                                                         a_all_prnc_costs_newborn,
                                                                         a_all_prnc_costs_pmtct,
                                                                         
                                                                         a_all_abortion_pac_costs,
                                                                         a_all_abortion_pac_costs_percap,
                                                                         a_all_abortion_costs_direct,
                                                                         a_all_abortion_costs_progsys,
                                                                         a_all_abortion_costs_service,
                                                                         a_all_pac_costs))


#augmentation


#Must create at least one new continuous/numerical variable 
#average technology and financial autonomy percentage
adolescent_technology_df$avg_technology <- rowMeans(adolescent_technology_df[, c("account", "digital_payment", "umpi_access_account", "umpi_buy_smt_online", "umpi_pay_bills")])
#percentage of modern contraceptive method use among women needing/wanting to avoid pregnancy 
adolescent_technology_df$pct_mod_inneed <- (adolescent_technology_df$a_modmethods / adolescent_technology_df$a_inneed)*100
#percentage of traditional/no contraceptive method use among women needing/wanting to avoid pregnancy 
adolescent_technology_df$pct_trad_inneed <- ((adolescent_technology_df$a_tradmethods + adolescent_technology_df$a_nomethod)/ adolescent_technology_df$a_inneed)*100

#Must create at least one new categorical variable 
#create a variable for the level of online financial autonomy
#take the average between the % of women that made or received digital payments 
  #and the % of women who has bought something online
adolescent_technology_df$avg_autonomy <- ((adolescent_technology_df$digital_payment + adolescent_technology_df$umpi_buy_smt_online) / 2)
adolescent_technology_df$autonomy_levels <- ifelse(adolescent_technology_df$avg_autonomy <= 10, "below 10%",
                                                   ifelse(adolescent_technology_df$avg_autonomy <= 20, "between 10-20%", 
                                                          ifelse(adolescent_technology_df$avg_autonomy <= 30, "between 20-30%",
                                                                 ifelse(adolescent_technology_df$avg_autonomy <= 40, "between 40-50%", "over 50%"))))
                                                                        

#Must create at least one summarization data frame
#extracted df for summarized variables
extracted_df <- adolescent_technology_df[, c("Country.Name", "a_region", "avg_technology", "autonomy_levels", "a_pct_upreg", "a_pct_matdeaths_unsafeabs", "a_rate_matdeaths", "pct_mod_inneed", "pct_trad_inneed", 
                                             "a_anc_less4",
                                             "a_anc_4plus",
                                             "a_facility_delivery_yes",
                                             "a_facility_delivery_no")]

<<<<<<< HEAD
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

#plot(violin)

africa_filter <- extracted_df[extracted_df$a_region == "Africa", ]
africa_scatter <- ggplot(africa_filter, aes(x = avg_technology, y = a_rate_matdeaths)) +
                  geom_point()

#plot(africa_scatter)

africa_bar <- ggplot(africa_filter, aes(x = reorder(Country.Name, a_rate_matdeaths), y = a_rate_matdeaths)) +
              geom_bar(stat = "identity") +
              geom_text(aes(label = ifelse(a_rate_matdeaths > 500, Country.Name, "")))

plot(africa_bar)

asia_filter <- extracted_df[extracted_df$a_region == "Asia", ]
asia_bar <- ggplot(asia_filter, aes(x = reorder(Country.Name, a_rate_matdeaths), y = a_rate_matdeaths)) +
  geom_bar(stat = "identity") +
  geom_text(aes(label = ifelse(a_rate_matdeaths > 500, Country.Name, "")))

plot(asia_bar)

=======
#export to csv
write.csv(adolescent_technology_df, "C:\\Users\\anyah\\OneDrive\\Desktop\\info 201\\Final Project\\Rino-AnyaFP\\adolescent_technology_df.csv", row.names=TRUE)
>>>>>>> 2f14486e7a4f810fc4a0518e4ffed63347bab700
