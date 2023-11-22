#ugly plot 
install.packages("readxl")
library(readxl)

df <- EV_battery_pack_capacity_per_vehicle_in_the_US_market_2022


df %>%
par(mar = c(5, 5, 5, 5))  # Adjust the margins
plot(1:10, type = "n", xlab = "'Make'", ylab = "`Average EV Battery Pack Capacity (kWh)`", main = "Ugly R Plot")
grid()
abline(h = 2:9, col = "red", lty = 2)
abline(v = 3:8, col = "blue", lty = 3)
points(df$X, df$Z, pch = 21, col = "green")

text(5, 5, "Ugly Text", col = "purple", font = 2)
legend("topright", legend = "Legend", col = "orange", lty = 1, )
points(df$X, df$Z, pch = 21, col = "green")





library(ggplot2)

# Create an "ugly" ggplot graph
ugly_plot <- ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
  geom_point(size = 3, shape = 17) +
  geom_smooth(method = "lm", formula = y ~ x, color = "red", linetype = "dotted", size = 1) +
  theme_minimal() +
  labs(
    title = "Ugly ggplot Graph",
    x = "Sepal Length",
    y = "Sepal Width",
    color = "Species"
  ) +
  scale_color_manual(values = c("red", "green", "blue")) +
  theme(
    panel.grid.major = element_line(size = 0.5, color = "purple", linetype = "dashed"),
    panel.grid.minor = element_line(size = 0.2, color = "orange", linetype = "dotted"),
    axis.text = element_text(size = 12, color = "pink"),
    axis.title = element_text(size = 14, color = "brown", face = "bold"),
    plot.title = element_text(size = 18, color = "darkgreen", face = "italic")
  )


print(ugly_plot)

 #my data electric car

# Create an "ugly" ggplot graph
ugly_plot <- ggplot(data = df, aes(x = 'Make', y = 'Average EV Battery Pack Capacity (kWh)', color = "black")) +
  geom_point(size = 3, shape = 17) +
  geom_smooth(method = "lm", formula = y ~ x, color = "red", linetype = "dotted", size = 1) +
  theme_minimal() +
  labs(
    title = "Ugly ggplot Graph",
    x = "Make",
    y = "`Average EV Battery Pack Capacity (kWh)`",
    color = "Year"
  ) +
  scale_color_manual(values = c("red", "green", "blue")) +
  theme(
    panel.grid.major = element_line(size = 0.5, color = "purple", linetype = "dashed"),
    panel.grid.minor = element_line(size = 0.2, color = "orange", linetype = "dotted"),
    axis.text = element_text(size = 12, color = "pink"),
    axis.title = element_text(size = 14, color = "brown", face = "bold"),
    plot.title = element_text(size = 18, color = "darkgreen", face = "italic")
  )

# Print the "ugly" ggplot graph
print(ugly_plot)
ggsave(ugly_plot)
