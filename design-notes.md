# Design Notes
(file to be deleted)

## Idea
peralata shoudld be simple. You define a list of suspects (URL's) you would like
to track for updates, and peralata detects if there have been any changes since
you last checked.

## Principles
1. Users should be exposed to three functions:
 - one to add\delete urls from a list
 - one to view which urls are currently on the list
 - one to detect if there have been any updated datasets from their urls list.
   The output of this should be in a format that can be piped into over R code
   (e.g., a dataframe object or .csv file).

2. Record of datasets should be stored locally on disc. Ideally in a sqlite or
plain text file. This file should not be easily editable to prevent corruption.
Can git be used as the means to control for diffs?

3. The list of urls should be easily editable / human friendly. No command line
interfaces or terminal editors necessary.

## Implementation
1. Download the peralta R package
2. Create a new R project/dir (all files are stored relative to this project,
   not relative to root/home directories). This means the website tracking can
   be ported between colleagues/machines, with history kept in git.
3. Create a list of suspects (URL's)
4. Run peralta()
5. Re-run peralta() as required.