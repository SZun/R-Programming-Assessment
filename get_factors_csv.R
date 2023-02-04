# If HelpersMG not installed, uncomment the line below
#install.packages("HelpersMG")
# Import HelpersMG Library
library(HelpersMG)

# Global variable for CSV File Name
FILE_NAME <- "F-F_Research_Data_Factors_CSV"

# Utility method to get zip file path
get_zip_path <- function(base_url,file_name=FILE_NAME) {
  # Generate character variable for .zip path
  path <- paste(base_url,file_name,".zip",sep="")
  # Return .zip path
  return(path)
}

# Global Variables
DATA_DIRECTORY <- "~/Documents/repos/R-Programming-Assessment/data/raw_data/" # ****Change to your data directory****
ZIP_URL <- get_zip_path("http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/")
ZIP_PATH <- get_zip_path(DATA_DIRECTORY)

# Set working directory
setwd(DATA_DIRECTORY)
# Download .zip using WGET
wget(ZIP_URL)
# Unzip .zip
unzip(ZIP_PATH)
# Delete .zip
unlink(ZIP_PATH)


# LEGACY CODE FOR WEB SCRAPING:
#==========================================
# If tidyverse not installed, uncomment the line below
#install.packages("tidyverse")
# Import rvest
#library(rvest)

# BASE_URL <- "http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/"
# PAGE <- "data_library.html"

# get_url <- function(ending) {
#   url = paste(BASE_URL,ending,sep="")
#   return(url)
# }
# 
# get_document <- function (ending) {
#   page_url <- get_url(ending)
#   document <- read_html(page_url)
#   return(document)
# }
# 
# get_zip_url <- function(document,href_ending=FILE_NAME) {
#   all_hrefs <- document %>%
#     html_nodes("a") %>%
#     html_attr("href")
#   
#   index <- grep(href_ending,as.vector(all_hrefs))
#   href_url <- all_hrefs[[index]]
#   
#   zip_url <- get_url(href_url)
#   
#   return(zip_url)
# }
# 
# zip_url <- get_zip_url(get_document(PAGE), FILE_NAME)
#==========================================
