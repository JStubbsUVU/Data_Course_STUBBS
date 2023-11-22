library(tidyverse)
library(readxl)
library(janitor)
library(lubridate)
df1 <- read_xlsx("~/Downloads/popquiz data.xlsx") %>% 
  clean_names() #helps clean the names of columns


#fix names (col 1) 
names(df1)[1] <- "site"
df1
part1 <- dates <- janitor::excel_numeric_to_date(as.numeric(df1$site)[1:3])
#pull the month name abbreviation into character
class(dates)
lubridate::month(dates,label = TRUE,abbr=TRUE) %>% 
  str_to_upper()
#pull the site numbers from day of month
part2 <- lubridate::day(dates)
#paste them together
finalproduct <- paste(part1,part2,sep = "-")
df1$ssite[1:3] <- finalproduct
df1

#separate col 1 into location and site
df1 <- 
df1 %>% 
  separate(site, into = c("location , site")) %>% 
  pivot_longer(start_with("week"),names_to = "week",
               values_to = "rel_abund", names_prefix = "week_",
               names_transform = as.numeric)


part1
part2

clean_names(df1)

"~/Downloads/popquiz data.xlsx"
"~/downloads/organized dataset.xlsx"

df2 <- 
read_xlsx("~/downloads/organized dataset.xlsx")

DF2$site <- 
df2$site %>% 
  str_replace(" Pool", "Pool")

df2 %>% 
  separate(site, into=c("location", "site")) %>% 
  pivot_longer(start_with("week"),names_to = "week", #pivot longer
               values_to = "rel_abund", names_prefix = "week_",
               names_transform = as.numeric)
identical(df1,df2)

df2 <- 
df2 %>% 
  mutate(location = case_when(location == "SewagePool" ~ "SEP",
                                  location == "Hatchery" ~ "HAT"))


