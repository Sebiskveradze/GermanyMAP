# Pakete laden ------------------------------------------------------------

library(tidyverse)
library(giscoR)
library(janitor)


# Daten vorbereiten  ------------------------------------------------------

germany_districts <- gisco_get_nuts(
  year = "2021", 
  nuts_level = 3,
  epsg = 3035,
  country = 'Germany'
  ) %>% 
  as_tibble() %>% 
  clean_names()


# Bundesländer ------------------------------------------------------------

germany_states <- gisco_get_nuts(
  year = "2021", 
  nuts_level = 1,
  epsg = 3035,
  country = 'Germany'
  ) |> 
  as_tibble() |> 
  janitor::clean_names()



# Landkreise --------------------------------------------------------------

germany_districts |> 
  ggplot(aes(geometry = geometry)) +
  geom_sf(
    data = germany_states,
    aes(fill = nuts_name),
    color = 'black',
    linewidth = 0.5
  ) +
  geom_sf(
    fill = NA,
    color = 'black',
    linewidth = 0.1
  )




