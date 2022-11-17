#' Return latest report
report_last <- function() {

}

report_create <- function(evidence_added = NULL,
                          evidence_removed = NULL,
                          timestamp_last_report = NULL) {
  cli::cli({
    cli::cli_h1("Peralta report")
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
      "last report: {.emph {timestamp_last_report}}"
    )
    if (length(evidence_added) != 0) {
      cli::cli_h3("datasets added")
      cli::cli_ul(paste0("{.url ", evidence_added, "}"))
    }
    if (length(evidence_removed != 0)) {
      cli::cli_h3("datasets removed")
      cli::cli_ul(paste0("{.url ", evidence_removed, "}"))
    }
  })
}

report_create_first <- function(evidence = NULL) {
  cli::cli({
    cli::cli_h1("Peralta report")
    cli::cli_text(
      c(
        "This is the first time the suspects have been investigated. ",
        "The following evidence was found: "
      )
    )
    cli::cli_h3("Summary:")
    cli::cli_text(
      "\u00a0\u00a0",
      cli::col_green("{cli::symbol$tick} "),
      "{cli::no(length(evidence))} dataset{?s} added"
    )
    if (length(evidence) != 0) {
      cli::cli_h3("datasets added")
      cli::cli_ul(paste0("{.url ", evidence, "}"))
    }
  })
}
