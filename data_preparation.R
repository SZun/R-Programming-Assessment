#install.packages("tidyverse")
#install.packages("dplyr")
library(readxl)
library(dplyr)

setwd("~/Documents/repos/R-Programming-Assessment/")

funds <- read_excel("./data/raw_data/Funds.xlsx")
head(funds)
tail(funds)
str(funds)
summary(funds)

dates_col <- funds$Date
dates_col <- as.Date(dates_col, format= "%Y-%m-%d")

banan <- funds[is.na(funds$Fund1) & (dates_col > "1996-01-01" & dates_col < "1998-01-01"),]
banan


funds.1997 <- funds[(dates_col > "1996-01-01" & dates_col < "1998-01-01"),]
median.1997 <- median(c(funds_1997$Fund1,funds_1997$Fund3))
funds[(dates_col > "1996-01-01" & dates_col < "1998-01-01"),"Fund2"] = median.1997

funds

