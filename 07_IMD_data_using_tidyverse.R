# IMD session

library(tidyverse)
library(ggplot2)

lon_dims_imd_2019 <- read.csv("data/English_IMD_2019_Domains_rebased_London_by_CDRC.csv")

# Comparing City of London with rest of London
lon_dims_imd_2019 <- lon_dims_imd_2019 |> 
  mutate(city = la19nm == "City of London")
View(lon_dims_imd_2019)


# No idea why we did this but nice to know
dummy_1 <- rnorm(1000, mean = 10, sd = 0.5)
dummy_1 <- as.data.frame(dummy_1)

plot1 <- dummy_1 |> 
  ggplot(aes(x = dummy_1)) +
  geom_histogram()
plot1

dummy_2 <- rnorm(1000, mean = 10, sd = 200)
dummy_2 <- as.data.frame(dummy_2)

plot2 <- dummy_2 |> 
  ggplot(aes(x = dummy_2)) +
  geom_histogram()
plot2


# Summary data for relevant variable (practically pointless code, but good to use the summary functions)
meanbarriers <- mean(lon_dims_imd_2019$barriers_london_rank, na.rm = TRUE)
sdbarriers <- sd(lon_dims_imd_2019$barriers_london_rank, na.rm = TRUE)
varbarriers <- var(lon_dims_imd_2019$barriers_london_rank, na.rm = TRUE)
medbarriers <- median(lon_dims_imd_2019$barriers_london_rank, na.rm = TRUE)
iqrbarriers <- IQR(lon_dims_imd_2019$barriers_london_rank, na.rm = TRUE)

meanbarriers
sdbarriers
varbarriers
medbarriers
iqrbarriers

sqrt(varbarriers) == sdbarriers

# TABLES - very useful
table(lon_dims_imd_2019$la19nm)
areas_tab <- table(lon_dims_imd_2019$la19nm)
prop.table(areas_tab)

table(lon_dims_imd_2019$la19nm, lon_dims_imd_2019$IDAOP_london_decile)

lon_dims_imd_2019 |> 
  group_by(la19nm) |> 
  summarise(avg = mean(Income_london_rank)) |> 
  arrange(la19nm)

# Statistical testing example
str(lon_dims_imd_2019)
t.test(health_london_rank ~ city, data = lon_dims_imd_2019)

anova_var <- aov(lon_dims_imd_2019$health_london_rank ~ lon_dims_imd_2019$la19nm)
summary(anova_var)
TukeyHSD(anova_var)

# Correlations
cor.test(lon_dims_imd_2019$Income_london_rank, lon_dims_imd_2019$health_london_rank)
ggplot(lon_dims_imd_2019, aes(Income_london_rank, health_london_rank)) +
  geom_point() +
  geom_smooth()

