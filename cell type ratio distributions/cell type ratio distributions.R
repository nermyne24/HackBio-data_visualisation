install.packages("readxl")
library(readxl)
data <- read_xlsx(file.choose())
path <- file.choose()
data <- read_xlsx(path)
excel_sheets(path)
df_a <- read_xlsx(path, sheet = "a")
head(df_a)
library(ggplot2)
library(pheatmap)
library(igraph)
ggplot(df_a, aes(x = cell_type, y = new_ratio)) +
  geom_boxplot()
ggplot(df_a, aes(x = cell_type, y = new_ratio)) +
  geom_boxplot() +
  theme_minimal() +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1)
  )
ggplot(df_a, aes(x = cell_type, y = new_ratio)) +
  geom_boxplot() +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, max(df_a$new_ratio) * 1.1)
ggplot(df_a, aes(x = cell_type, y = new_ratio)) +
  geom_boxplot(
    outlier.colour = "red",
    outlier.shape = 16,
    outlier.size = 2
  ) +
  theme_minimal() +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  ylim(0, max(df_a$new_ratio) * 1.1)




