#' Add suspects to the list
suspects_add <- function(suspects = NULL) {
  stopifnot("At least one suspect must be added to the list" = length(suspects) >= 1)
  stopifnot("`suspects` must be a character." = is.character(suspects))
  stopifnot("`suspects` must be of type vector." = is.vector(suspects))
  stopifnot(
    "`suspect` is not a valid URL. Ensure it starts with 'http[s]:'" = grepl(
      pattern = "http[s]?://(?:[a-zA-Z]|[0-9]|[$-_@.&+]|[!*\\(\\),]|(?:%[0-9a-fA-F][0-9a-fA-F]))+",
      x = suspects
    )
  )

  if (file.exists("suspects.rds")) {
    suspect_list <- readRDS("suspects.rds")
  } else {
    suspect_list <- tibble::tibble(suspect = character())
  }

  suspect_list_new <- tibble::tibble(suspect = suspects)

  suspect_list <- dplyr::bind_rows(
    suspect_list,
    suspect_list_new
  ) |>
    dplyr::distinct()

  saveRDS(suspect_list, file = "suspects.rds")
}

#' Remove suspects from the list
suspects_remove <- function(suspects) {
  stopifnot("At least one suspect must be added to the list" = length(suspects) >= 1)
  stopifnot("`suspects` must be a character." = is.character(suspects))
  stopifnot("`suspects` must be of type vector." = is.vector(suspects))

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

  if (length(suspect_list$suspect) == 0) {
    stop("The suspect list is already empty!")
  }

  suspect_list <- suspect_list |>
    dplyr::filter(!(suspect %in% suspects))

  saveRDS(suspect_list, file = "suspects.rds")
}

#' Print the suspect list
suspects <- function(n = "Inf") {
  suspect_list <- readRDS("suspects.rds")
  print(suspect_list, n = n)
}
