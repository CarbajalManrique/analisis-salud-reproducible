# ============================================
# Autor: Carbajal Manrique
# Fecha: 2026-07-06
# Descripción:
# Construye un modelo de regresión logística para
# analizar la influencia de diferentes variables
# clínicas sobre el diagnóstico de cáncer de mama
# y almacena los resultados obtenidos para su
# posterior interpretación.
# ============================================

source("scripts/00_config.R")

# Leer datos
datos <- read.csv("data/processed/cancer_limpio.csv")

# Convertir variable respuesta
datos$diagnosis <- ifelse(datos$diagnosis == "M", 1, 0)

# Ajustar modelo
modelo <- glm(
  diagnosis ~
    radius_mean +
    texture_mean +
    perimeter_mean +
    area_mean +
    smoothness_mean,
  data = datos,
  family = binomial()
)

# Mostrar resultados
summary(modelo)

# Guardar resumen del modelo
sink("outputs/tables/modelo_regresion.txt")

cat("MODELO DE REGRESIÓN LOGÍSTICA\n\n")

print(summary(modelo))

sink()

# Guardar coeficientes
coeficientes <- as.data.frame(summary(modelo)$coefficients)

write.csv(
  coeficientes,
  "outputs/tables/coeficientes.csv"
)

# Gráfico de coeficientes

png(
  "outputs/figures/coeficientes.png",
  width = 700,
  height = 500
)

barplot(
  coef(modelo)[-1],
  las = 2,
  main = "Coeficientes del Modelo",
  ylab = "Valor del coeficiente",
  col = "steelblue"
)

dev.off()

cat("Modelo de regresión ejecutado correctamente.\n")