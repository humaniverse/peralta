#' Return latest report
report_last <- function() {

}

report_generate <- function(evidence_added = NULL,
                            evidence_removed = NULL,
                            evidence_last = NULL) {
  cli::cli({
    cli::cli_h1("Peralata report")
    cli::cli_h3("Summary:")
    cli::cli_text(
      "\u00a0\u00a0",
      cli::col_green("{cli::symbol$tick} "),
      "{cli::no(length(evidence_added))} dataset{?s} added"
    )
    cli::cli_text(
      "\u00a0\u00a0",
      cli::col_red("{cli::symbol$cross} "),
      "{cli::no(length(evidence_removed))} dataset{?s} removed"
    )
    cli::cli_text(
      "\u00a0\u00a0",
      cli::col_cyan("{cli::symbol$info} "),
      "last report: {.emph {unique(evidence_last$timestamp)}}"
    )
    if (length(evidence_added) != 0) {
      cli::cli_h3("datasets added")
      cli_ul(paste0("{.url ", evidence_added, "}"))
    }
    if (length(evidence_removed != 0)) {
      cli::cli_h3("datasets removed")
      cli_ul(paste0("{.url ", evidence_removed, "}"))
    }
  })
}
