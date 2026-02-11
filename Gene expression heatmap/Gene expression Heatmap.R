counts <- read.csv(
  "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/hbr_uhr_top_deg_normalized_counts.csv",
  row.names = 1)
de_results <- read.csv(
  "https://raw.githubusercontent.com/HackBio-Internship/2025_project_collection/refs/heads/main/Python/Dataset/hbr_uhr_deg_chr22_with_significance.csv",
  row.names = 1
)
head(counts)
head(de_results)
significant_gene <- rownames(de_results)[de_results$PAdj < 0.05 ]
length(significant_genes)
common_genes <- intersect(significant_genes, rownames(counts))
heatmap_data <- counts[common_genes, ]
head(heatmap_data)
scaled_data <- t(scale(t(heatmap_data)))
head(scaled_data)
heatmap(scaled_data)
install.packages("pheatmap")
library(pheatmap)
pheatmap(
  scaled_data,
  color = colorRampPalette(c("white", "lightblue", "blue"))(100),
  cluster_rows = TRUE,
  cluster_cols = TRUE,
  show_rownames = TRUE,
  show_colnames = TRUE,
  scale = "none",
  fontsize_row = 6,
  fontsize_col = 10
)
length(significant_genes)   # tous les gènes significatifs
length(rownames(counts))   # gènes dans counts
length(common_genes)       # intersection finale










