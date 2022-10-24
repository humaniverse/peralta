investigate <- function(url) {
  stopifnot("`url` must be a string." = is.character(url))
  polite::bow(url) |>
    polite::scrape() |>
    rvest::html_elements("a") |>
    rvest::html_attr("href") |>
    grep(".xls$|.xlsx$|.csv$|.ods$|.geojson$|.shp$", x = _, value = TRUE) |> 
    tibble::as_tibble_col(column_name = "evidence")
}

#' Do not export
investigate_fake <- function(url, status) {
  tibble::tribble(
    ~url, ~status, ~dataset,
    "suspect_1", "base", "dataset_1",
    "suspect_1", "base", "dataset_2",
    "suspect_1", "update", "dataset_2",
    "suspect_1", "update", "dataset_3",
    "suspect_2", "base", "dataset_4",
    "suspect_2", "update", "dataset_4",
    "suspect_2", "update", "dataset_5",
  ) |> 
  dplyr::filter(url == {{ url }}) |> 
  dplyr::filter(status == {{ status }}) |> 
  dplyr::select(evidence = dataset)
}

# investigate("https://www.england.nhs.uk/statistics/statistical-work-areas/hospital-discharge-data/")
# investigate_fake(url = "suspect_1", status = "unchanged")

