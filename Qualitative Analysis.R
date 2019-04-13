## Anaanthan

# creating cross tabulation
# Hypothetical scenario: 
# suppose we want to know effect of drug counsel on glycemic control
# during admission vs at discharge

table <- as.table(rbind(c(24,12),c(42,15)))
table
dimnames(table) <- list(drugcounsel = c("admis", "disc"),
                        glycemiccont = c("Yes","No"))
addmargins(table)

# chisquare test
cst=chisq.test(table)
cst
cst$expected


## Fisher exact test (expect cell<5, only 2X2)
## Hypothetical scenario
## Effect of new lifestyle mod on glycemic control

table2 <- as.table(rbind(c(12,8),c(2,7)))
table2
dimnames(table2) <- list(newlifestyl = c("Yes", "No"),
                        glycemiccont = c("Yes","No"))
addmargins(table2)

cst2=chisq.test(table2)
cst2
cst2$expected

# since there is expec cell<5, use fisher exact test 

fisher.test(table2)
