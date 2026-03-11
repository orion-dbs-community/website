library(tidyverse)
library(rentrez)

# Set your NCBI API key
set_entrez_key(Sys.getenv("ENTREZ_KEY"))

base_term <- '("nih"[Grants and Funding])'

out_file  <- "nih_pmids_2018_2024.txt"
done_file <- "nih_pmids_done.txt"   # tracks completed year-month pairs

# Load already-completed months so we can skip them on resume
done_months <- if (file.exists(done_file)) readLines(done_file) else character(0)

# Retry wrapper for 502 / transient HTTP errors
entrez_retry <- function(expr, retries = 5) {
  for (i in seq_len(retries)) {
    result <- tryCatch(expr, error = function(e) {
      if (grepl("502|503|500", conditionMessage(e))) {
        wait <- 2^i
        cat("  HTTP error, retrying in", wait, "s...\n")
        Sys.sleep(wait)
        NULL
      } else {
        stop(e)
      }
    })
    if (!is.null(result)) return(result)
  }
  stop("Failed after ", retries, " retries")
}

# Build monthly queries
queries <- expand_grid(year = 2018:2024, month = 1:12) |>
  mutate(
    dim        = days_in_month(make_date(year, month, 1)),
    start_date = str_glue("{year}/{str_pad(month, 2, pad='0')}/01"),
    end_date   = str_glue("{year}/{str_pad(month, 2, pad='0')}/{str_pad(dim, 2, pad='0')}"),
    term       = str_glue('{base_term} AND ({start_date}:{end_date}[pdat])')
  )

pwalk(queries, \(year, month, term, ...) {
  key <- str_glue("{year}-{str_pad(month, 2, pad='0')}")

  if (key %in% done_months) {
    cat(key, ": skipping (already done)\n")
    return(invisible(NULL))
  }

  Sys.sleep(0.15)
  n <- entrez_retry(entrez_search(db = "pubmed", term = term, retmax = 0)$count)
  cat(key, ":", n, "\n")

  ids <- if (n == 0) {
    character(0)
  } else if (n <= 9999) {
    Sys.sleep(0.15)
    entrez_retry(entrez_search(db = "pubmed", term = term, retmax = 9999)$ids)
  } else {
    # > 9999 — split by day
    cat("  Splitting by day...\n")
    dim <- days_in_month(make_date(year, month, 1))
    map(1:dim, \(day) {
      d        <- str_glue("{year}/{str_pad(month, 2, pad='0')}/{str_pad(day, 2, pad='0')}")
      day_term <- str_glue('{base_term} AND ({d}:{d}[pdat])')
      Sys.sleep(0.15)
      entrez_retry(entrez_search(db = "pubmed", term = day_term, retmax = 9999)$ids)
    }) |> list_c()
  }

  # Append new PMIDs and mark month as done
  if (length(ids) > 0) write_lines(ids, out_file, append = TRUE)
  write_lines(key, done_file, append = TRUE)
  done_months <<- c(done_months, key)
})

# Deduplicate the final file
all_pmids <- unique(readLines(out_file))
write_lines(all_pmids, out_file)
cat("Done.", length(all_pmids), "unique PMIDs written to", out_file, "\n")
