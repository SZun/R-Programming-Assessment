# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
getwd()
dataset <- read.csv("./data/dataset.csv")
dataset$X <- NULL

# Method to get the annualized ex-post tracking error
get_annualized_ex_post_tracking_error <- function(fund,benchmark) {
  # Calculate tracking error
  annualized_ex_post_tracking_error <- sd(fund-benchmark) * sqrt(12)
  # Return tracking error
  return(annualized_ex_post_tracking_error)
}

# Method to get annualized information ratio
get_annualized_information_ratio <- function(fund,benchmark) {
  # Calculate information ratio
  information_ratio <- ((fund-benchmark)/sd(fund-benchmark))*sqrt(12)
  # Return information ratio
  return(information_ratio)
}

# Method to get beta
get_beta <- function(fund,benchmark) {
  # Calculate Beta
  beta <- cov(fund,benchmark) / var(benchmark)
  # Return Beta
  return(beta)
}

fund1 <- get_annualized_information_ratio(dataset$Fund1,dataset$Bmark)
fund1

# get_metrics <- function() {
#   tracking_error <- c()
#   information_ratio <- c()
#   betas <- list()
#   
#   benchmark <- dataset$Bmark
#   funds = list(dataset$Fund1,dataset$Fund2,dataset$Fund3)
#   
#   for(i in 1:length(funds)) {
#     tracking_error[i] <- get_annualized_ex_post_tracking_error(funds[[i]],benchmark)
#     information_ratio[i] <- get_annualized_information_ratio(funds[[i]],benchmark)
#     betas[[i]] <- get_beta(funds[[i]], benchmark)
#   }
#   
#   metrics <- data.frame(
#     Fund1 = c(
#       Tracking_Error=tracking_error[1],
#       Information_Ratio=information_ratio[1],
#       Beta=beta[[i]]
#     ),
#     Fund2 = c(
#       Tracking_Error=tracking_error[2],
#       Information_Ratio=information_ratio[2],
#       Beta=beta[2]
#     ),
#     Fund3 = c(
#       Tracking_Error=tracking_error[3],
#       Information_Ratio=information_ratio[3],
#       Beta=beta[3]
#     )
#   )
#   
#   return(metrics)
# }

# metrics <- get_metrics()


