## Vacunados que han tenido pruebas positivas y positivos que no se han vacunado

Datos basados en datos abiertos del MINSA, preprocesados en mis otros repositorios

- Vacunados: https://www.datosabiertos.gob.pe/dataset/vacunacion
  - Repositorio: https://github.com/jmcastagnetto/covid-19-peru-vacunas
- Positivos: https://www.datosabiertos.gob.pe/dataset/casos-positivos-por-covid-19-ministerio-de-salud-minsa
  - Repositorio: https://github.com/jmcastagnetto/covid-19-peru-limpiar-datos-minsa

## Estructura de datos

Los datos de vacunados que pueden haber tenido una prueba positiva, están en archivos CSV comprimidos (`csv.7z`) separados por año y semana epidemiológica, y contienen los siguientes campos:

- `id_persona`: identificador numérico asignado por MINSA a una persona
- `fecha_vacunacion`: en formato YYYY-MM-DD
- `dosis`: número de la dosis
- `fecha_resultado`: fecha en la que se tuvo la prueba positiva, en formato YYYY-MM-DD
- `metododx`: método usado para la prueba

Además, se ha generado un listado de todos aquellos que teniendo una prueba positiva no aparecen entre aquellos que han recibido al menos una dosis de vacunas (archivo: `covid19_peru_positivos_no_vacunados.csv.7z`), con los siguientes campos:

- `id_persona`: identificador numérico asignado por MINSA a una persona
- `fecha_resultado`: fecha en la que se tuvo la prueba positiva, en formato YYYY-MM-DD
- `metododx`: método usado para la prueba


## Licencia: MIT