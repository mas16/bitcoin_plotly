library(lubridate)
library(plotly)

setwd("/Users/matthewstetz/Desktop/bitcoin-historical-data/")

test <- read.csv("coinbaseUSD_1-min_data_2014-12-01_to_2019-01-09.csv")

test$Timestamp <- as_datetime(test$Timestamp) 

time_cutoff <- ymd_hms("2018-12-07 00:00:01")

test2 <- test[!is.na(test$Weighted_Price), ]

test2 <- test2[test2$Timestamp > time_cutoff,]

title <- "Bitcoin Value Dec 2018 - Jan 2019"
x <- list(title="Date")
y <- list(title="Value (USD)")

p <- plot_ly(x=test2$Timestamp, y=test2$Weighted_Price, mode="lines") %>%
        layout(title=title, xaxis=x, yaxis=y)
p