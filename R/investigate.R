investigate <- function(url) {
  stopifnot("`url` must be a string." = is.character(url))

  response <- polite::bow(url) |>
    polite::scrape()

  dom <- response |>
    rvest::html_elements("a") |>
    rvest::html_attr("href")

  data_urls <- dom |>
    grep(".xls$|.xlsx$|.csv$|.ods$|.geojson$|.shp$", x = _, value = TRUE) |>
    tibble::as_tibble_col(column_name = "evidence")
}
