library(tidyverse)
library(palmerpenguins)
library(easystats)


penguins %>% 
  ggplot(aes(y=bill_depth_mm,x=bill_length_mm,color=species)) + 
  geom_point() +
  geom_smooth (method='lm',aes(linetype=sex))

# + 
  #coord_cartesian(xlim = c(0,60))

# make linear regression of this plot 


m1 <- glm(data = penguins, formula = bill_depth_mm ~ bill_length_mm)

m2 <- glm(data = penguins, formula = bill_depth_mm ~ bill_length_mm + species)

aov(data = penguins, formula = bill_depth_mm ~ bill_length_mm) 

m3 <- glm(data = penguins, formula = bill_depth_mm ~ bill_length_mm * species)  

m1$aic
m2$aic
m3$aic

compare_performance(m1,m2,m3,m4) %>% plot

names(penguins)

m4 <- glm(data=penguins, 
          formula = bill_depth_mm ~ bill_length_mm * species + sex + island)

formula(m4)

x <- data.frame(bill_length_mm = 5000,
           species = "Chinstrap", 
           sex = "male", 
           island = "Dream")

predict(m4,newdata = x)


mpg %>% 
  ggplot(aes(x=displ,y=hwy,color=factor(cyl)) + 
  geom_point() + 
  geom_smooth(method='lm')

mpg %>% 
  ggplot(aes(x=displ,,y=hwy,))+ 
  geom_point() + 
  geom_smooth(method='lm',formula = y ~ log(x,2)

y <- data.frame(displ = 500)
n5 <- glm(data=mpg,formula = hwy ~ log(displ))
          
10^predict(n5,y)

Titanic %>% as.data.frame()

df <- read_csv("./Downloads/data_course_STUBBS/GradSchool_Admissions.csv")

df <- df %>% 
  mutate(admit = as.logical(admit))

m6 <- glm(data=df, 
          formula = admit ~ gre + gpa + rank, family = 'binomial')
summary(m6)

library(modelr)
add_predictions(df,m6,type='response') %>% 
  ggplot(aes(x=gpa,y=pred,color=factor(rank))) + 
  Geom_smooth()





















