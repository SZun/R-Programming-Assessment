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
# Method to calculate annualized alpha from linear regression
calculate_annualized_alpha <- function(linear_regression) {
  # Calculate annualized alpha
  alpha <- linear_regression$coefficients[[1]] * 12
  # Return alpha
  return(alpha)
}

get_alpha_t_stat <- function() {}

get_developed_market_beta <- function() {}

get_developed_market_t_stat <- function() {}

get_developed_size_beta <- function() {}

get_developed_size_t_stat <- function() {}

get_developed_value_beta <- function() {}

get_developed_value_t_stat <- function() {}

# Method to get the adjusted r squared value from the linear regression
get_adjusted_r_squared <- function(linear_regression) {
  # Get Adjusted R Squared
  adj_r2 <- summary(linear_regression)$adj.r.squared
  # Return Adjusted R Squared
  return(adj_r2)
}

get_model_statistics_df <- function() {}

model_stats_df <- get_model_statistics_df()
model_stats_df