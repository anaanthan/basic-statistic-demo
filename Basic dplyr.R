# Basic Dplyr : Filter and Select

# Create hypothetical dataframe

Food<- c("A","A","A","A","A","A","A","A","A","A","A","A",
         "B","B","B","B","B","B","B","B","B","B","B","B")
Weight <- c(20,20.1,19,20.12,23,21,22,20,21,19.5,20,19.85,
            18,17.1,17,17.15,17,16,17,18,16,17.9,18,17.75)
dat<- data.frame(Food,Weight)

dat
library(dplyr) 
A <- filter(dat, Food=="A") # Keep only with A
head(A)

AWeights <- select(A,Weight)
head(AWeights)

AWeights <- filter(dat, Food=="A") %>% select(Weight)

# Note that the data will be presented in dataframe
class(dat)
class(AWeights)

## To change dataframe to numerical variables
AWeights <- filter(dat, Food=="A") %>% select(Weight) %>% unlist
class( AWeights )

AWeights
