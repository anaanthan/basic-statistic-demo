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

#McFadden (pseudo) Rsquared
install.packages("pscl")
library(pscl)

pR2(model)


predict <- predict(model, type = 'response')

#confusion matrix
table(df$HL, predict > 0.5)

#ROCR Curve
library(ROCR)
ROCRpred <- prediction(predict, df$HL)
ROCRperf <- performance(ROCRpred, 'tpr','fpr')
plot(ROCRperf,xlab="Specificity (true negatives)",ylab="Sensitivity (true positives)") 
abline(0,1)

#Calculate the area under the curve as a measure for model performance
auc <- performance(ROCRpred, measure = "auc")
auc <- auc@y.values[[1]]
auc #Target = auc> 0.8


#ggplot
library(ggplot2)

logistic1 <- ggplot(data = df, aes(x=SBP, y=HL))  +
  geom_point()+ 
  theme_bw()+
  labs(x= "Systolic BP (mmHg)",y= expression("Probability of HL"))+
  ylim(0,1)
plot1a



#full plot
intercept <- coef(model)[1]
slope <-  coef(model)[2]

logistic2 <- logistic1 + stat_function(fun = function(x) {1/(1+exp(-intercept -slope *(x)))})
logistic2
