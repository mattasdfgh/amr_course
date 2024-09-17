# Data visualisation session

library(ggplot2)
gapminder <- read.csv("data/gapminder_data.csv")

gapminder
View(gapminder)
str(gapminder)
head(gapminder)
typeof(gapminder)
typeof(gapminder$country)

# Using ggplot2
# We will start by doing everything the slow way.
#1. Relationship between GDP per capita and life expectancy
ggplot(data = gapminder, mapping = aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

#2 How does life expectancy change over time
ggplot(gapminder, aes(year, lifeExp)) +
  geom_point()

# This gives us points for all countries, which looks bad, here is an example for just one country
ggplot(gapminder[gapminder$country=="United Kingdom", ], aes(year, lifeExp)) +
  geom_point()

# There are some other things we can do here, some of which give terrible results (e.g. line)
ggplot(gapminder, aes(year, lifeExp)) +
  geom_line()

ggplot(gapminder, aes(year, lifeExp)) +
  geom_line(aes(color = continent))

ggplot(gapminder, aes(year, lifeExp)) +
  geom_line(aes(color = continent, group = country))

ggplot(gapminder, aes(year, lifeExp)) +
  geom_line(aes(color = continent, group = country)) +
  geom_point()

ggplot(gapminder, aes(year, lifeExp)) +
  geom_point() +
  geom_line(aes(color = continent, group = country))

# Note that changing the order of the layers makes a difference. 

#----------------

# Now let's check if we have Vietnam in the data
"Vietnam" %in% gapminder$country
gap_vietnam <- gapminder[gapminder$country == "Vietnam", ]

ggplot(gap_vietnam, aes(year, lifeExp)) +
  geom_point() +
  geom_line(aes(color = continent, group = country))


# Let's add a second country
gap_viet_uk <- gapminder[gapminder$country == "Vietnam" | gapminder$country == "United Kingdom", ]

ggplot(gap_viet_uk, aes(year, lifeExp)) +
  geom_point() +
  geom_line(aes(color = continent, group = country))

# Play with some other arguments
ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(alpha = 0.1, mapping = aes(color = continent))

# Transformations (the bottom one is better because it automatically fixes the x axis labels)
ggplot(gapminder, aes(log10(gdpPercap), lifeExp)) +
  geom_point(alpha = 0.1, mapping = aes(color = continent))

ggplot(gapminder, aes(gdpPercap, lifeExp)) +
  geom_point(alpha = 0.1, mapping = aes(color = continent)) +
  scale_x_log10()




