scrape <- function(url) {
  stopifnot("`url` must be a string." = is.character(url))

  html <-
    polite::bow(url) |>
    polite::scrape()

  return(html)
}

extract <- function(url) {
  links <- scrape(url) |>
    rvest::html_elements("a") |>
    rvest::html_attr("href") |>
    grep(".xls$|.xlsx$|.csv$|.ods$|.geojson$|.shp$", x = _, value = TRUE)

  return(links)
}