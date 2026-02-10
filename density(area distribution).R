library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/data-3.csv")
features <- data[, c(
  "area_mean"
)]
head(features)
table(data$diagnosis)
data$diagnosis <- factor(data$diagnosis, levels = c("B", "M"))
ggplot(data, aes(x = area_mean, fill = diagnosis)) +
  geom_density(alpha = 0.5) +
  labs(
    title = "Density Plot of Area Mean by Diagnosis",
    x = "Area Mean",
    y = "Density",
    fill = "Diagnosis"
  ) +
  theme_minimal()
