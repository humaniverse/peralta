log_create <- function(path, urls) {
  if (!fs::dir_exists(path)) {
    stop("The path is not a valid directory")
  }

  if (fs::file_exists(paste0(path, "/peralta-log.R"))) {
    stop("A log file already exists at this path.")
  }

  fs::file_create(paste0(path, "/peralta-log.R"))
}

log_update <- function(path, urls) {

  # Check if file path is valid

  # Check if log exists, if not, stop with message indicating a log needs to be
  # created with log_create()

  # For each url, check if it already exists in the log. If it does, print
  # message indicating that the highlighted urls have not been appended as
  # they already exist. If it doesn't, append and scrape/extract data sets
}
