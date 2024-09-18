## NEW SESSION - AFTERNOON 18th SEPTEMBER

library(tidyr)
library(dplyr)

gapminder <- read.csv("data/gapminder_data.csv")
head(gapminder)

str(gapminder)
View(gapminder)

gap_wide <- read.csv("data/gapminder_wide.csv")
View(gap_wide)
str(gap_wide)


## RESHAPING DATA
gap_long <- gap_wide |> 
  pivot_longer(
    cols = c(starts_with('pop'), starts_with("lifeExp"), starts_with('gdpPercap')),
             names_to = "obstype_year", values_to = "obs_values")
View(gap_long)


# Modifying data
gap_long <- gap_long |> 
  separate(obstype_year, into = c("obstype", "year"),
           sep = "_")
head(gap_long)
gap_long$year <- as.integer(gap_long$year)


## Challenge 
chal <- gap_long |> 
  group_by(continent, obstype) |> 
  summarise(mean(obs_values))
chal

## Pivot gap_long back into the format of gapminder
gap_original <- gap_long |> 
  pivot_wider(names_from = obstype, values_from = obs_values)


# Convert long to wide (we will probably never need this, it is slightly silly)
gap_wide_new <- gap_long |> 
  unite(var_names, obstype, year, sep = "_") |> 
  pivot_wider(names_from = var_names, values_from = obs_values)


