# This function is the interface to the package. All other functions are hidden
# from the user and are util functions.

# This function will work by:
#   - Generating a log (tibble) of changes to web pages. The user will specifiy
#     a path and if a file does not already exist at a given path, an empty log
#     will be created (else they can overwrite if they choose [separate arg])
#   - accepting a vector/list of urls
#   - If the url the in vector of urls is not in the log table, the detect-datasets
#     fun will write a list (if any) of files alongside that element in the log.
#     If the url already exists, the detect-datasets fun will write a (new) list
#     of urls to the log. These will then be compared with the old list, and any
#     changes highlighted to the user. The new list will then overwrite the
#     one, ready for the function to be run again and detect any new changes.
#     Perhaps several days/attempts of logs should be kept. Should they be
#     timestamped and deleted after a certain threshold/number of tries?

# Over time, it would be good to add other means for storing a log, other than
# using the local disk. E.g., can AWS/SharePoint/etc. be used. And can they can
# be automated/called on a schedule.
detective <- function() {

}