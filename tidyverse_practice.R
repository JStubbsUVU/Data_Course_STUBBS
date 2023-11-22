library(tidyverse)

#1. give it a data frame
#2 map column names to various aspects of plot
#3 give it geoms (things to draw)
iris
ggplot(iris,aes(x=Petal.Length,y=Petal.Width,color=Species)) + 
geom_point(alpha=.25,size=.25) + 
  geom_smooth(method = "lm" , se = FALSE,) #loess curve is default
scale_color_viridis_d() + 
  theme_minimal() + 
  labs(x="Petal length", 
       y="Petal width",
      color="species of iris") + 
  facet_wrap(~Species)
#mpg
mpg
ggplot(mpg,aes(x=drv,y=cty,color=displ)) + 
  geom_point(alpha=10 
geom_smooth(method = "lm")

geom_smooth(method = "ln",se = FALSE)




ggplot(mpg, aes(x=trans,y=cty,fill=drv)) +
  geom_violin() +
  geom_jitter(width = .1) +
  facet_wrap(~drv,scales = 'free')

mpg
Glimpse(mpg)
table(mpg$cla
