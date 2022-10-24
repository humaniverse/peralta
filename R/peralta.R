peralta <- function() {
  if (file.exists("suspects.rds")) {
    suspect_list <- readRDS("suspects.rds")
  } else {
    stop("A list of suspects could not be found. Add suspects with `suspects_add()`.")
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

    print(paste0("Data added: ", evidence_added))

    evidence_removed <-
      dplyr::anti_join(
        evidence_last,
        evidence_new,
        by = c("suspect", "evidence")
      ) |>
      dplyr::pull(evidence)

    print(paste0("Data removed: ", evidence_removed))

    dplyr::bind_rows(evidence, evidence_new) |>
      saveRDS("evidence.rds")
  } else {
    message("
    This is the first time Peralta has investigated the suspects for evidence.
    Run this function again to see if any new evidence has emerged.
    ")
    saveRDS(evidence_new, "evidence.rds")
  }
}

# investigate_fake <- function(url, status) {
#   tibble::tribble(
#     ~url, ~status, ~dataset,
#     "suspect_1", "base", "dataset_1",
#     "suspect_1", "base", "dataset_2",
#     "suspect_1", "update", "dataset_2",
#     "suspect_1", "update", "dataset_3",
#     "suspect_2", "base", "dataset_4",
#     "suspect_2", "update", "dataset_4",
#     "suspect_2", "update", "dataset_5",
#   ) |>
#   dplyr::filter(url == {{ url }}) |>
#   dplyr::filter(status == {{ status }}) |>
#   dplyr::select(evidence = dataset)
# }

# readRDS("suspects.rds") |>
#   dplyr::mutate(timestamp = Sys.time()) |>
#   dplyr::mutate(evidence = lapply(suspect, investigate_fake, status = "base")) |>
#   tidyr::unnest(evidence) |>
#   saveRDS("evidence.rds")

# evidence()
# peralta()

suspects_add("https://www.england.nhs.uk/statistics/statistical-work-areas/hospital-discharge-data/")
peralta()
evidence()
