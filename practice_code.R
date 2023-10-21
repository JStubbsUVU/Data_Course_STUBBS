library(tidyverse)
library(palmerpenguins)
library(ggimage)


penguins %>% to get this symbol --- control shift m

df <-  na.omit(penguins)
penguins %>% names
penguins %>% 
  na.omit() %>% 
  ggplot(aes(x = bill_depth_mm, y = island)) +
  geom_point() + 
  facet_wrap(bill_depth_mm, scales = "free_y") + 
  labs(title = "penguins", 
       x = "bill_depth_mm",
       y = "island")


glimpse(penguins)
peguins %>% glimpse()

p <- penguins %>% 
  na.omit() %>% 
  ggplot(aes(x=flipper_length_mm,y=body_mass_g,color = sex)) + 
  geom_point() + 
  geom_smooth(color ="black", se = FALSE) + 
  labs(x="Flipper Length", y = "body Mass G") +
  theme(axis.text.x = element_text(angle = 90))+ facet_wrap(~sex)

p + 
  theme(axis.title.x = element_text(face = 'bold',
                                  color = "green",
                                     size = 18,
                                   hjust = 0,
                                   vjust = 0,
                        
                                   angle = 181),legend.background = element_rect(fill='grey'),
        strip.text = element_text(color= 'blue',))

                              


1:10 %>% max()
max(c(1,2,3,4,5))

c(1,2,3,4,5) %>% max()

lettersgrep("e")
grep()





p 
penguins %>% 
  ggplot(aes(x=bill_length_mm,y=bill_depth_mm)) + geom_image(aes(image="./peng.jpg"))



library(GGally)
GGally::ggpairs(penguins)
df <- read_delim("Data/DatasaurusDozen.tsv")
df %>% 
  group_by(dataset) %>%
  summarise(mean_x = means(x),mean_y=mean(y), sd_x=sd(x))
df %>% 

  
  library(plotly)  
library(kableExtra)
p

ggplotly(p)

head(penguins) %>%
kable() %>% 
  kable_classic(lightable_options = 'hover')

df$dataset %>% unique %>% length
scale_color_manual(values = pal)

iris
library(gganimate)
iris %>% 
  mutate(blink = Sepal.Width < 3) %>%
  ggplot(aes(x=Sepal.Length,y=Sepal.Width,color=Species)) + geom_point() + #gganimate::transition_states(Species)
  gganimate::enter_appear()
anim_save("myanimation.gif")

is.na(df$x)

library(patchwork)
(p | p)
