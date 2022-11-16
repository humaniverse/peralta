peralta <- function() {

  # Load suspect list
  suspect_list <- suspects_load()

  #  Investigate suspects for new evidence
  evidence_new_nested <- suspect_list |>
    dplyr::mutate(timestamp = Sys.time()) |>
    dplyr::mutate(evidence = lapply(suspect, investigate))
  
  evidence_new_unnested <- evidence_new_nested |> 
    tidyr::unnest(evidence)

  # Check/compare existing evidence
  if (file.exists("evidence.rds")) {
    evidence_existing_nested <- readRDS("evidence.rds")

    evidence_last_unnested <- evidence_existing_nested |>
      dplyr::filter(timestamp == max(timestamp)) |> 
      tidyr::unnest(evidence)

    timestamp_last_report <- evidence_last_unnested |>
      dplyr::filter(timestamp == max(timestamp)) |> 
      dplyr::pull(timestamp) |> 
      unique()

    evidence_added <-
      dplyr::anti_join(
        evidence_new_unnested,
        evidence_last_unnested,
        by = c("suspect", "evidence")
      ) |>
      dplyr::pull(evidence)

    evidence_removed <-
      dplyr::anti_join(
        evidence_last_unnested,
        evidence_new_unnested,
        by = c("suspect", "evidence")
      ) |>
      dplyr::pull(evidence)

    report_create(evidence_added, evidence_removed, timestamp_last_report)

    dplyr::bind_rows(evidence_existing_nested, evidence_new_nested) |>
      saveRDS("evidence.rds")
  } else {
    report_create_first(evidence_new_unnested$evidence)

    saveRDS(evidence_new_nested, "evidence.rds")
  }
}
