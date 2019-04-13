## you need to install tidyverse first if it was not installed 
library(tidyverse)
#Create dataframe: Hypothetical
Test <- tribble(
  ~DrugClass, ~Value, ~Glycemic_control,
  "A", 20, "Controlled",
  "B", 14, "Controlled",
  "C", 23, "Controlled",
  "A", 15, "Uncontrolled",
  "B", 9, "Uncontrolled",
  "C", 18, "Uncontrolled") %>% 
  mutate(
    DrugClass = as.factor(DrugClass))
View(Test)
ggplot(data = Test, aes(x = DrugClass, y = Value, fill = Glycemic_control))+
  geom_bar(stat = "identity", position = "dodge")
