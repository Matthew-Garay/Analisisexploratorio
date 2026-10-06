# Analisis exploratorio del CPS 1985

Practica de IA en R. Analisis exploratorio de los salarios por hora del Current Population Survey de 1985, que viene en `CPS1985.csv`.

El script va puliendo el mismo histograma por etapas: primero a pelo, luego con conteos por barra, con 20 intervalos, recortando el eje hasta 50 dolares y al final como densidad para superponer la curva. El ultimo grafico repite todo sobre `log(wage)`, donde la forma si se parece a una campana.

## Requisitos

R o RStudio, solo con la base (hist, density, summary). Sin paquetes extra.

## Uso

```r
source("Practica8.R")
```

Esta pensado para correrse por pasos en RStudio, porque cada grafico se dibuja sobre el anterior.
