# Set working directory
setwd("~/Documents/repos/R-Programming-Assessment/")

# Import dataset
dataset <- read.csv("./data/dataset.csv")

# Create empty model statistics data.frame
model_stats = data.frame(data.frame(matrix(ncol = 10, nrow = 3)))

# Vector of column names
column_names <- c("Fund Name", 
                  "Alpha (annualized)",
                  "Alpha t-Stat", 
                  "Developed Market Beta", 
                  "Developed Market t-Stat", 
                  "Developed Size Beta", 
                  "Developed Size t-Stat", 
                  "Developed Value Beta", 
                  "Developed Value t-Stat", 
                  "Adj. R2")
# Set column names
colnames(model_stats) <- column_names

# Vector to hold funds
funds <- c(dataset$Fund1,dataset$Fund2,dataset$Fund3)

# Loop over number of rows in dataframe
for(i in 1:nrow(model_stats)){
  # Save linear regression
  lr <- lm(funds[[i]] + RF~Mkt.RF + SMB + HML, data = dataset)
  # Save linear regression summary
  lr_summary <- summary(lr)
  # Save alpha, beta and t stats
  alpha_beta_t_stat <- lr_summary$coefficients[,c(1,3)]
  
  # Set values
  model_stats[i,column_names[1]] = c("Fund 1", "Fund 2", "Fund 3")[i]
  model_stats[i,column_names[2]] = alpha_beta_t_stat[1,1] * 12
  model_stats[i,column_names[3]] = alpha_beta_t_stat[1,2]
  model_stats[i,column_names[4]] = alpha_beta_t_stat[2,1]
  model_stats[i,column_names[5]] = alpha_beta_t_stat[2,2]
  model_stats[i,column_names[6]] = alpha_beta_t_stat[3,1]
  model_stats[i,column_names[7]] = alpha_beta_t_stat[3,2]
  model_stats[i,column_names[8]] = alpha_beta_t_stat[4,1]
  model_stats[i,column_names[9]] = alpha_beta_t_stat[4,2]
  model_stats[i,column_names[10]] = lr_summary$adj.r.squared
}

# Round values
model_stats[2:9] <- as.data.frame(lapply(model_stats[,2:9],function(x) round(x,4)))
model_stats[10] <- round(model_stats[10],5)

# Display data.frame
model_stats