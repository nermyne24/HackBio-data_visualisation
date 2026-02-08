library(ggplot2)
data <- read.csv("https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/data-3.csv")
features <- data[, c(
  "radius_mean",
  "texture_mean",
  "perimeter_mean",
  "area_mean",
  "smoothness_mean",
  "compactness_mean"
)]
head(features)
cor_matrix <- cor(features)
round(cor_matrix, 2)
install.packages("corrplot")   # run once
library(corrplot)
plot.new()
dev.off()
corrplot(
  cor_matrix,
  method = "color",
  type = "upper",
  addCoef.col = "black",
  tl.col = "black",
  tl.srt = 45,
  tl.cex = 0.8,     # smaller labels
  number.cex = 0.6 # smaller numbers
)

title("Correlation Heatmap of Key Breast Cancer Features")


