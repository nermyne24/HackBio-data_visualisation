library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/data-3.csv")
features <- data[, c(
  "compactness_mean",
  "smoothness_mean"
)]
head(features)
table(data$diagnosis)
data$diagnosis <- factor(data$diagnosis, levels = c("B", "M"))
ggplot(data, aes(x = smoothness_mean,
                 y = compactness_mean,
                 color = diagnosis)) +
  geom_point(size = 2, alpha = 0.7) +
  labs(
    title = "Scatter Plot of compactness_mean vs smoothness_mean",
    x = "smoothness_mean",
    y = " compactness_mean",
    color = "Diagnosis"
  ) +
  theme_minimal()