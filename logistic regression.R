# Hypothetical data 
# Predicting presence of hyperlipidaemia (HL) from Systolic Blood Pressure (SBP) upon admission from ER

#Create hypothetical data
ID <- c(1:20)
SBP <- c(120, 130, 130, 135, 142, 145, 149, 160, 170, 172, 172, 173, 175, 180, 182, 188, 189, 195,195, 195)
HL <- c(0,0,1,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1,1,1)

#combine data into single dataframe
df<- data.frame(ID,SBP,HL)

#logistic regression model
model <- glm (HL ~ SBP, data = df, family = binomial)
summary(model)

predict <- predict(model, type = 'response')

#confusion matrix
table(df$HL, predict > 0.5)

#ROCR Curve
library(ROCR)
ROCRpred <- prediction(predict, df$HL)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf, colorize = TRUE, text.adj = c(-0.2,1.7))

#plot glm
library(ggplot2)
ggplot(df, aes(x=SBP, y=HL)) + geom_point() + 
  stat_smooth(method="glm", family="binomial", se=FALSE)
