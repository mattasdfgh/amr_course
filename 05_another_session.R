## Combining dplyr and ggplot2

library(ggplot2)
library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv")

## Let's make some nice plots for the Americas
americas <- gapminder |> 
  filter(continent == "Americas")

plot1 <- americas |> 
  ggplot(aes(year, lifeExp)) +
  geom_line(color = "purple") + 
  facet_wrap(vars(country)) +
    theme(axis.text.x = element_text(angle = 45))
plot1

# Or do it directly with gapminder
plot2 <- gapminder |> 
  filter(continent == "Americas") |> 
  ggplot(aes(year, lifeExp)) +
  geom_line() + 
  facet_wrap(vars(country)) +
  theme(axis.text.x = element_text(angle = 45))
plot2


# Another use of mutate
plot3 <- gapminder |> 
  mutate(starts_with = substr(country, 1, 1)) |> 
  filter(starts_with %in% c("A", "Z")) |> 
  ggplot(aes(year, lifeExp, color = continent)) +
  geom_line() +
  facet_wrap(vars(country)) +
  theme_minimal()
plot3


# A challenge - average life expectancy of 2 countries randomly selected from each continent
random_countries <- gapminder |> 
  filter(year == 2002) |> 
  group_by(continent) |> 
  sample_n(2) |> 
  summarise(mean_life_2_countries = mean(lifeExp)) |> 
  arrange(desc(continent))
View(random_countries)

