# Ensamblaje de representación reducida de genomas
# Alumna: Melania Andrea Vega Angeles


## Introducción
 El avance en las técnicas de secuenciación del ADN ha permitido obtener un mayor número de información en menos tiempo y con costos más accesibles. En cuanto a la secuenciación de genomas hay varios métodos que pueden dividirse en dos, principalmente, la secuenciación de genoma completo o secuenciación restringida del genoma para la que se emplean enzimas de restricción. Ejemplos de éstos últimos son Genotyping By Secuencing (GBS) o Restriction site-Associated DNA sequencing (RAD-seq).

 Una vez obtenidos los datos del secuenciador se deben hacer análisis de calidad y posteriormente realizar el ensamblado de los genomas. Para realizar esta tarea hay diversos programas entre los que figuran [STACKS](http://catchenlab.life.illinois.edu/stacks/) y [ipyrad](https://ipyrad.readthedocs.io/).

 Estos programas tienen parámetros determinados que se deben modificar de acuerdo a las siguientes consideraciones:
  - Biología de la especie
  - Número de individuos analizados
  - Enzima de restricción usada
  - Número de lecturas
  - Cobertura
  - Error de la plataforma
  - Librería empleada
  La elección de parámetros para el ensamblado no es trivial ya que, dependiendo de cuáles se empleen, variarán los resultados de nuestro set de datos. En algunos estudios, dejan los valores preestrablecidos, sin embargo, estos no siempre cumplirían con los requerimientos para explicar la biología de la especie estudiada, es por esto que se han propuesto métodos para establecer los valores adecuados de los parámetros.


## Discusión

Entre los métodos para establecer los valores adecuados para nuestro set de datos podemos citar el método r80 (Paris et al.2017) y el método de muestras duplicadas propuesto por Mastretta-Yanes y colaboradores (2015). El método r890 consiste en variar los parámetros y seleccionar los valores que maximicen el número de loci polimórficos encontrados en el 80% de los individuos estudiados.
El método propuesto por Mastretta-Yañes et al. (2015) consiste en incluir réplicas de ADN de un mismo individuo y variar los parámetros seleccionando los valores que minimicen la tasa de error y maximice el número de loci.

Ambos métodos son aplicables al usar cualquier método de secuenciación de genoma reducida y al emplear tanto STACKS como ipyrad. Sin embargo, la desventaja que observo puede ser del método de Mastretta-Yanes et al. (2015) es que se limita el número de muestras a analizar o efectos por factores que pueden pasar al tomar la muestra de tubos diferentes, por ejemplo. Aunque probar diferentes valores para los parámetros podría llevar más tiempo, ya no implica que pueda agregarse error del trabajo en el laboratorio.

De acuerdo a lo que evaluaron Paris et al (2017), si consideramos el siguiente script no modificaría ```-m``` (profundidad mínima de cobertura requerida) porque únicamente hay cambios radicales cuando se cambia de 1 a 2 y cuando se asigna un valor muy alto después del 5. En cuanto a ```-M```, este debe cambiarse por un valor más alto cuando se trata de analizar especies con niveles más altos de polimorfismo, como este script tiene muestras de padres e hijos y no se especifica de qué especie se trata, tampoco modificaría el valor de 4.

```
ustacks -f ./samples/f0_male.fq.gz -o ./stacks -i 1 -m 3 -M 4 -p 15
ustacks -f ./samples/f0_female.fq.gz -o ./stacks -i 2 -m 3 -M 4 -p 15
ustacks -f ./samples/progeny_01.fq.gz -o ./stacks -i 3 -m 3 -M 4 -p 15
ustacks -f ./samples/progeny_02. fq.gz -o ./stacks -i 4 -m 3 -M 4 -p 15
```


## Referencias

Mastretta-Yanes A, Arrigo N, Alvarez N, Jorgensen T, Piñero D y Emerson B. 2015. Restriction site-Associated DNA sequencing, genotyping error estimation and de novo assembly optimization for population genetic inference. Molecular Ecology Resources 15:28-41.

Paris J, Stevens J y Catchen J. 2017. Lost in parameter space: a road map for STACKS. Methods in Ecology and Evolution 8:1360-1373.
