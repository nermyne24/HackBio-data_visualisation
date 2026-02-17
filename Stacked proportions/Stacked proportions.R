library(dplyr)
library(ggplot2)

# Filtrer les temps souhaités
df_f_subset <- df_f %>%
  filter(stage %in% c("s00h", "s72h"))

# Stacked bar plot
ggplot(df_f_subset, aes(x = stage, y = proportion, fill = cell_type)) +
  geom_bar(stat = "identity") +
  scale_y_continuous(limits = c(0, 0.3)) +
  theme_minimal() +
  labs(
    x = "Time",
    y = "Proportion",
    fill = "Cell type",
    title = "B vs Plasma cell proportions over time"
  )





