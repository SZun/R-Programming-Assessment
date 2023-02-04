# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

BENCHMARK <- dataset$Bmark

# Method to calculate the annualized ex-post tracking error
calculate_annualized_ex_post_tracking_error <- function(fund,benchmark=BENCHMARK) {
  # Calculate tracking error
  annualized_ex_post_tracking_error <- sd(fund-benchmark) * 1.2
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

get_fund_metrics <- function(fund) {
  tracking_error <- calculate_annualized_ex_post_tracking_error(fund)
  information_ratio <- calculate_annualized_information_ratio(fund)
  beta <- calculate_beta(fund)
  fund_metrics = c("Tracking Error"=tracking_error,"Information Ratio"=information_ratio,Beta=beta)
  return(fund_metrics)
}

metrics <- data.frame(
    Fund1=get_fund_metrics(dataset$Fund1),
    Fund2=get_fund_metrics(dataset$Fund2),
    Fund3=get_fund_metrics(dataset$Fund3)
  )
metrics