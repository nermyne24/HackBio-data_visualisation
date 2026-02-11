de_results <- read.csv(
  "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/hbr_uhr_deg_chr22_with_significance.csv",
  row.names = 1
)
head(de_results)
significant_gene <- rownames(de_results)[de_results$PAdj < 0.05 & abs(de_results$log2FoldChange) >= 1
] 
head(significant_gene)
length(significant_gene)
install.packages("ggplot2")
library(ggplot2)
de_results$category <- "ns"
de_results$category[de_results$log2FoldChange >= 1 & de_results$PAdj < 0.05] <- "up"
de_results$category[de_results$log2FoldChange <= -1 & de_results$PAdj < 0.05] <- "down"
table(de_results$category)
ggplot(de_results, aes(x = log2FoldChange, y = -log10(PAdj), color = category)) +
  geom_point(alpha = 0.6) +       # draws the dots, slightly transparent
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +  # fold-change thresholds
  scale_color_manual(values = c("up" = "green", "down" = "orange", "ns" = "grey")) +
  theme_minimal() +               # clean minimal theme
  labs(
    title = "Volcano Plot of Differentially Expressed Genes",
    x = "log2 Fold Change",
    y = "-log10 Adjusted P-value"
  )



