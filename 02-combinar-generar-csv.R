library(tidyverse)
library(arrow)

positivos <- readRDS("local_data/positivos_covid_aumentado.rds") %>%
  select(id_persona, fecha_resultado, metododx) %>%
  distinct() %>%
  mutate(
    id_persona = as.integer(id_persona)
  )

vacunados_ds <- open_dataset(
  "local_data/arrow_augmented_data/"
)

for (fn in vacunados_ds$files) {
  cat("Procesando: ", fn, "\n")
  ofn <- str_replace(fn, "arrow_augmented_data", "vacunados_positivos")
  df <- read_parquet(fn, col_select = c("id_persona", "fecha_vacunacion", "dosis", "flag_vacunacion_general")) %>%
    filter(flag_vacunacion_general == TRUE) %>%
    select(-flag_vacunacion_general)
  if(nrow(df) > 0) {
    tmp_df <- df %>%
      left_join(
        positivos,
        by = "id_persona"
      )
    write_parquet(
      tmp_df,
      sink = ofn
    )
  }
  cat(">> Guardando: ", ofn, "\n")
}

vac_pos <-  open_dataset("local_data/vacunados_positivos")

for (fn in vac_pos$files) {
  epiyear <- str_extract(fn, "epi_year=\\d{4}") %>%
    str_replace("=", "-")
  epiweek <- str_extract(fn, "epi_week=\\d{1,2}") %>%
    str_replace("=", "-")
  ofn <- glue::glue("datos/vacunados_positivos_{epiyear}_{epiweek}.csv.7z")
  tmp <- read_parquet(fn)
  cat("Generando CSV: ", ofn)
  write_csv(tmp, ofn)
}

vac_pos_all <- vac_pos %>%
  collect()

vac_pos_ids <- unique(vac_pos_all$id_persona)

novac_pos <- positivos %>%
  filter(!id_persona %in% vac_pos_ids)

cat("Generando positivos no vacunados: 'covid19_peru_positivos_no_vacunados.csv.7z'\n")
write_csv(
  novac_pos,
  "datos/covid19_peru_positivos_no_vacunados.csv.7z"
)
