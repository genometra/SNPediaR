## getCategoryElements.R
## 2015-08-05 dmontaner@cipf.es jpanadero@genometra.com
## function to get all elements form a given category

##' Get all elements of a given category
##'
##' A function to get all page names of SNPedia tagged under the indicated
##' category.
##'
##' A list of all available categories may be found at:
##' 
##' \url{http://www.snpedia.com/index.php/Special:Categories}
##'
##' Most used categories are:
##' \itemize{
##' \item Is_a_medical_condition
##' \item Is_a_medical_condition
##' \item Is_a_medicine
##' \item Is_a_topic
##' \item Is_a_snp
##' \item In_dbSNP
##' \item Is_a_genotype
##' }
##' 
##' Some template pages are included in their corresponding category.
##' By default those will be removed.
##' Set includeTemplates to TRUE is you want to keep them.
##'
##' Parameters other than category and verbose are not intended for
##' standard users. 
##'
##' @param category The category to be used. Just one at a time.
##' @param verbose If TRUE some messages are provided.
##' @param includeTemplates If TRUE page templates are kept in the output.
##' @param limit The maximum number of items to be queried at a time.
##' @param baseURL SNPedia boots URL.
##' @param format Downloading format. Currently just JSON is available.
##' @param query The query to be iterated.
##' @param continue To be used in multi-page queries.
##'
## @usage getCategoryElements (category, verbose = FALSE, ...)
##'
##' @return A character vector containing the names of the pages under
##' the required category.
##' 
##' @examples
##' res <- getCategoryElements (category = "Is_a_medical_condition")
##' head (res)
##' 
##' \dontrun{
##' res <- getCategoryElements (category = "Is_a_snp")
##' }
##'
##' @seealso getPages, extractTags
##' 
##' @import RCurl jsonlite
##' 
##' @export
getCategoryElements <- function (category,
                                 verbose = FALSE,
                                 includeTemplates = FALSE,
                                 limit,
                                 baseURL,
                                 format,
                                 query,
                                 continue
                                 ) {

    ## default URL parameters
    if (missing (limit))     limit    <- "max"
    if (missing (baseURL))   baseURL  <- "http://bots.snpedia.com/api.php"
    if (missing (format))    format   <- "format=json"
    if (missing (query))     query    <- "action=query&list=categorymembers&cmlimit=___LIMIT___&cmprop=title&cmtitle=Category:___CATEGORY___"
    if (missing (continue))  continue <- "cmcontinue="
    
    ## replace query parameters
    query <- sub ("___LIMIT___",       limit, query)
    query <- sub ("___CATEGORY___", category, query)
    
    ## base url
    baseURL <- paste0 (baseURL, "?", format, "&", query, "&", continue)
    
    ## iterate across pages 
    res <- NULL
    cont <- ""
    while (!is.null (cont)) {
        continueURL <- paste0 (baseURL, cont)
        if (verbose) {
            cat ("Downloading...", continueURL, fill = TRUE)
        }
        lineas <- getURL (continueURL)
        lineas <- gsub ("\\n", "\\\\n", lineas)  ##Some funny line ends crash the json 
        js <- fromJSON (lineas)
        res <- rbind (js[["query"]][["categorymembers"]], res)
        ##cont <- js[["query-continue"]][["categorymembers"]][["cmcontinue"]]
        cont <- js[["continue"]][["cmcontinue"]]
    }

    if (!includeTemplates) {
        if (verbose) {
            cat ("Template pages not included", fill = TRUE)
        }
        touse <- res[,"ns"] == 0
        res <- res[touse, "title"]
    }
    
    ## output
    return (res)
}
