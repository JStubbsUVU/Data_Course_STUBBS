library(tidyverse)
library(palmerpenguins)
library(easystats)
library(MASS)


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

mpg

mpg %>% ggplot(aes(x=displ,y=hwy,color=factor(cyl))) + geom_point() + 
  geom_smooth(method='lm')

mpg %>% 
  ggplot(aes(x=displ,,y=hwy,)) + 
  geom_point() + 
  geom_smooth(method='lm',formula = y ~ log(x,2))

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

step <- stepAIC(m6)
step$formula
m7 <- glm(data=df,
          formula= admit ~gre + gpa + rank,
          family = 'binomial')
mod_best <- glm(data=df,family='binomial',formula = step$formula)

step <- 





library(modelr)
add_predictions(df,m6,type='response') %>% 
  ggplot(aes(x=gpa,y=pred,color=factor(rank))) + 
  Geom_smooth()

penguins %>% names
full_mod <- glm(data=penguins, formula = bill_length_mm ~ .^2)
step <- stepAIC(full_mod)
step$formula

best_mod <- glm(data=penguins,formula = step$formula)
compare_performance(full_mod,best_mod) %>% plot

#train model on some data
#test it on other data

dim(penguins)
.2*344
#add new column with random t/f at 80% true
rbinom(nrow(penguins),1,.8)

penguins <- 
penguins %>% 
  mutate(newcolumn = rbinom(nrow(penguins),1,.8) )
#use new column to split data set
train <- penguins %>% filter(newcolumn == 1)
test <- penguins %>% filter(newcolumn == 0)
#train model on train set 
mod_best <- glm(data=train, formula = step$formula)

#test model on test set 

predictions <- 
  add_predictions(test,mod_best)

predictions <- 
  predictions %>% 
  mutate(resid=abs(pred - bill_length_mm))
mean(predictions$resid,na.rm = TRUE)

library(ranger)

?ranger
ranger(Species ~ ., data = iris)

r_mod <- predict(r_mod,iris)


data.frame(iris$Species,pred$predictions)





