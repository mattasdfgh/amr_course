# Data visualisation session

library(ggplot2)
gapminder <- read.csv("data/gapminder_data.csv")

gapminder
View(gapminder)
str(gapminder)
head(gapminder)
typeof(gapminder)
typeof(gapminder$country)

#Using ggplot2
# We will start by doing everything the slow way.
#1. Relationship between GDP per capita and life expectancy
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
         geom_point()






