# INTRODUCCIÓN A LA BIOINFORMÁTICA PARA BIÓLOGOS Y GENETISTAS
# Unidad 7
# Tarea 7.1: Expresión diferencial
# Alumna: Melania Andrea Vega Angeles
# Posgrado de Ciencias Biológicas
# Unidad Nacional Atónoma de México
# 10 de mayo de 2019


## Introducción
El desarrollo de las nuevas tecnologías para la secuenciación de los genomas de los seres vivos abrió muchas preguntas de investigación nuevas. Sin embargo, era necesario avanzar en el análisis de la expresión génica notando las diferencias que se dan debido a diversos factores.

El diseño de microarreglos permitió  determinar la actividad transcripcional de todos los genes de un organismo bajo ciertas condiciones experimentales y no gen por gen como sucedía en estudios previos. El microarreglo puedo ser diseñado en cualquier laboratorio y hay varias herramientas bioinformáticas para el diseño y la construcción de las bases de datos.

El resultado la diferencia en la expresión está dada por la diferente intensidad de la iluminación que ocasiona la hibridación de las sondas marcadas y el transcrito. Estas intensidades se registran y puede analizarse bioinformáticamente con programas como R y sus diferentes paquetes.

El objetivo de este informe fue comprender y aplicar las técnicas para el análisis de datos de microarreglos diseñados para detectar genes diferencialmente expresados, determinando si existe expresión diferencial entre los genotipos, si existe diferencia en expresión entre los tratamientos y evaluar las diferencias en la respuesta al tratamiento entre los dos genotipos.

## Metodología

 Para este análisis se emplearon datos de perfiles de expresión génica en el tejido cardiaco de ratones, cuyo objetivo era evaluar el efecto de la variación genética en el cromosoma Y sobre el tamaño de los cardiomiocitos y la posible dependencia de tales efectos en niveles de testosterona.

 Se muestrearon ocho ratones machos de dos cepas: C57BL/6J y C57BL/6J-chrY<A/J/NaJ> (B y BY). Cuatro de cada tratamiento fueron castrados y cuatro fueron sometidos al mismo proceso quirúrjico pero sin realizar la castración.

El análisis de los resultados de la lectura del chip se realizó empleando el [tutorial](https://github.com/AliciaMstt/BioinfinvRepro/blob/master/Unidad7/Tutorial_de_expresion_diferencial_en_R.md) realizado por Ricardo A. Verdugo con las siguientes modificaciones:
```
# Definir preliminares
outdir     <- "output"
fdr_th     <- 0.19 # Proporción de descubrimientos falsos que son aceptables

# Importar datos eligiendo 5000 sondas al azar
Data.Raw <- read.delim("GSE15354_raw.txt")
Data.Raw <- Data.Raw %>%
  sample_n(size=5000, replace=FALSE)

  # Construit matriz de contrastes
  cmat <- rbind(Geno     =  c( 1,   1,  -1,  -1 )*.25,
                Trt      =  c( 1,  -1,   1,  -1 )*.25,
                Int      =  c( 1,  -1,  -1,   1 ),
                Geno_I   =  c( 0,   1,   0,  -1 ),
                Geno_C   =  c( 1,   0,  -1,   0 ),
                Trt_B    =  c( 1,  -1,   0,   0 ),
                Trt_BY   =  c( 0,   0,   1,  -1 ),
                B.C_BY.I =  c( 1,   0,   0,  -1 ),
                B.I_BY.C =  c( 0,   1,  -1,   0 ))

# Probar contrastes
test.cmat <- matest(madata, fit.fix, term="Group", Contrast=cmat, n.perm=500, test.type = "ttest", shuffle.method="sample", verbose=TRUE)

```
Y se eliminó el filtrado de sondas que no detectan transcritos.
```
probe_present      <- Data.Raw[,detection] < 0.04
detected_per_group <- t(apply(probe_present, 1, tapply, design$Group, sum))
present  <- apply(detected_per_group >= 2, 1, any)
normdata <- normdata[present,]
annot    <- annot[present, ]
```

## Resultados
Ya que no todas las sondas muestran la misma calidad al ser alineadas contra el genoma de referencia se evaluó la calidad, el resultado mostró que el mayor número de sondas eras perfectas:

```
Calidad de sondas:
Malas 277
Buenas 106
Perfectas 4458
Muy perfectas 159
```
De acuerdo a los resultados de genes expresados, que se graficaron de forma de diagrama de Venn (Figura 1), existe un efecto de interacción entre los genotipos y entre el tratamiento y el control. Cuando se evalúa el efecto del tratamiento podemos observar que los castrados tienen expresión única de 122 genes, mientras que los intactos tienen menor expresión y entre ambos se comparte de expresión de 29 genes. Mientras que si observamos la expresion por genotipo, podemos observar que el genotipo BY tiene mayor expresión (120 genes) que el genotipo B.  


![textlink](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/blob/master/vennDiagram_Int.png)
**Figura 1** Diagramas de Venn en los que se muestran las respuestas por tratamiento y genotipo. I= intacto; C= castrado; B= C57BL/6J; BY=C57BL/6J-chrY<A/J/NaJ>.

También se evalúo la diferencia en la expresión de genes a partir del genotipo, el tratamiento y la interacción de ambos, con el fin de conocer si existía un efecto de interacción entre ambas variables o había una tendencia que dominara o el genotipo o el tratamiento. En la Figura 2 podemos observar que la diferencia entre los genes que se expresan dado el genotipo no es muy diferente a los expresados por el tratamiento y el número de genes expresados por la interacción es de 38, menor a los expresados por el genotipo o por el tratamiento.  

![textlink](https://github.com/Melcatus/Tareas_BioinfRepro2019_MAVA/blob/master/vennDiagram_DiffExprs.png)

**Figura 2** Genes expresados debido al genotipo o el tratamiento y el efecto de la interacción de ambos.

## Conclusiones

El análisis de microarreglos es útil para comprender las diferencias en la expresión génica dadas por las diferentes condiciones experimentales. Es indispensable tener un grupo control para discriminar los efectos dados por el genotipo o por el tratamiento. En este análisis es evidente que tanto la aplicación del tratamiento como las diferencias en el genotipo van a ocasionar diferencias en la expresión génica. Sin embargo, la aplicación del tratamiento ocasiona que haya mayor expresión, por lo que es más probable que tenga un efecto en los niveles de testosterona y en el tamaño de los cardiomiocitos. 
