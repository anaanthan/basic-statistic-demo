## Anaanthan ##

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

## let us do boxplot first~ lenght as described by supplement type

boxplot(data=data, len~supp)

## from the boxplot, we can say guinea pigs which is supplied
## with orange juice tends to have tooth growth lenghts which is 
## skewed to left. Obviously the data is not normally distributed
## let us assume for the sake of demonstratiom that the data is normally distibuted

## code for testing normality, always do 2 test, statistical and visual
## ie shapiro.test and qqplot 

OJ <- subset(data[data$supp== "OJ",])
VC <- subset(data[data$supp== "VC",])

shapiro.test(OJ$len)
shapiro.test(VC$len)

qqnorm(OJ$len)
qqline(OJ$len)

qqnorm(VC$len)
qqline(VC$len)

## Now the t-test

t.test(data=data, len~supp)

## H0 rejected: 
## there is a difference between lenght of tooth between VC and OJ groups
## mean toothlengh of OJ is significantly higher then VC

## sd of each group
sd(OJ$len)
sd(VC$len)
