library(stringr)
library(dplyr)
#merging and cleaning

#internet data frames
account_ownership_df <- read.csv("Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+).csv")
made_recieved_digital_payments_df <- read.csv("Made or received digital payments in the past year (% age 15+).csv")
umpi_access_account_df <- read.csv("Used a mobile phone or the internet to access an account (% with an account, age 15+).csv")
umpi_buy_something_online_df <- read.csv("Used a mobile phone or the internet to buy something online in the past year(% age 15+).csv")
umpi_pay_bills_df <- read.csv("Used a mobile phone or the internet to pay bills in the past year (% age 15+).csv")

#adolescent data frame
adolescent_df <- read.csv("AIU Adolescent Dataset.csv")
colnames(adolescent_df)[1] <- "Country.Name"
adolescent_df <- subset(adolescent_df, select = -c(a_data_source_year, a_region, a_subregion, a_iso_numeric))

#get only female population
account_ownership_df <- account_ownership_df[str_detect(account_ownership_df$Indicator.Name, "female") == TRUE,]
made_recieved_digital_payments_df <- made_recieved_digital_payments_df[str_detect(made_recieved_digital_payments_df$Indicator.Name, "female") == TRUE,]
umpi_access_account_df <- umpi_access_account_df[str_detect(umpi_access_account_df$Indicator.Name, "female") == TRUE,]
umpi_buy_something_online_df <- umpi_buy_something_online_df[str_detect(umpi_buy_something_online_df$Indicator.Name, "female") == TRUE,]
umpi_pay_bills_df <- umpi_pay_bills_df[str_detect(umpi_pay_bills_df$Indicator.Name, "female") == TRUE,]

#get only 2017 years, rename columns, and delete columns
account_ownership_df <- account_ownership_df[account_ownership_df$Year == 2017,]
colnames(account_ownership_df)[6] <- "Account, female (% age 15+)"
account_ownership_df <- subset(account_ownership_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

made_recieved_digital_payments_df <- made_recieved_digital_payments_df[made_recieved_digital_payments_df$Year == 2017,]
colnames(made_recieved_digital_payments_df)[6] <- "Made or received a digital payment, female (% age 15+)"
made_recieved_digital_payments_df <- subset(made_recieved_digital_payments_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

umpi_access_account_df <- umpi_access_account_df[umpi_access_account_df$Year == 2017,]
colnames(umpi_access_account_df)[6] <- "Used a mobile phone or the internet to access an account, female (% age 15+)"
umpi_access_account_df <- subset(umpi_access_account_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

umpi_buy_something_online_df <- umpi_buy_something_online_df[umpi_buy_something_online_df$Year == 2017,]
colnames(umpi_buy_something_online_df)[6] <- "Used a mobile phone or the internet to buy something online, female (% age 15+)"
umpi_buy_something_online_df <- subset(umpi_buy_something_online_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))


umpi_pay_bills_df <- umpi_pay_bills_df[umpi_pay_bills_df$Year == 2017,]
colnames(umpi_pay_bills_df)[6] <- "Used a mobile phone or the internet to pay bills, female (% age 15+)"
umpi_pay_bills_df <- subset(umpi_pay_bills_df, select = -c(Indicator.Name, Indicator.Code, Country.Code, Year, Disaggregation))

#merge all technology df by country
technology_df <- merge(account_ownership_df, made_recieved_digital_payments_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_access_account_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_buy_something_online_df, by = "Country.Name")
technology_df <- merge(technology_df, umpi_pay_bills_df, by = "Country.Name")

#merge adolescent df with internet df
adolescent_technology_df <- merge(technology_df, adolescent_df, by = "Country.Name")

#additional cleaning
adolescent_technology_df <- subset(adolescent_technology_df, select = -c(a_ipreg_abortion))
#delete any rows with lots of missing data? (about 10 countries)

#augmentation
#Must create at least one new categorical variable 
#Must create at least one new continuous/numerical variable 
#Must create at least one summarization data frame