peralta <- function() {
  if (file.exists("suspects.rds")) {
    suspect_list <- readRDS("suspects.rds")
  } else {
    stop(
      cli::format_error(
        c(
          "A list of suspects could not be found",
          "i" = "Add suspects with `suspects_add()`."
        )
      )
    )
  }

  evidence_new <- suspect_list |>
    dplyr::mutate(timestamp = Sys.time()) |>
    dplyr::mutate(evidence = lapply(suspect, investigate)) |>
    tidyr::unnest(evidence)

  if (file.exists("evidence.rds")) {
    evidence <- readRDS("evidence.rds")

    evidence_last <- evidence |>
      dplyr::filter(timestamp == max(timestamp))

    evidence_added <-
      dplyr::anti_join(
        evidence_new,
        evidence_last,
        by = c("suspect", "evidence")
      ) |>
      dplyr::pull(evidence)

    evidence_removed <-
      dplyr::anti_join(
        evidence_last,
        evidence_new,
        by = c("suspect", "evidence")
      ) |>
      dplyr::pull(evidence)

    # R/report.R
    report_create(evidence_added, evidence_removed, evidence_last)

    dplyr::bind_rows(evidence, evidence_new) |>
      saveRDS("evidence.rds")
  } else {

    # R/report.R
    report_create_first(evidence_new$evidence)

    saveRDS(evidence_new, "evidence.rds")
  }
}

# ---- Test run ----
# suspects_add("https://www.england.nhs.uk/statistics/statistical-work-areas/hospital-discharge-data/")
# suspects()
# peralta()
# evidence()
# peralta()
