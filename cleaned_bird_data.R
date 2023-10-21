library(tidyverse)
library(janitor)
library(skimr)

dt <- read.csv("./Data/Bird_Measurements.csv")
dt

clean_names()

dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill")))


dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill",
                      "m_mass", "f_mass","unsexed_mass")))

bill <- 
  dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill",
                      "m_mass", "f_mass","unsexed_mass")))

tarsus <- 
  dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill",
                      "m_mass", "f_mass","unsexed_mass")))


tail <- 
  dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill",
                      "m_mass", "f_mass","unsexed_mass")))

wing <-
  dt %>% 
  select(-ends_with("_n")) %>% 
  select(-ends_with(c("_wing","_tail","_tarsus","_bill",
                      "m_mass", "f_mass","unsexed_mass")))  
  
mass <- 
mass %>% 
  pivot_longer(c(m_mass,f_mass,unsexed_mass), names_to = "sex" ,values_to = "mass") %>% 
  mutate(sex = sex %>% str_remove("_mass")) %>% 
  
  bill %>% 
  full_join(mass) %>% 
  full_join(tail) %>% 
  full_join(tarsus) %>% 
  full_join(wing)

View(full)


saveRDS(full,"./Code_Examples/cleaned_bird_data.rds")


function(x){}

source("./Data/cleaned_bird_data.rds")

myfunction <- function(x){return(x+3)}


secondfunction <- function(x=10){return(x+3)}


myfunction(x=10)
secondfunction()

read_csv


library(roxygen2)
