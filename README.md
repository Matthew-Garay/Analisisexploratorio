# Análisis exploratorio del CPS 1985

Práctica de Inteligencia Artificial en R. Análisis exploratorio y transformación
de la distribución salarial del *Current Population Survey* de 1985.

## El dataset

`CPS1985.csv` contiene datos de ingresos y características
sociodemográficas de la población estadounidense en 1985. La columna que se
analiza es `wage`, el salario por hora.

## Qué hace el script

### Primera pasada

Carga el CSV y echa un vistazo general:

```r
cps1985 <- read.csv("CPS1985.csv", header = T)
dim(cps1985)
names(cps1985)
summary(cps1985)
```

### El histograma, por etapas

El script va puliendo el mismo gráfico cinco veces, y cada versión se apoya en la
anterior:

1. `hist(wage)` a pelo, solo para ver la forma
2. `attach(cps1985)` para trabajar con `wage` sin repetir el prefijo, y `text()`
   para poner el número de casos encima de cada barra
3. Con `breaks = 20` y título, ejes y colores
4. Recortando con `xlim = c(0, 50)`, porque el salario se concentra muy por
   debajo de 50 dólares y sin el recorte la distribución aparece aplastada
5. Con `freq = FALSE` para que el eje `y` sea **densidad** y no número de
   personas, lo que permite superponer la curva `density()`

```r
lines(density(wage), col = "yellow", lwd = 3)
lines(density(wage, adjust = 2), col = "red", lwd = 3, lty = 2)
abline(v = mean(wage), col = "darkblue", lwd = 2, lty = 2)
```

La curva discontinua usa `adjust = 2`, que ensancha la banda: al compararla con
la normal se ve si la distribución se aparta de esa forma o no. La línea azul
vertical marca la media.

### El mismo análisis sobre el logaritmo

El último gráfico repite el proceso con `log(wage)`, y ahí sí la forma se parece
mucho a una campana:

```r
hist(log(wage), breaks = 20, freq = FALSE, xlim = c(0, 4), ylim = c(0, 0.80))
```

Es la comprobación de siempre: si al tomar el logaritmo la distribución se
acerca a la normal, es una señal de que la variable tiene una cola larga a la
derecha y que un análisis sobre `log(wage)` es más adecuado que sobre `wage`.

## Cómo ejecutarlo

El script está pensado para **cargarse y ejecutarse paso a paso** en RStudio,
porque cada gráfico se dibuja sobre el anterior. Si lo corres entero de una vez,
las cinco versiones del histograma se dibujan una detrás de otra.

En RStudio: `Ctrl+Shift+S`. En consola:

```r
source("Practica8.R")
```

`attach/1` deja el objeto en el camino de búsqueda y se olvida de limpiarlo al
terminar la sesión. Si vas a seguir tocando el entorno, llama a `detach("cps1985")`
cuando termines.

## Paquetes

Ninguno. El script usa solo la base de R: `hist`, `density`, `lines`, `abline`,
`summary`, `dim` y `names`.

## Nota

Se añadió un `.gitignore` para `Rhistory`, `.RData` y `.Rproj.user/`, que son
archivos de trabajo de RStudio y no del análisis.
