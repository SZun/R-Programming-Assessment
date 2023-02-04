# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

# Method to get linear regression from fund
get_linear_regression <- function(fund, full_dataset=dataset) {
  # Generate linear regression
  lr <- lm(fund + Mkt.RF~SMB + HML + RF, data = full_dataset)
  # Return linear regression
  return(lr)
}

get_annualized_alpha <- function() {}

get_alpha_t_stat <- function() {}

get_developed_market_beta <- function() {}

get_developed_market_t_stat <- function() {}

get_developed_size_beta <- function() {}

get_developed_value_t_stat <- function() {}

get_developed_value_t_stat <- function() {}

get_adjusted_r_squared <- function() {}

get_model_statistics_df <- function() {}

model_stats_df <- get_model_statistics_df()
model_stats_df