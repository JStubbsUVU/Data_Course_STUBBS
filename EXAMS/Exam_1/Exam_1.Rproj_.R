---
  output: 
  html_document:
  toc: yes
toc_float:
  collapsed: false
pagetitle: Exam_1
---
  
  # Skills Test 1 (the real thing)
  
  ____

# Setup

Do a fresh "git pull" to get the skills test files.
The files you just got from your "git pull" are:
  
  + README.md (this text file with instructions)
+ README.html (fancy version of this file)
+ cleaned_covid_data.csv
+ prepare_data.R (the script I used to turn all the raw data files into cleaned_covid_data.csv - only for the curious)
+ data/ (directory containing all the raw data files - only for the curious)

# Data description

**cleaned_covid_data.csv is the main data file you will use for this skills test.**
  
  The columns in the cleaned_covid_data.csv file are as follows:
  
  | Column name              | Description                                                                   |
  | ------------------------ | ------------------------------------------------------------------------------|
  | "Province_State"         | State (or DC)                                                                 |
  | "Last_Update"            | Date of observation                                               |
  | "Confirmed"              | Cumulative number of confirmed COVID-19 cases as of the given date            |
  | "Deaths"                 | The date the DNA was originally extracted in the format YYYY-MM-DD            |
  | "Recovered"              | Total number of recovered cases as of the given date                          |
  | "Active"                 | Total number of active confirmed COVID-19 cases as of the given date          |
  | "Case_Fatality_Ratio"    | Percent of cases that resulted in death due to COVID-19                       |
  
  A glimpse of the data structure:
  ```{r echo=FALSE, message=FALSE, warning=FALSE}

library(tidyverse)

df <- read_csv("cleaned_covid_data.csv")

skimr::skim(df)
```

# YOUR TASKS:

#**I.**
 # **Read the cleaned_covid_data.csv file into an R data frame. (20 pts)**
 
  df <- read.csv("cleaned_covid_data.csv")
  
  
  #**II.**
 # **Subset the data set to just show states that begin with "A" and save this as an object called A_states. (20 pts)**

A_states <- df$Province_State[grep("^A", df$Province_State)]
print(A_states)                    
  
#+ Use the *tidyverse* suite of packages
#+ Selecting rows where the state starts with "A" is tricky (you can use the grepl() function or just a vector of those states if you prefer)

library(dplyr)

results_df <- df %>%
  filter(str_detect(Province_State, "^A"))
print(results_df)


#**III.**
 # **Create a plot _of that subset_ showing Deaths over time, with a separate facet for each state. (20 pts)**

library(ggplot2)  

filtered_df <- df %>%
  filter(str_detect(Province_State, "^A"))
#this is without facet and with a different x axis assigned

ggplot(data = filtered_df, aes(x = Province_State, y = Deaths)) +
  geom_line() + labs(title = "Deaths Over Time in Provinces Starting with 'A'", 
                     x = "Province_State",
                     y = "Deaths")
#with facet

ggplot(data = filtered_df, aes(x = Province_State, y = Deaths)) +
  geom_line() + 
  facet_wrap(~ Province_State, scales = "free_y") + 
  labs(title = "Deaths Over Time in Provinces Starting with 'A'", 
                     x = "Province_State",
                     y = "Deaths")



  #+ Create a scatterplot
#+ Add loess curves WITHOUT standard error shading
#+ Keep scales "free" in each facet

ggplot(data = filtered_df, aes(x = Confirmed, y = Deaths)) +
  geom_line() +
  geom_smooth(method = "loess" , se = FALSE) + 
  facet_wrap(~Province_State, scales = "free_y") + 
  labs(title = "Deaths Over Time in Provinces Starting with 'A'", 
                     x = "Confirmed",
                     y = "Deaths")

#**IV.** (Back to the full dataset)
#**Find the "peak" of Case_Fatality_Ratio for each state and save this as a new data frame object called state_max_fatality_rate. (20 pts)**
  
grouped_df <- df %>% 
  group_by(Province_State)


state_max_fatality_rate <- grouped_df %>% 
  group_by(Province_State) %>% 
  summarise(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio))




print(state_max_fatality_rate)


peak_data <- df %>% 
  group_by(Province_State,Case_Fatality_Ratio) %>% 
  summarise(Peak_Case_fatality_Ratio = max(Case_Fatality_Ratio))
print(peak_data)

state_max_fatality_rate <- grouped_df %>% 
  group_by(Province_State) %>% 
  summarize(Maximum_Fatality_Ratio = max(Case_Fatality_Ratio, na.rm = TRUE))

state_max_fatality_rate <- state_max_fatality_rate %>%
  arrange(desc(Maximum_Fatality_Ratio))

print(state_max_fatality_rate)
  


#I'm looking for a new data frame with 2 columns:

 #+ "Province_State"
 #+ "Maximum_Fatality_Ratio"
 #+ Arrange the new data frame in descending order by Maximum_Fatality_Ratio
 
#This might take a few steps. Be careful about how you deal with missing values!







#**V.**
#**Use that new data frame from task IV to create another plot. (20 pts)**

# + X-axis is Province_State
 #+ Y-axis is Maximum_Fatality_Ratio
 #+ bar plot
 #+ x-axis arranged in descending order, just like the data frame (make it a factor to accomplish this)
 #+ X-axis labels turned to 90 deg to be readable
 
#Even with this partial data set (not current), you should be able to see that (within these dates), different states had very different fatality ratios.


state_max_fatality_rate$Province_State <- factor(
  state_max_fatality_rate$Province_State,
  levels = state_max_fatality_rate$Province_State[order(-state_max_fatality_rate$Maximum_Fatality_Ratio)])

ggplot(state_max_fatality_rate, aes(x = Province_State, y = Maximum_Fatality_Ratio)) +
  geom_bar(stat = "identity", fill = "blue") +
  labs(
    title = "Max Case Fatality Ratio by State",
    x = "Province State",
    y = "Max Case Fatality Ratio"
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 90, hjust = 1))


#**VI.** (BONUS 10 pts)
#**Using the FULL data set, plot cumulative deaths for the entire US over time**

 #+ You'll need to read ahead a bit and use the dplyr package functions group_by() and summarize() to accomplish this.

data$Date <- as.Date(data$Date) 
data$Cumulative_Deaths <- cumsum(data$Deaths)


ggplot(data, aes(x = Last_Update, y = Deaths)) +
  geom_line() +
  labs(
    title = "Cumulative Deaths in the US Over Time",
    x = "Date",
    y = "Cumulative Deaths"
  ) +
  theme_minimal()
