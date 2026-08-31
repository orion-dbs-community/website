# Render BigQuery description fields (dataset, table, field) as HTML.
#
# BigQuery descriptions are free-form markdown maintained by the collection
# owners. Some of them use ATX headings ("## ..."), which Pandoc picks up as
# document headings: they end up in the sidebar TOC next to the dataset names
# and break the "## <dataset>" hierarchy the collection pages rely on.
#
# bq_description_html() renders the markdown to HTML here and demotes any
# heading to a level below the dataset heading; raw_html_block() hands the
# result to Pandoc as a raw block, so it is never parsed as markdown again and
# can no longer contribute to the TOC.

# Shift all heading levels in an HTML fragment so that the topmost heading
# becomes base_level, clamped to h6.
shift_heading_levels <- function(html, base_level = 5L) {
  levels <- as.integer(unlist(
    regmatches(html, gregexpr("(?<=<h)[1-6](?=[ >])", html, perl = TRUE))
  ))
  if (!length(levels)) {
    return(html)
  }
  offset <- base_level - min(levels)
  # Visit the levels in an order in which an already shifted heading cannot be
  # matched again by a later iteration.
  for (level in if (offset >= 0) 6:1 else 1:6) {
    new_level <- min(6L, max(1L, level + offset))
    html <- gsub(
      paste0("<h", level, "([ >])"),
      paste0("<h", new_level, "\\1"),
      html
    )
    html <- gsub(paste0("</h", level, ">"), paste0("</h", new_level, ">"), html)
  }
  html
}

# Render a BigQuery description as an HTML fragment. Returns "" when there is
# no description. base_level is the heading level the topmost heading of the
# description is demoted to.
bq_description_html <- function(x, base_level = 5L) {
  if (is.null(x) || length(x) == 0 || is.na(x[[1]]) || !nzchar(trimws(x[[1]]))) {
    return("")
  }
  html <- commonmark::markdown_html(x[[1]], smart = TRUE, extensions = TRUE)
  shift_heading_levels(html, base_level = base_level)
}

# Wrap HTML in a Pandoc raw HTML block, for use in "results: asis" chunks.
# The fence matters: pasting the HTML in directly ends the raw block at the
# first blank line, after which Pandoc parses the remainder as markdown again.
raw_html_block <- function(...) {
  fence <- strrep("`", 8)
  paste0(
    "\n", fence, "{=html}\n",
    paste0(..., collapse = ""),
    "\n", fence, "\n"
  )
}

# bigrquery::bq_table_meta() builds its request URL with a raw paste0() and
# doesn't URL-encode identifiers, so it errors on table names BigQuery itself
# allows but that need percent-encoding (e.g. names containing spaces).
# Same call, with the path properly encoded.
bq_table_meta_safe <- function(table, fields = NULL) {
  table <- bigrquery::as_bq_table(table)
  url <- bigrquery:::bq_path(
    utils::URLencode(table$project, reserved = TRUE),
    utils::URLencode(table$dataset, reserved = TRUE),
    utils::URLencode(table$table,   reserved = TRUE)
  )
  bigrquery:::bq_get(url, query = list(fields = fields))
}
