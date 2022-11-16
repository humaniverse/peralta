#' Print the evidence
evidence <- function(n = 20) {
  # Check file exists
  if (file.exists("evidence.rds")) {
    evidence <- readRDS("evidence.rds") |>
      tibble::as_tibble()
  } else {
    stop(
      cli::format_error(
        c(
          "An evidence report could not be found",
          "i" = "Run `peralta()` to investigate the suspects."
        )
      )
    )
  }

  print(evidence, n = n)
}
