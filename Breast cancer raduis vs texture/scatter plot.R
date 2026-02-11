library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/data-3.csv")
head(data)
data$X <- NULL
colnames(data)
table(data$diagnosis)
data$diagnosis <- factor(data$diagnosis, levels = c("B", "M"))
ggplot(data, aes(x = radius_mean,
                 y = texture_mean,
                 color = diagnosis)) +
  geom_point(size = 2, alpha = 0.7) +
  labs(
    title = "Scatter Plot of Radius Mean vs Texture Mean",
    x = "Radius Mean",
    y = "Texture Mean",
    color = "Diagnosis"
  ) +
  theme_minimal()

