# ============================================
# Autor: Carbajal Manrique
# Fecha: 2026-07-06
# Descripción:
# Realiza un análisis descriptivo del conjunto
# de datos mediante estadísticas, gráficos y
# correlaciones entre las variables numéricas.
# ============================================

source("scripts/00_config.R")

# Leer datos
datos <- read.csv(
  "data/processed/cancer_limpio.csv",
  stringsAsFactors = FALSE
)

# Verificar estructura
str(datos)

# Convertir todas las columnas numéricas
datos <- datos %>%
  mutate(across(-diagnosis, as.numeric))

# Resumen estadístico
write.csv(
  summary(datos),
  "outputs/tables/resumen.csv"
)

# Histograma
png("outputs/figures/histograma_radius.png")

hist(
  datos$radius_mean,
  main = "Distribución de Radius Mean",
  xlab = "Radius Mean",
  col = "lightblue"
)

dev.off()

# Boxplot
png("outputs/figures/boxplot_area.png")

boxplot(
  area_mean ~ diagnosis,
  data = datos,
  col = c("lightgreen", "pink"),
  main = "Área media según diagnóstico"
)

dev.off()

# Correlación
numericas <- datos %>%
  select(where(is.numeric))

matriz <- cor(numericas)

write.csv(
  matriz,
  "outputs/tables/correlacion.csv"
)

png("outputs/figures/correlacion.png",
    width = 900,
    height = 900)

corrplot(
  matriz,
  method = "color",
  tl.cex = 0.6
)

dev.off()

cat("Análisis exploratorio finalizado.\n")