investigate <- function(url) {
  stopifnot("`url` must be a string." = is.character(url))
  stopifnot(
    "`url` is not a valid URL. Ensure it starts with 'http[s]:'" = grepl(
      pattern = "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+",
      x = url
    )
  )

  response <- polite::bow(url) |>
    polite::scrape()

  dom <- response |>
    rvest::html_elements("a") |>
    rvest::html_attr("href")

  data_urls <- dom |>
    grep(".xls$|.xlsx$|.csv$|.ods$|.geojson$|.shp$", x = _, value = TRUE) |>
    tibble::as_tibble_col(column_name = "evidence")
}
