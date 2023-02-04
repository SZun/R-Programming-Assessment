# Set working directory
setwd("./")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

# Create empty metrics data.frame
metrics <- data.frame(matrix(ncol = 4, nrow = 3))
# Set column names
colnames(metrics) <- c("Fund Name", "Tracking Error", "Info Ratio", "Beta")

# List of funds
funds <- list(dataset$Fund1,dataset$Fund2,dataset$Fund3)
# Benchmark variable
benchmark <- dataset$Bmark

for(i in 1:nrow(metrics)) {
  # Calculate tracking error
  tracking_error <- sd(funds[[i]]-benchmark)
  # Set values
  metrics[i,"Fund Name"] <- c("Fund 1", "Fund 2", "Fund 3")[i]
  metrics[i,"Tracking Error"] <- tracking_error * 1.2
  metrics[i,"Info Ratio"] <- ((mean(funds[[i]])-mean(benchmark))/tracking_error*10) * 12
  metrics[i,"Beta"] <- cov(funds[[i]],benchmark) / var(benchmark)
}

# Round calculated values
metrics[2:4] <- as.data.frame(lapply(metrics[,2:4],function(x) round(x,3)))

# Display metrics data.frame
metrics