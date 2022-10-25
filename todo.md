## To Do:

### README (to add)
- infographics like mortyr
- why place suspects and evidence in the home dir? Peralta is messy and throws
  stuff in a place easy to find. You can be more organised if you want (supply
  file path)
- Create a new R project/dir (all files are stored relative to this project,
  not relative to root/home directories). This means the website tracking can
  be ported between colleagues/machines, with history kept in git. 1. Create a 
  list of suspects (URL's), 2. Run peralta() as required!

### peralta.R
- replace `print()` statement the first time the report is run with `cli`
  alternative

### evidence.R
- find a method to store the `evidence_*` outputs into the evidence
  dataframe. That way, `report_last()` can recreate a report using the last
  stored values so the latest report can be retrieved at any point. Can the
  three required `evidence_*` args from `report_last()` be wrapped in a list and
  then stored in the evidence dataframe in a nested data structure? The unnested
  `evidence` column could be nested once again. This would also improve the 
  `evidence()` printing function. 

### General
- refactor code to remove dependencies. Does this include polite? Would it not
  be better to rely just on httr2/rvest (or just rvest), and manage rate
  limiting / robots.txt manually?
- Add optional file path for suspects and evidence
- add (or replace printing functions) with functions to export the evidence and
  suspects dataframes into the user environment so they can be piped into other
  purposes?