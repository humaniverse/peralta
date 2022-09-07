scrape_politely <- function(url) {
  if (!is.character(url)) {
    stop("url must be a string.")
  }

  html <-
    polite::bow(url) |>
    polite::scrape()

  return(html)
}
