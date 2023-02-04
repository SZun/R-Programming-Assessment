# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

BENCHMARK <- dataset$Bmark

# Method to calculate the annualized ex-post tracking error
calculate_annualized_ex_post_tracking_error <- function(fund,benchmark=BENCHMARK) {
  # Calculate tracking error
  annualized_ex_post_tracking_error <- sd(fund-benchmark) * 12
  # Return tracking error
  return(annualized_ex_post_tracking_error)
}

# Method to calculate annualized information ratio
calculate_annualized_information_ratio <- function(fund,benchmark=BENCHMARK) {
  # Calculate information ratio
  information_ratio <- ((mean(fund)-mean(benchmark))/sd(fund-benchmark)) * 12
  # Return information ratio
  return(information_ratio)
}

# Method to calculate beta
calculate_beta <- function(fund,benchmark=BENCHMARK) {
  # Calculate Beta
  beta <- cov(fund,benchmark) / var(benchmark)
  # Return Beta
  return(beta)
}

# get_fund_metrics <- function(fund) {
#   tracking_error <- get_annualized_ex_post_tracking_error(funds)
#   information_ratio <- get_annualized_information_ratio(funds)
#   beta <- get_beta(funds)
#   fund_metrics = c(Tracking_Error=tracking_error,Information_Ratio=information_ratio,Beta=beta)
#   return(fund_metrics)
# }
# 
# fund1_metrics <- get_fund_metrics(dataset$Fund1)
# fund2_metrics <- get_fund_metrics(dataset$Fund2)
# fund3_metrics <- get_fund_metrics(dataset$Fund3)
# metrics <- as.data.frame(Fund1=fund1_metrics,Fund2=fund2_metrics,Fund1=fund3_metrics)
# metrics
