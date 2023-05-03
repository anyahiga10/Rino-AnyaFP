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

#cleaning


#augmentation
#Must create at least one new categorical variable 
#Must create at least one new continuous/numerical variable 
#Must create at least one summarization data frame