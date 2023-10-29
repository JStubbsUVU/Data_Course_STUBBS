# TIDY DATA

# rule 1: every variable gets own column 
# rule 2: every observaiton is a row
# rule 3: rectangular

library(tidyverse)

table1 %>% 
  ggplot(aes(x=year ,y=cases ,
             color=country)) + geom_path()

table2
table3
#%>% this symbol do control shift mmapply(

table2 %>% 
  pivot_wider(names_from = type,values_from = count)

table3 %>% 
  separate(rate,into = c("cases","population"))

table4a
table4b


full_join(table4a,table4b)

a <- table4a %>% 
 pivot_longer(-country, names_to = "year", values_to = "cases")

b <- table4b %>% 
  pivot_longer(-country, names_to = "year", values_to = "population")

full_join(a,b)

full_join( table4a %>% 
               pivot_longer(-country, names_to = "year", values_to = "cases"),
             table4b %>% 
               pivot_longer(-country, names_to = "year", values_to = "population"))

table5 %>% 
  mutate(date = paste0(century,year) %>% as.numeric()) %>% 
  select(-century,-year) %>% 
  separate(rate, into = c("cases","population"),convert = TRUE)

data.frame(name=letters[1:3],date=c("10/06/2023", "09/15/2022", "05/17/2095"))




