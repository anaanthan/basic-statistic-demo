# Anaanthan #

# Changing number coded category into name coded category #

Drug_Cat <- c("1","2","3","4")
HbA1c_Red <- c(0.1,1,2,0.5)

Drug_eff.df <- cbind.data.frame(Drug_Cat,HbA1c_Red)
View(Drug_eff.df)

Drug_eff.df$Drug_Cat <- as.factor(Drug_eff.df$Drug_Cat)
Drug_Cat <- c("A","B","C","D")
Drug_eff.df <- cbind.data.frame(Drug_Cat,HbA1c_Red)
View(Drug_eff.df)


