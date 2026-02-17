
library(readxl)
df_b <- read_xlsx(path, sheet = "b")
head(df_b)
library(ggplot2)
library(pheatmap)
library(igraph)
library(ggplot2)

ggplot(df_b, aes(x = log2(half_life), y = log2(alpha))) +
  geom_point() +
  theme_minimal() +
  labs(
    x = "log2(Half-life)",
    y = "log2(Alpha)",
    title = "Half-life vs Alpha (Panel 2b)"
  )
df_b$regime <- with(df_b,
                    ifelse(log2(half_life) > 0 & log2(alpha) > 0, "High half-life / High alpha",
                           ifelse(log2(half_life) > 0 & log2(alpha) <= 0, "High half-life / Low alpha",
                                  ifelse(log2(half_life) <= 0 & log2(alpha) > 0, "Low half-life / High alpha",
                                         "Low half-life / Low alpha")))
)

ggplot(df_b, aes(x = log2(half_life), y = log2(alpha), color = regime)) +
  geom_point() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  theme_minimal()
ggplot(df_b, aes(x = log2(half_life), y = log2(alpha))) +
  geom_point() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  theme_minimal()
ggplot(df_b, aes(x = log2(half_life), y = log2(alpha), color = regime)) +
  geom_point() +
  geom_vline(xintercept = 0, linetype = "dashed") +
  geom_hline(yintercept = 0, linetype = "dashed") +
  geom_text(
    subset(df_b, cell %in% c("Camp", "Ccr2"))
    aes(label = gene),
    vjust = -1
  ) +
  theme_minimal()




