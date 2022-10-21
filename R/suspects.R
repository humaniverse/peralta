#' Generate a list of suspects
suspects_create <- function(suspects = NULL) {
  # Check args
  stopifnot("`suspects` must be a character." = is.character(suspects))
  stopifnot("`suspects` must be of type vector." = is.vector(suspects))

  # Only one list of suspects is allowed per project, recursively check for
  # lists in project
  if(file.exists("suspects.rds")){
    stop("
    A list of suspects already exists in this working directory.
    Each project can only have one list.")
  }

  # Create suspects list
  if(is.null(suspects)){
    suspect_list <- tibble::tibble(suspects = character()) 
  } else {
    suspect_list <- tibble::tibble(suspects = suspects)
  }

  saveRDS(suspect_list, file = "suspects.rds")
}

suspects_add <- function(suspects, suspects_new){

}

suspects_remove <- function(suspects, suspects_old) {

}

suspects_view <- function(suspects, n) {
  print(suspects, n = n)
}

rbind(suspect_list, suspects = c("hello"))
