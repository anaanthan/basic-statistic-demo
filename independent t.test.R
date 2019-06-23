## Sample independent t-test R-code ##

## Let us begin with built in dataset, ToothGrowth ##

## To know what is ToothGrowth ##

?ToothGrowth

## Now lets begin ##
data=ToothGrowth
## let us do some data exploration to know our data
str(data)
summary(data)

## suppose we want to know if toothlenghts among guinea pigs differs
## among the supplement type, we can do independent t-test

## first assumption is data is independent.
## we assume the guinea pigs is not measured two times in the study
## you should ensure the independence of data in your study as well 
## when analyzing your own dataset

## let us do boxplot first~ lenght as described by supplement type

boxplot(data=data, len~supp)

## from the boxplot, we can see the difference in mean of growth from
## both OJ and VC
## next assumption is the data is normally distributed
## code for testing normality, always do 2 test, statistical and visual
## ie shapiro.test and qqplot 

qqnorm(data$len)
qqline(data$len)
shapiro.test(data$len)

## when the p-value of shapiro wilk test insignificant, 
## we can say the data normally distributed

## next, test the equality of variances of the 2 group.

var.test (data=data, len~supp)

## Thus the variance is equal for the 2 group

## Now, finally the actual t-test

t.test(data=data, len~supp)

## H0 rejected: 
## there is a difference between lenght of tooth between VC and OJ groups
## mean toothlengh of OJ is significantly higher then VC

## sd of each group
sd(OJ$len)
sd(VC$len)

## alternatively, can also be done by splitting data

OJ <- subset(data[data$supp== "OJ",])
VC <- subset(data[data$supp== "VC",])

t.test(OJ$len, VC$len)

## especially if we feel the 2 groups from 2 different populations
## hence, if that the case, normality testing should be done seperately

## additionally, incase the variance is unequal

t.test(data=data, len~supp, eq.var=F)


