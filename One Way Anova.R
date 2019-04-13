## Anaanthan ##
## OneWay Anova ##

# Choosing Dataset
data <- ToothGrowth

#Explore data
str(data)
summary(data)

#Converting numerical variable into factors
data$dose <- as.factor(data$dose)
str(data)
levels(data$dose)

# Visualizing data
boxplot(data=data, len~dose)

# building anova model
data.av <- aov(data=data, len~dose)
summary(data.av)

# PostHoc Test
TukeyHSD(data.av)
