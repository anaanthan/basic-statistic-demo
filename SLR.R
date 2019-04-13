## Anaanthan

# load data, mtcars
data<- mtcars

# base plot
plot(data$wt, data$mpg)

# using ggplot
library(ggplot2)
p<-ggplot(data=data, aes(x=wt,y=mpg))
p+geom_point()

#add information
p2<-ggplot(data=data, aes(x=wt,y=mpg, color=cyl))
p2+geom_point()

#adjust size
p+geom_point(size=2.0)

#add title
p+geom_point()+ggtitle("Mpg vs Weight")
p+geom_point()+ggtitle("Mpg vs Weight")+stat_smooth()
p+geom_point()+ggtitle("Mpg vs Weight")+stat_smooth(method = lm)
p+geom_point()+ggtitle("Mpg vs Weight")+stat_smooth(method = lm, se=F)

#simple linear regression
mtcars.lm = lm(data=data, mpg~wt)
mtcars.lm
summary(mtcars.lm)
