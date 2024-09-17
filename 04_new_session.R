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


# What is the annual GDP per capita for Europe
year_country_gdppercap_europe <- gapminder |> 
  filter(continent == "Europe") |> 
  select(year, country, gdpPercap)

head(year_country_gdppercap_europe)  

life_exp_europe_2007 <- gapminder |> 
  filter(continent == "Europe", year == 2007) |> 
  select(country, lifeExp)

View(life_exp_europe_2007)


# Challenge
africa_subset_life_exp <- gapminder |> 
  filter(continent == "Africa") |> 
  select(country, year, lifeExp)

View(africa_subset_life_exp)


### Grouping

str(gapminder)

gdppercap_by_continent <- gapminder |> 
  filter(year == 2007) |> 
  group_by(continent) |> 
  summarise(mean(gdpPercap))
View(gdppercap_by_continent)

# Meaningless challenge: calculating average life expectancy per country. Which has the highest and which has the lowest?
extreme_life_exp_by_country <- gapminder |> 
  filter(year == 2007) |> 
  filter(lifeExp == min(lifeExp) | lifeExp == max(lifeExp))
View(life_exp_by_country)

extreme_life_exp_by_country2 <- gapminder |> 
  filter(year == 2007) |> 
  arrange(desc(lifeExp))
View(extreme_life_exp_by_country2)

# Arrange countries by alphabetical order and see what is last (by assigning this to an object, we only keep the tail, probably not a good idea in practice)
test <- gapminder |> 
  arrange(desc(country)) |> 
  head()
View(test)

# Doing gdp per cap by continent properly
tot_gdp_by_continent <- gapminder |> 
  filter(year == 2007) |> 
  mutate(gdp = gdpPercap*pop) |> 
  group_by(continent) |> 
  summarise(sum_gdp = sum(gdp), sum_pop = sum(pop)) |> 
  mutate(gdp_per_cap = sum_gdp / sum_pop)

View(tot_gdp_by_continent)

#IQR is a thing, could be used better than this
iqr_2007 <- gapminder |> 
  filter(year == 2007) |> 
  summarise(IQR(pop))
View(iqr_2007)

###

# Some useful things
gapminder |> 
  filter(year == 2007) |> 
  count(continent, sort = TRUE)

gapminder |> 
  summarise(n())

gapminder |> 
  group_by(continent) |> 
  summarise(se_le = sd(lifeExp)/sqrt(n()))

## Mutating stuff (this is a nonsense example...)
gdp_pop_continent_year <- gapminder |> 
  filter(year == 2007) |> 
  mutate(gdpperbillion = gdpPercap*pop/10^9) |> 
  group_by(continent, year) |> 
  summarise(mean_gdppercap = mean(gdpPercap),
            sd_gdp_per_cap = sd(gdpPercap),
            sd_pop = sd(pop),
            mean_gdp_billion = mean(gdpperbillion),
            sd_gdp_billion = sd(gdpperbillion))
View(gdp_pop_continent_year)

