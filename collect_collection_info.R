# Helper to snapshot per-table metadata (including full schema) to a JSONL file.
# Called from each collections/*/index.qmd after table metadata has been fetched.
#
# snapshot_collection_info(project, datasets_with_meta)
#
# Arguments:
#   project            - BQ project id string, e.g. "cwts-leiden"
#   datasets_with_meta - named list: list(
#                          dataset_id = list(
#                            meta   = <bq_dataset_meta result>,
#                            tables = <list of bq_table_meta results>
#                          ), ...
#                        )

library(tidyverse)
library(jsonlite)
library(rprojroot)

# Recursively convert BQ schema fields to a plain list for JSON serialisation.
fields_to_list <- function(fields) {
  if (is.null(fields) || length(fields) == 0) return(NULL)

  map(fields, \(f) list(
    name        = f$name %||% NA_character_,
    type        = f$type %||% NA_character_,
    mode        = f$mode %||% NA_character_,
    description = f$description %||% NA_character_,
    fields      = fields_to_list(f$fields)
  ))
}

snapshot_collection_info <- function(project, datasets_with_meta,
                                     out_path = NULL) {
  if (is.null(out_path)) {
    root <- find_root(has_file("DESCRIPTION"))
    out_path <- file.path(root, "data", paste0("collection_info_", project, ".jsonl"))
  }
  collected_at <- format(Sys.time(), "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")

  lines <- imap(datasets_with_meta, \(entry, ds_id) {
    ds_meta <- entry$meta
    tables  <- entry$tables

    map(tables, \(tbl_meta) {
      record <- list(
        collected_at        = collected_at,
        project             = project,
        dataset             = ds_id,
        table               = tbl_meta$tableReference$tableId,
        description         = tbl_meta$description %||% NA_character_,
        dataset_description = ds_meta$description %||% NA_character_,
        location            = tbl_meta$location %||% NA_character_,
        created_at          = tbl_meta$creationTime |>
          as.numeric() |>
          (\(ms) as.POSIXct(ms / 1000, origin = "1970-01-01", tz = "UTC"))() |>
          format("%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
        last_modified       = tbl_meta$lastModifiedTime |>
          as.numeric() |>
          (\(ms) as.POSIXct(ms / 1000, origin = "1970-01-01", tz = "UTC"))() |>
          format("%Y-%m-%dT%H:%M:%SZ", tz = "UTC"),
        num_bytes           = as.numeric(tbl_meta$numBytes %||% NA_real_),
        num_rows            = as.numeric(tbl_meta$numRows %||% NA_real_),
        schema              = fields_to_list(tbl_meta$schema$fields)
      )

      toJSON(record, auto_unbox = TRUE, null = "null", na = "null", digits = NA)
    })
  }) |>
    unlist()

  if (length(lines) > 0) {
    write(lines, file = out_path, append = FALSE)
  }

  invisible(length(lines))
}
