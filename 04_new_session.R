# Afternoon session on Tuesday - carrying on from this morning
# Let's try piping from now on

gapminder <- read.csv("data/gapminder_data.csv")

africa_mean_gdppercap <- mean(gapminder$gdpPercap[gapminder$continent == "Africa"])
africa_mean_gdppercap

library(dplyr)
?dplyr

# Creating subsets using dplyr
year_country_gdppercap <- select(gapminder, year, country, gdpPercap)
small_gapminder <- select(gapminder, -continent)

# Using pipe
year_country_gdppercap2 <- gapminder |> select(year, country, gdpPercap)

tidy_gdp <- year_country_gdppercap |> rename(gdp_per_capita = gdpPercap)
head(tidy_gdp)


# 















