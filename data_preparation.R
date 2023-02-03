#install.packages("tidyverse")
library(readxl)

RAW_DATA_DIRECTORY = "./raw_data/"

setwd("~/Documents/repos/R-Programming-Assessment/data/")

display_data <- function(data) {
  head(data)
  tail(data)
  str(data)
  summary(data)
  nrow(data)
}

get_xlsx_list <- function(file_name, read_method) {
  path <- paste(RAW_DATA_DIRECTORY,file_name,sep="")
  list <- read_excel(path)
  return(list)
}

get_factors <- function(dates) {
  factors_file_path = paste(RAW_DATA_DIRECTORY,"F-F_Research_Data_Factors.CSV", sep="")
  factors <- read.csv(factors_file_path,header=F)[856:1094,]
  row.names(factors) <- NULL
  colnames(factors) <- c("Date","Mkt-RF","SMB","HML","RF")
  factors$Date <- dates
  return(factors)
}

funds <- get_xlsx_list("Funds.xlsx")
# display_data(funds)
benchmark <- get_xlsx_list("Bmark.xlsx")
# display_data(benchmark)
factors <- get_factors(funds$Date)
# display_data(factors)

data <- merge(merge(funds,benchmark,by.x = "Date"),factors,by.x = "Date")
# display_date(data)