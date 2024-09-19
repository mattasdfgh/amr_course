# Writing data

library(ggplot2)
library(tidyr)
library(dplyr)
gapminder <- read.csv("data/gapminder_data.csv")

# Some plots
lifeExp_plot <- ggplot(gapminder, aes(year, lifeExp)) +
  geom_point(alpha = 0.3, size = 0.5)

cont_plot <- lifeExp_plot +
  facet_wrap(vars(continent))

# Saving plots (if you do not specify a plot then it will save the most recent plot)
## There are a lot of issues with this, so good to specify width and height (6:4 works okay in this example, and creates a file of 240KB.)
ggsave("results/life_expectancy_by_continent.png", cont_plot, width = 6, height = 4)
ggsave("results/life_expectancy_by_continent.pdf", cont_plot, width = 6, height = 4)


## Exporting data (write.csv exports row numbers as column 1 as default)
gap_australia <- gapminder |> 
  filter(country == "Australia")
write.csv(gap_australia, "processing/full_australia.csv")

import_aus <- read.csv("processing/full_australia.csv")
import_aus
gap_australia

# We can export basically any object from what I can tell. Obviously very useful for data frames.
x <- 2
write.csv(x, "processing/x.csv")
y <- "as124"
write.csv(y, "processing/y.csv")

