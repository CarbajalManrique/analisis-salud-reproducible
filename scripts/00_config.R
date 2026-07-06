# ============================================
# Autor: Carbajal Manrique
# Curso: Análisis Estadístico
# Fecha: 2026-07-06
# Descripción:
# Inicializa el proyecto preparando el entorno
# de trabajo. Carga las librerías requeridas,
# verifica su instalación y crea la estructura
# de carpetas donde se almacenarán los datos,
# tablas y gráficos generados durante el análisis.
# ============================================

# Paquetes necesarios
paquetes <- c("tidyverse", "ggplot2", "corrplot")

instalados <- paquetes %in% rownames(installed.packages())

if(any(!instalados)){
  install.packages(paquetes[!instalados])
}

# Cargar librerías
library(tidyverse)
library(ggplot2)
library(corrplot)

# Crear carpetas del proyecto
carpetas <- c(
  "data/raw",
  "data/processed",
  "outputs/figures",
  "outputs/tables"
)

for(carpeta in carpetas){
  dir.create(carpeta,
             recursive = TRUE,
             showWarnings = FALSE)
}

cat("Configuración completada correctamente.\n")