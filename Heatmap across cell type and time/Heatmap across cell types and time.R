library(readxl)
library(pheatmap)

df_c <- read_xlsx(path, sheet = "c")

# La première colonne contient les gènes
rownames(df_c) <- df_c[[1]]

# Supprimer la colonne genes
df_c <- df_c[, -1]

# Convertir en matrice
mat <- as.matrix(df_c)

# Vérifier
dim(mat)
sum(is.na(mat))

# Construire annotations colonnes
colnames_vec <- colnames(mat)

CellType <- gsub("n[0-9]+h", "", colnames_vec)
Time <- gsub(".*(n[0-9]+h)", "\\1", colnames_vec)

annotation_col <- data.frame(
  CellType = CellType,
  Time = Time
)

rownames(annotation_col) <- colnames(mat)

# Heatmap
pheatmap(mat,
         annotation_col = annotation_col,
         cluster_rows = TRUE,
         cluster_cols = FALSE,
         scale = "row",
         show_rownames = FALSE)





