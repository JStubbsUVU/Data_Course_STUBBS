library(tidyverse)
library(janitor)
library(readxl)

path <- "./Data/messy_bp.xlsx"

visits <- read_xlsx(path, skip = 1,n_max = 0) %>% names()

dt <- read_xlsx(path, range = "A4:M24") %>% clean_names()

dt %>% pivot_longer(starts_with("bp_"),values_to = "bp") %>% mutate(visit = case_when(name == "bp_8" ~ 1,
                                                                     name == "bp_10" ~ 2,
                                                                     name == "bp_12" ~ 3)) %>% 
  pivot_longer(starts_with("hr_"),
               names_to = "visits2",
               values_to = "heart_rate")
bp <- 
dt %>% select(-starts_with("hr_")) %>%  #for picking columns 
  pivot_longer(starts_with("bp_"),values_to = "bp") %>% mutate(visit = case_when(name == "bp_8" ~ 1,
                                                                                 name == "bp_10" ~ 2,
                                                                                 name == "bp_12" ~ 3)) %>%
select(-name) %>% 
  separate(bp, into = c("systolic","diastolic"),convert = TRUE)
hr <- 
dt %>% select(-starts_with("bp_")) %>%  #for picking columns 
  pivot_longer(starts_with("hr_"),values_to = "hr") %>% mutate(visit = case_when(name == "bp_9" ~ 1,
                                                                                 name == "bp_11" ~ 2,
                                                                                 name == "bp_13" ~ 3)) %>%
select(-name)

dat <- 
full_join(bp,hr)


dat <- 
dat %>% 
  mutate(birthdate = paste(year_birth,month_of_birth,day_birth,sep = "-") %>% as.POSIXct())

dat %>% 
  mutate(race = case_when(race == "WHITE" ~ "White",
                          race == "Caucasian" ~ "White", TRUE ~ race))


saveRDS(dat,"./Data_COurse_STUBBS/clean_the_bp_data")




view(dat)


paste("2023","10","3",sep = "-") %>% as.POSIXct()
names(dat)


dat <- readRDS("./Data_COurse_STUBBS/clean_the_bp_data")

# dat %>% 
#   select(-c(pat_id,month_of_birth,year_birth)) %>%  
#   ggpairs()
  
  dat %>% 
    ggplot(aes(x=visit,color=hispanic)) + 
    geom_point(aes(y=systolic),color='red') + 
    geom_point(aes(y=diastolic),color='black') + 
    stat_summary(aes(y=systolic),geom = "path",color='red') + 
    stat_summary(aes(y=diastolic),geom = "path",color='black')
    labs(y="blood pressure") + 
    facet_wrap(~hispanic)



#dplyr verbs
mutate()
select()
filter()


group_by()
summarize()


dat %>% 
  filter(race == "Black" | sex == "Female")

dat %>% 
  group_by(race,sex) %>% 
  summarize(mean_systolic = mean(systolic))
    

arrange()
    
    
    
    
    
    
    
    




















