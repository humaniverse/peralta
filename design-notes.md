# Design Notes
(file to be deleted)

## Idea (user interface)
peralta should be simple. You define a list of `suspects` (URL's) you would
like to track and then `peralta` informs you if there have been any updates.
Don't let the data get away!

## How peralta does his job (back end)
Everytime you call on him, he `investigates` the suspects, and stores any
`evidence` he can find.

## Principles
1. Users should be exposed to two (groups of) functions:
 - one to add/delete/view urls from a list
 - one to detect if there have been any updated datasets from their urls list.
   The output of this should be in a format that can be piped into over R code
   (e.g., .rds file).

2. Records of datasets should be stored locally on disc. The file should be a
.rds file as it is lightweight and fast. The records should be stored in a
dataframe object so they are easily editable. Each time an investigation is run
(e.g., data is scraped), a new row should be appended to the dataframe object.
This row should contain a timestamp, the list of files, and a diff showing the
difference from the previous run. There is no need to delete previous records
each time an investigation is run. The dataframe will be very small in size, and
short of being run millions of times, will not be a storage issue. If the diff
shows there has been no updates, then it should print this to the user, else it
should print a list of updates to the console. These urls can then be easily
accessed via the .rds object if required (perhaps a function can be written
such as `load_evidence()`, but it doesn't seem necessary?). How should all
the different updates to each url be handled? It could be a separate row per
website, with a URL column identifier. Could it instead be a nested dataframe?
Sould a function be written that allows you to print the latest known updates
in case you forget to copy the output? What happens if you run the function
twice on the trot? Does it execute twice with a unieque timestamp (by second)
or does it tell you that you have already run the function (the fromer!).

3. The list of urls should be easily editable / human friendly. No command line
interfaces or terminal editors necessary. .csv file? .rds file + dplyr? The 
list of suspects (URL's) should be kept separate from the evidence dataframe.

## Implementation
1. Download the peralta R package
2. Create a new R project/dir (all files are stored relative to this project,
   not relative to root/home directories). This means the website tracking can
   be ported between colleagues/machines, with history kept in git.
3. Create a list of suspects (URL's)
4. Run peralta()
5. Re-run peralta() as required.

## Ideas
1. Store list of files to pass into regex separately. Write some code (e.g.,
using `paste()` or glue) that programmatically generates the correct regex.