# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

# Global variable
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

# Method to get data.frame of metrics
get_metrics_df <- function() {
  # Create empty metrics data.frame
  metrics <- data.frame(matrix(ncol = 4, nrow = 3))
  # Set column names
  colnames(metrics) <- c("Fund Name", "Tracking Error", "Info Ratio", "Beta")
  # List of funds
  funds <- list(dataset$Fund1,dataset$Fund2,dataset$Fund3)
  
  for(i in 1:3) {
    # Set values
    metrics[i,"Fund Name"] <- c("Fund 1", "Fund 2", "Fund 3")[i]
    metrics[i,"Tracking Error"] <- calculate_annualized_ex_post_tracking_error(funds[[i]])
    metrics[i,"Info Ratio"] <- calculate_annualized_information_ratio(funds[[i]])
    metrics[i,"Beta"] <- calculate_beta(funds[[i]])
  }

  # Round calculated values
  metrics[2:4] <- as.data.frame(lapply(metrics[,2:4],function(x) round(x,3)))
  
  # Return metrics
  return(metrics)
}

# Save metrics data.frame
metrics_df <- get_metrics_df()
# Display metrics data.frame
metrics_df