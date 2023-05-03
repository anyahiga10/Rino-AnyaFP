library(stringr)
library(dplyr)
#merging

#internet data frames
account_ownership_df <- read.csv("Account ownership at a financial institution or with a mobile-money-service provider (% of population ages 15+).csv")
made_recieved_digital_payments_df <- read.csv("Made or received digital payments in the past year (% age 15+).csv")
umpi_access_account_df <- read.csv("Used a mobile phone or the internet to access an account (% with an account, age 15+).csv")
umpi_buy_something_online_df <- read.csv("Used a mobile phone or the internet to buy something online in the past year(% age 15+).csv")
umpi_pay_bills_df <- read.csv("Used a mobile phone or the internet to pay bills in the past year (% age 15+).csv")

#adolescent data frame
adolescent_df <- read.csv("AIU Adolescent Dataset.csv")

#get only female population
account_ownership_df <- account_ownership_df[str_detect(account_ownership_df$Indicator.Name, "female") == TRUE,]
made_recieved_digital_payments_df <- made_recieved_digital_payments_df[str_detect(made_recieved_digital_payments_df$Indicator.Name, "female") == TRUE,]
umpi_access_account_df <- umpi_access_account_df[str_detect(umpi_access_account_df$Indicator.Name, "female") == TRUE,]
umpi_buy_something_online_df <- umpi_buy_something_online_df[str_detect(umpi_buy_something_online_df$Indicator.Name, "female") == TRUE,]
umpi_pay_bills_df <- umpi_pay_bills_df[str_detect(umpi_pay_bills_df$Indicator.Name, "female") == TRUE,]

#get only 2017 years
account_ownership_df_clean <- account_ownership_df[account_ownership_df$Year == 2017,]
made_recieved_digital_payments_df_clean <- made_recieved_digital_payments_df[made_recieved_digital_payments_df$Year == 2017,]
umpi_access_account_df_clean <- umpi_access_account_df[umpi_access_account_df$Year == 2017,]
umpi_buy_something_online_df_clean <- umpi_buy_something_online_df[umpi_buy_something_online_df$Year == 2017,]
umpi_pay_bills_df_clean <- umpi_pay_bills_df[umpi_pay_bills_df$Year == 2017,]

#merge by country
adolescent_internet_df <- merge(account_ownership_df_clean, made_recieved_digital_payments_df_clean, by = "Country.Name")

#cleaning

#augmentation
#Must create at least one new categorical variable 
#Must create at least one new continuous/numerical variable 
#Must create at least one summarization data frame