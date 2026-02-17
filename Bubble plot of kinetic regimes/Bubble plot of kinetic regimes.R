library(readxl)
library(ggplot2)

# Read sheet e
df_e <- read_xlsx(path, sheet = "e")

# Vérifier structure
str(df_e)

# Assurez-vous que les colonnes sont numériques
df_e$half_life <- as.numeric(df_e$half_life)
df_e$alpha <- as.numeric(df_e$alpha)
df_e$count <- as.numeric(df_e$count)

# Bubble plot
ggplot(df_e, aes(x = half_life,
                 y = alpha,
                 color = stage,
                 size = count)) +
  geom_point(alpha = 0.8) +
  scale_size_continuous(range = c(3, 12)) +
  theme_minimal() +
  labs(
    x = "Half-life",
    y = "Alpha (synthesis rate)",
    color = "Stage",
    size = "Gene count",
    title = "Kinetic regimes of gene expression"
  )
