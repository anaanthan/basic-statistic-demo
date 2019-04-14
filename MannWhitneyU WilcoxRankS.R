## Anaanthan ##

# Mann-Whitney U test #

#Load data
data=ToothGrowth

# Visualize data #
boxplot(data=data, len~supp)

# Assume data is independent

# Mann-Whitney test
wilcox.test(data=data, len~supp, conf.int=T)
