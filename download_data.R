# Install HelpersMG packages
install.packages("HelpersMG")
# Import HelpersMG Library
library(HelpersMG)

# Global variable
ROOT_DIRECTORY = Sys.getenv("ROOT_DIRECTORY")

# Set working directory
working_directory = paste(ROOT_DIRECTORY,"data/raw_data/",sep="")
setwd(working_directory)

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