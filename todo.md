## To Do:

- The peralta function needs refactoring. New evidence should *first* be stored
  in the evidence dataframe and then the report should be generated. This means
  a `report_last()` function can be written which generates a report both from
  within `peralta()` and can be called separately should be user want to view
  the last report.
- Should `peralta()` even exist. Would it be better to rename/refactor
  everything into `evidence()` functions to reduce names/complications?