library(readxl)
library(pheatmap)

# 1️⃣ Charger la sheet c
df_c <- read_xlsx(path, sheet = "c")

# 2️⃣ Définir les rownames (gènes)
rownames(df_c) <- df_c[[1]]
df_c <- df_c[, -1]  # retirer la colonne 'genes'

# 3️⃣ Convertir en matrice numérique
mat <- as.matrix(df_c)

# 4️⃣ Vérifier
typeof(mat)        # "double"
sum(is.na(mat))    # 0

# 5️⃣ Construire annotation des colonnes
colnames_vec <- colnames(mat)
CellType <- gsub("n[0-9]+h", "", colnames_vec)
Time <- gsub(".*(n[0-9]+h)", "\\1", colnames_vec)

annotation_col <- data.frame(
  CellType = CellType,
  Time = Time
)
rownames(annotation_col) <- colnames(mat)

# 6️⃣ Heatmap
pheatmap(mat,
         annotation_col = annotation_col,
         cluster_rows = TRUE,
         cluster_cols = FALSE,
         scale = "row",
         fontsize_row = 8,
         fontsize_col = 8,
         main = "Temporal structure across immune compartments")

