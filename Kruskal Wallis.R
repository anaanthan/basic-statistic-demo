

# load data #
data=ToothGrowth
str(data)
names(data)

# convert dose to factor & rename #
data$dose = as.factor(data$dose)
data$dose = factor(data$dose,labels = c("low", "medium", "high"))

# test of homogeneity #
library(car)
leveneTest(len ~ dose, data = data)

# kruskalwal test #
kruskal.test(len ~ dose, data = data)

# PostHoc Test #
library(FSA)
dunnTest(len ~ dose, data=data,method="bonferroni")
# (Choose either one of “holm”, “bonferroni”, “sidak”, 
#  “hs”, “hochberg”, “bh”, “by”, “none”)

# BoxPlot#
library("ggplot2")
ggplot(data, aes(x = dose, y = len)) +
  geom_boxplot(fill = "lavender", colour = "black") +
  scale_x_discrete() + xlab("Dose") +
  ylab("Length (μm)")

