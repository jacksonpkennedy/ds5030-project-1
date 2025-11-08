## packages
library(tidyverse)


## --- load data
pbp <- read_csv('Desktop/DS5030/ds5030-project/pbp.csv')



## --- proof of concept
# select sample game
pbp_sample <- filter(pbp, game_id == 401576148)

# filter for competitive, non-OT games; remove event-less plays
poc_by_play <- pbp_sample %>%
  filter(
    !str_detect(description, regex('Jump Ball|End of', ignore_case = T)),
  ) %>%
  group_by(game_id) %>%
  filter(
    min(score_diff) >= -30,
    max(score_diff) < 30,
    max(half) <= 2,
    !any(is.na(possession_before) | is.na(possession_after))
  ) %>%
  ungroup()

# create possession ID
poc_by_play <- poc_by_play %>%
  group_by(game_id) %>%
  mutate(
    is_new_possessio