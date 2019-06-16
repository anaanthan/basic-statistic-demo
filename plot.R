# Loading data (diamonds data comes with ggplot2 package)
library(ggplot2)
data=diamonds

# Data exploration
str(diamonds)
summary(diamonds)

# using base plot
plot(data$carat, data$price)

# using ggplot
plot=ggplot(data = data, aes(x= carat, y=price))
plot + geom_point()

# adding informations on color of diamonds
plot2= ggplot(data = data, aes(x= carat, y=price, color= color))
plot2 + geom_point()
plot2 + geom_point() + ggtitle( "Price of Diamonds")
