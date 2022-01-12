# symlink datos locales

fs::link_create(
  "~/devel/github/covid-19-peru-limpiar-datos-minsa/datos/positivos_covid_aumentado.rds",
  "local_data/positivos_covid_aumentado.rds"
)

fs::link_create(
  "~/devel/github/covid-19-peru-vacunas/tmp/arrow_augmented_data/",
  "local_data/arrow_augmented_data"
)

fs::link_create(
  "~/devel/github/covid-19-peru-vacunas/tmp/vacunados_positivos/",
  "local_data/vacunados_positivos"
)
