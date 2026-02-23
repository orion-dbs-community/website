library(tidyverse)
library(bigrquery)
library(rprojroot)

bq_ori <- Sys.getenv("BQ_ORI")
if (bq_ori != "") {
  if (file.exists(bq_ori)) {
    bq_auth(path = bq_ori)
  } else {
    temp_key <- tempfile(fileext = ".json")
    cat(bq_ori, file = temp_key)
    bq_auth(path = temp_key)
  }
}

projects <- c(
  "cwts-leiden",
  "insyspo",
  "multiobs",
  "sos-datasources",
  "subugoe-collaborative"
)

get_project_stats <- function(project) {
  datasets <- bq_project_datasets(project)

  map_dfr(datasets, function(ds) {
    tables <- bq_dataset_tables(ds)

    table_sizes <- map_dfr(tables, function(tbl) {
      meta <- bq_table_meta(tbl)
      tibble(
        dataset = ds$dataset,
        table   = meta$tableReference$tableId,
        bytes   = as.numeric(meta$numBytes)
      )
    })

    table_sizes |>
      summarise(
        n_tables   = n(),
        total_bytes = sum(bytes, na.rm = TRUE),
        .by = dataset
      )
  }) |>
    mutate(project = project, .before = 1)
}

stats <- map_dfr(projects, get_project_stats)

format_bytes <- function(value) {
  if (is.na(value)) return("—")
  size_gb <- value / (1024^3)
  if (size_gb >= 1) {
    paste0(format(round(size_gb, 2), nsmall = 2), " GB")
  } else {
    size_mb <- value / (1024^2)
    paste0(format(round(size_mb, 2), nsmall = 2), " MB")
  }
}

project_summary <- stats |>
  summarise(
    n_datasets  = n(),
    n_tables    = sum(n_tables),
    total_size = sum(total_bytes),
    .by = project)

write_csv(stats, find_root_file("data", "bq_stats.csv", criterion = has_file("DESCRIPTION")))
