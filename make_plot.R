library(tidyverse)

x <- read_rds("clean_data.rds")

billboard_plot <- x |>
  ggplot(aes(x = weeks_on_chart, y = song)) +
  geom_segment(aes(x = 0, xend = weeks_on_chart, y = song, yend = song), color = "gray75", linewidth = 1) +
  geom_point(aes(color = hit_number_one), size = 6) +
  geom_text(aes(label = weeks_on_chart), color = "white", size = 2.8, fontface = "bold") +
  scale_color_manual(
    values = c("TRUE" = "#e63946", "FALSE" = "#457b9d"),
    labels = c("TRUE" = "Hit #1", "FALSE" = "Top 10 only"),
    name = "Peak Rank"
  ) +
  labs(
    title = "Staying Power: 2000's Longest-Charting Songs",
    subtitle = "Weeks on the Billboard Hot 100 for the top 10 most enduring tracks",
    x = "Total Weeks on Chart",
    y = NULL,
    caption = "Source: tidyr::billboard"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.grid.major.y = element_blank(),
    panel.grid.minor = element_blank(),
    legend.position = "top",
    plot.title = element_text(face = "bold")
  )

ggsave("billboard.png", billboard_plot)
