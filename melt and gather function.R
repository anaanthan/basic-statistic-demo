set.seed(10)
drugx= rnorm(50, mean = 0.1, sd=0.02)

set.seed(11)
drugy= rnorm(50, mean=0.15, sd=0.03)

comdrug= data.frame("ID"=c(1:50), "DrugX"=drugx, "DrugY"=drugy)

head(comdrug)

t.test(drugx,drugy, paired = FALSE)
wilcox.test(drugx,drugy, paired = FALSE)
cor(drugx,drugy)
plot(drugy,drugx)

## option 1 to combine drug effects into single columnn (Drugtype)

library(tidyr)
comdrug2 <- gather(comdrug, key = DrugType, value = Reduction, DrugX, DrugY)

head(comdrug2)

attach(comdrug2)
boxplot(Reduction~DrugType)

var.test(Reduction~DrugType)

t.test(Reduction~DrugType)

## option 2 to combine drug effects into single columnn (Drugtype)
## (will provide same result)

comdrug_long <- reshape2::melt(comdrug, id.vars = "ID", 
                               value.name = "HbA1c Reduction", 
                               variable.name = "Types of Drug")
View(comdrug2)
View(comdrug_long)
