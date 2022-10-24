#' Print the evidence
evidence <- function(n = 20) {
  evidence <- readRDS("evidence.rds")
  print(evidence, n = n)
}
