# ============================================
# Autor: Carbajal Manrique
# Fecha: 2026-07-06
# Descripción:
# Procesa el conjunto de datos eliminando
# columnas que no aportan al análisis y
# preparando una versión limpia para el
# análisis estadístico.
# ============================================

source("scripts/00_config.R")

# Leer datos
datos <- read.csv(
  "data/raw/data.csv",
  stringsAsFactors = FALSE
)

# Ver nombres de columnas
names(datos)

# Eliminar columna ID
if("id" %in% names(datos)){
  datos$id <- NULL
}

# Eliminar columna vacía (puede tener distintos nombres)
datos <- datos[, !names(datos) %in% c("Unnamed..32", "Unnamed: 32", "X")]

# Verificar valores faltantes
colSums(is.na(datos))

# Eliminar únicamente filas con NA (si existen)
datos <- na.omit(datos)

# Guardar datos limpios
write.csv(
  datos,
  "data/processed/cancer_limpio.csv",
  row.names = FALSE
)

cat("Número de registros:", nrow(datos), "\n")
cat("Número de variables:", ncol(datos), "\n")
cat("Limpieza completada correctamente.\n")