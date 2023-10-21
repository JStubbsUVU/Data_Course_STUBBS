library(tidyverse)
library(janitor)
library(gganimate)
library(skimr)


df <- read_csv("./Data/BioLog_Plate_Data.csv") %>% 
  clean_names() %>% 
  pivot_longer(starts_with("hr_"),names_to = "hour" ,values_to = "absorbance", names_prefix = "hr_", names_transform = as.numeric) %>% 


df %>% 
  pivot_longer(starts_with("hr_"),names_to = "hour" ,values_to = "absorbance", names_prefix = "hr_", names_transform = as.numeric) %>% 

df %>% 
  filter(dilution == .1) %>% 
  ggplot (aes(x=houir ,y=absorbance,color=type)) + 
  geom_smooth(se=FALSE)

df %>% 
  filter(substrate == "Itaconic Acid")
  group_by(dilution,sample_id,hour) %>% 
  summarize(mean_abs = mean(absorbance)) %>% 
    ggplot(aes(x=hour ,y=mean_abs,color=sample_id)) + 
    geom_path() + facet_wrap(~dilution) + theme_minimal() + transition_reveal(hour)
  