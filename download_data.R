# If HelpersMG not installed, uncomment the line below
#install.packages("HelpersMG")
# Import HelpersMG Library
library(HelpersMG)

# Set working directory
setwd("./data/raw_data/")

# Set download url and .zip path
download_url = paste("http://mba.tuck.dartmouth.edu/pages/faculty/ken.french/ftp/",
                     "F-F_Research_Data_Factors_CSV",
                     ".zip",
                     sep="")
zip_path <- paste(getwd(),
                  "/F-F_Research_Data_Factors_CSV",
                  ".zip"
                  ,sep="")

# Download .zip
wget(download_url)

# Unzip and Delete .zip
unzip(zip_path)
unlink(zip_path)