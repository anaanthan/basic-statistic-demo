## Anaanthan ##

# cbind functions binds together different columms
# make sure each columms 
Drug<- c("A","A","B","B","C","C","D","D")
Glycemic_control = c("Controlled","Uncontrolled",
                     "Controlled","Uncontrolled",
                     "Controlled","Uncontrolled",
                     "Controlled","Uncontrolled")
Frequency <- c(20,12,13,14,8,12,23,16)

dat.df<- cbind.data.frame(Drug,Glycemic_control,Frequency)
View(dat.df)

# Data Visualization

library(ggplot2)
p=ggplot(data = dat.df, aes(x=Drug, y=Frequency, fill=Glycemic_control))+geom_bar(stat = "identity", position = "dodge")
p+ggtitle("Glycemic Control of Different Class of Drugs")
