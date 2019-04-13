## Anaanthan ##

# paired t-test #
# Assumptions is same as for independent t-test
# With the exception of the samples were non-independent and paired

# We assume using ToothGrowth data that 
#at first patient were given OJ, measured extent of toothgrowth
# then subsequently given VC, measuring subsequent growth

data<- ToothGrowth
t.test(data=data, len~supp, paired=T)

# assumptions, difference is normally distributed

OJ <- subset(data[data$supp== "OJ",])
VC <- subset(data[data$supp== "VC",])

diff<- OJ$len-VC$len

qqnorm(diff)
qqline(diff)
shapiro.test(diff)

#Data visualisation
matplot(t(data.frame(OJ$len,VC$len)), type="b", xaxt="n", pch=19, col=1, lty=1, ylab = "TG (mm)") 

        