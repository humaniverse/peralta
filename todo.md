## To Do:

### evidence.R
- find a method to store the `evidence_*` outputs into the evidence
  dataframe. That way, `report_last()` can recreate a report using the last
  stored values so the latest report can be retrieved at any point. Can the
  three required `evidence_*` args from `report_last()` be wrapped in a list and
  then stored in the evidence dataframe in a nested data structure? The unnested
  `evidence` column could be nested once again. This would also improve the 
  `evidence()` printing function. 

### General
- add (or replace printing functions) with functions to export the evidence and
  suspects dataframes into the user environment so they can be piped into other
  purposes?