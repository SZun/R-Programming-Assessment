# Install tidyverse package
#install.packages("tidyverse")
# Import readxl libaray
library(readxl)

# Global varaibled
RAW_DATA_DIRECTORY = "./raw_data/"

#Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/data/")

# Utility method to display data
display_data <- function(data) {
  head(data)
  tail(data)
  str(data)
  summary(data)
  nrow(data)
}

# Method to read, transform and return Excel file
get_xlsx_list <- function(file_name, read_method) {
  path <- paste(RAW_DATA_DIRECTORY,file_name,".xlsx",sep="")
  list <- read_excel(path)
  list$Date <- as.Date(dates_col, format= "%Y-%m-%d")
  list[2:ncol(list)] <- lapply(list[2:ncol(list)],function(x) round(x*100,2))
  return(list)
}

# Median imputation method for funds NA values
median_imputation <- function(funds) {
  funds[is.na(funds$Fund2), "Fund2"] <- median(funds[!is.na(funds$Fund2), "Fund2"][[1]])
  funds[is.na(funds$Fund3), "Fund3"] <- median(funds[!is.na(funds$Fund3), "Fund3"][[1]])
  return(funds)
}

# Method to read, transform and return factors
get_factors <- function(dates) {
  factors_file_path = paste(RAW_DATA_DIRECTORY,"F-F_Research_Data_Factors.CSV", sep="")
  factors <- read.csv(factors_file_path,header=F)[856:1094,]
  row.names(factors) <- NULL
  colnames(factors) <- c("Date","Mkt-RF","SMB","HML","RF")
  factors$Date <- dates
  return(factors)
}


# Get funds 
funds <- get_xlsx_list("Funds")
# Replace NA values
funds <- median_imputation(funds)
# Display
display_data(funds)

# Get Benchmark
benchmark <- get_xlsx_list("Bmark")
# Display
display_data(benchmark)

# Get Factors
factors <- get_factors(funds$Date)
# Display
display_data(factors)

# Merge data
data <- merge(merge(funds,benchmark,by.x = "Date"),factors,by.x = "Date")
# Display
display_data(data)