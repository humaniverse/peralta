investigate <- function(url) {
  stopifnot("`url` must be a string." = is.character(url))
  polite::bow(url) |>
    polite::scrape() |>
    rvest::html_elements("a") |>
    rvest::html_attr("href") |>
    grep(".xls$|.xlsx$|.csv$|.ods$|.geojson$|.shp$", x = _, value = TRUE) |>
    tibble::as_tibble_col(column_name = "evidence")
}
