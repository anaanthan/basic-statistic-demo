

# Loading data 
# dataset diamond comes with ggplot2 package
library(ggplot2)
data= diamonds

# Data exploration
str(diamonds)
summary(diamonds)

# Please be noted carat means weight of diamond

# Pearson Correlation (Price vs Weight)
cor.test(data$carat, data$price)

# Spearman Correlation (Price vs Weight)
cor.test(data$carat, data$price, method = "spearman")

# by default corr test is pearson even if we dont specify method

