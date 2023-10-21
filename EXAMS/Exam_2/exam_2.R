
#task 1 read the unicef data 

library(readr)
library(janitor)
library(lubridate)
unicef_u5mr <- read_csv("EXAMS/Exam_2/unicef-u5mr.csv")
View(unicef_u5mr)
#unicef <- read_xlsx("unicef-u5mr.xlsx")

#task 2 get it into tidy format 
library(readxl)
library(tidyr)
library(tidyverse)
library(gapminder)
my_data <- unicef_u5mr


data <- my_data %>%
  pivot_longer(
    cols = starts_with("u5mr"),
    names_to = "u5mr_year",
    names_prefix = "u5mr",
    values_to = "rank",)

#data2 <- separate(data, u5mr, into = c("u5mrc", "year"), sep = ",")
data$u5mr_year <- gsub("[A-Za-z]", "", data$u5mr_year)
data$u5mr_year <- gsub("^\\d+\\.", "", data$u5mr_year)

view(data)

#task 3 plot each countr's u5mr over time

#ggplot(data, aes(x = u5mr_year, y = rank, color = Continent)) +
 # geom_line() +
  #facet_wrap(~ Continent, scales = "free_y") +
  #labs(title = "Rank Over Years by Country and Continent",
   #    x = "u5mr_year",
    #   y = "Rank") +
  #theme_minimal()

ggplot(data, aes(x = u5mr_year, y = rank, color = Continent, group = CountryName)) +
  geom_line() +
  facet_wrap(~ Continent, scales = "free_y") +
  labs(title = "Line Plot for Each Country with Facets by Continent",
       x = "Year",
       y = "Value") +
  theme_minimal()



#4 save this plot as LASTNAME_Plot_1.png

LASTNAME_Plot_1 <- ggplot(data, aes(x = u5mr_year, y = rank, color = Continent, group = CountryName)) +
  geom_line() +
  facet_wrap(~ Continent, scales = "free_y") +
  labs(title = "Line Plot for Each Country with Facets by Continent",
       x = "Year",
       y = "Value") +
  theme_minimal()


ggsave("LASTNAME_Plot_1.png", plot = LASTNAME_Plot_1, width = 10, height = 6, units = "in")


#5 create another plot that shows the mean u5mr for all the countries within a given continent at each year. 


ggplot(data, aes(x = u5mr_year, y = rank, color = Continent, group = Continent)) +
  geom_line(stat = "summary", fun = "mean", size = 1) +
  labs(title = "Mean Under-5 Mortality Rate (U5MR) for Each Continent at Each Year",
       x = "Year",
       y = "Mean U5MR") +
  theme_minimal()

#6 save that plot as LASTNAME_Plot_2.png 

LASTNAME_Plot_2 <- ggplot(data, aes(x = u5mr_year, y = rank, color = Continent, group = Continent)) +
  geom_line(stat = "summary", fun = "mean", size = 1) +
  labs(title = "Mean Under-5 Mortality Rate (U5MR) for Each Continent at Each Year",
       x = "Year",
       y = "Mean U5MR") +
  theme_minimal()

ggsave("LASTNAME_Plot_2.png", plot = LASTNAME_Plot_1, width = 10, height = 6, units = "in")

#7 create three models of u5mr
 
#mod1
mod1 <- lm(u5mr_year ~ rank + u5mr_year, data = data)

summary(mod1)

#mod2
mod2 <- lm(u5mr_year ~ u5mr_year + Continent, data = data)

summary(mod2)

#mod3
mod3 <- lm(u5mr_year ~ u5mr_year * Continent, data = data)

summary(mod3)

#8 compare the 3 models with repsect to their performance

summary(mod1)
summary(mod2)
summary(mod3)

plot(mod1)
plot(mod2)
plot(mod3)
#I believe that after looking over the information and the plots of the models, the mod2 is the best. 

#9 Plot the 3 models predictions like so













