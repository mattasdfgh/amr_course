# Using an AMR package

# load packages
library(AMR)
library(tidyverse)

# load data
isolates_crude <- example_isolates_unclean
isolates_clean <- example_isolates

# check out some data
head(isolates_crude)
head(isolates_clean)

# clean the dirty data, convert bacteria to the mo format, convert AMR to sir format:
cleaned_data <- isolates_crude |> 
  mutate(bacteria = as.mo(bacteria, info = TRUE)) |> 
  mutate_at(vars(AMX, AMC, CIP, GEN), as.sir)


# look at the cleaned data
cleaned_data
table(clean$bacteria)

first_isolates <- cleaned_data |> 
  filter(first_isolate(info = TRUE))

## remember that ! can always be used to get the opposite
not_first_isolates <- cleaned_data |> 
  filter(!first_isolate(info = TRUE))


## some more bits and pieces
first_isolates |> 
  count(mo_name(bacteria), sort = TRUE)

first_isolates |> 
  select(date, aminoglycosides(), betalactams())

first_isolates |> 
  filter(any(betalactams() == "R")) |> 
  select(date, bacteria, betalactams())

## a little antibiogram
antibiogram(first_isolates, 
            antibiotics = c(aminoglycosides(), 
                            betalactams())
            )


## WISCA (never heard of this...)
wisca <- example_isolates |> 
  antibiogram(antibiotics = c("AMC", "AMC+CIP", "TZP", "TZP+TOB"),
              mo_transform = "gramstain",
              minimum = 10,
              syndromic_group = ifelse(example_isolates$age >= 65 &
                                         example_isolates$gender == "M",
                                       "WISCA Group 1",
                                       "WISCA Group 2"))

wisca

## Look at this, autoplot could be pretty useful:
# Can only be used in some situations, basically if implemented in the specific packages. 
plot1 <- autoplot(wisca)

## Maybe play around with this, see what else we can add to the autoplot. Can we add another categorical variable?



