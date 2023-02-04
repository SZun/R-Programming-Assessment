# Install tidyverse package
#install.packages("tidyverse")
# Import readxl libaray
library(readxl)

# Global varaible
RAW_DATA_DIRECTORY = "./raw_data/"

#Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/data/")

# Utility method to display data
display_data <- function(data) {
  # Display data
  head(data)
  tail(data)
  str(data)
  summary(data)
  nrow(data)
}

# Method to read, transform and return Excel file
get_xlsx_list <- function(file_name, read_method) {
  # Set file path
  file_path <- paste(RAW_DATA_DIRECTORY,file_name,".xlsx",sep="")
  
  # Read data
  list <- read_excel(file_path)
  
  # Convert dates to Date type
  list$Date <- as.Date(list$Date, format= "%Y-%m-%d")
  # Round values
  list[2:ncol(list)] <- lapply(list[2:ncol(list)],function(x) round(x*100,2))
  
  # Return list
  return(list)
}

# Median imputation method for funds NA values
median_imputation <- function(funds) {
  # Set NA values as median
  funds[is.na(funds$Fund2), "Fund2"] <- median(funds[!is.na(funds$Fund2), "Fund2"][[1]])
  funds[is.na(funds$Fund3), "Fund3"] <- median(funds[!is.na(funds$Fund3), "Fund3"][[1]])
  
  # Return funds
  return(funds)
}

# Method to read, transform and return factors
get_factors <- function(dates) {
  # Set file path
  factors_file_path = paste(RAW_DATA_DIRECTORY,"F-F_Research_Data_Factors.CSV", sep="")
  
  # Read factors
  factors <- read.csv(factors_file_path,header=F)[856:1094,]
  
  # Reset index
  row.names(factors) <- NULL
  # Set column names
  colnames(factors) <- c("Date","Mkt-RF","SMB","HML","RF")
  # Set dates
  factors$Date <- dates
  
  # Return factors
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

# Save data to csv file to data directory
write.csv(data,file="dataset.csv")