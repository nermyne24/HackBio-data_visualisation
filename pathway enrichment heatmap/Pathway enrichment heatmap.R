library(readxl)
library(pheatmap)

# Read sheet d_1
df_d <- read_xlsx(path, sheet = "d_1")

# Use pathway names as rownames
rownames(df_d) <- df_d[[1]]
df_d <- df_d[, -1]

# Convert to matrix
mat <- as.matrix(df_d)

# Make sure it's numeric
mat <- apply(mat, 2, as.numeric)
rownames(mat) <- rownames(df_d)

# Define diverging color scale centered at 0
max_abs <- max(abs(mat), na.rm = TRUE)

breaks <- seq(-max_abs, max_abs, length.out = 100)

colors <- colorRampPalette(c("blue", "white", "red"))(99)

# Plot heatmap (NO clustering)
pheatmap(mat,
         cluster_rows = FALSE,
         cluster_cols = FALSE,
         color = colors,
         breaks = breaks,
         main = "Pathway enrichment across timepoints")
