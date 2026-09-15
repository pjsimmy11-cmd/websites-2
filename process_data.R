library(tidyverse)

top_songs <- billboard |>
  pivot_longer(
    cols = starts_with("wk"),
    names_to = "week",
    values_to = "rank",
    values_drop_na = TRUE
  ) |>
  summarize(
    weeks_on_chart = n(),
    hit_number_one = any(rank == 1),
    .by = c(artist, track)
  ) |>
  slice_max(weeks_on_chart, n = 10) |>
  mutate(
    song = paste0(track, " - ", artist),
    song = fct_reorder(song, weeks_on_chart)
  )
