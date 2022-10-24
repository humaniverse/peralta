peralta <- function() {
  if (file.exists("suspects.rds")) {
    suspect_list <- readRDS("suspects.rds")
  } else {
    stop("A list of suspects could not be found. Add suspects with `suspects_add()`.")
  }

  # Step 1 - load existing evidence dataframe
  if (file.exists("evidence.rds")) {
    evidence <- readRDS("evidence.rds")
  } else {
    # print some kind of message informing user this is the first time they have
    # checked for evidence on their suspects so no diffs will be returned.
  }

  # Step 2 - create new evidence dataframe
  suspect_list |> 
    dplyr::mutate(timestamp = Sys.time()) |> 
    dplyr::mutate(evidence = lapply(suspect, investigate_fake, status = "unchanged"))



  # 3. Print diff to console (e.g., updates or lack thereof). Use the pillar
  #    package. Additions in Green. Removals in red. No change in black text.
}
library(tidyverse)

suspect_list <- readRDS("suspects.rds")

time_1 <- suspect_list |>
  dplyr::mutate(timestamp = Sys.time()) |>
  dplyr::mutate(evidence = lapply(suspect, investigate_fake, status = "base")) |> 
  unnest(evidence)

time_2 <- suspect_list |>
  dplyr::mutate(timestamp = Sys.time()) |>
  dplyr::mutate(evidence = lapply(suspect, investigate_fake, status = "update")) |> 
  unnest(evidence)

# Added
dataset_added <- dplyr::anti_join(time_2, time_1, by = c("suspect", "evidence")) |> 
  pull(evidence)
# Removed
dataset_removed <- dplyr::anti_join(time_1, time_2, by = c("suspect", "evidence")) |> 
  pull(evidence)

time_2
