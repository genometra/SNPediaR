## getPages.R
## 2015-08-05 dmontaner@cipf.es jpanadero@genometra.com
## function to download a list of given pages

##' Download SNPedia pages
##'
##' A function to download the (wiki) text content of a list of SNPedia pages.
##'
##' JSON format is parsed to extract the wiki text returned by the function.
##' 
##' If the \code{wikiParseFunction} parameter is provided,
##' parsing of the pages is done internally once each batch of pages
##' is downloaded.
##'
##' Pages do not need to be of the same class...
##' but users may be aware of the type of pages they are queering,
##' moreover when using their own \code{wikiParseFunction}.
##'
##' Parameters \code{baseURL}, \code{format} and \code{query}
##' are not intended for end users.
##' 
##' @param titles Titles of the pages to be downloaded.
##' @param verbose If TRUE some messages are provided.
##' @param wikiParseFunction Function to be used to parse the wiki code
##' at downloading time.
##' Default is \code{identity} so the raw wiki text is provided.
##' @param limit The maximum number of items to be queried at a time.
##' @param baseURL SNPedia boots URL.
##' @param format Downloading format. Currently just JSON is available.
##' @param query The query to be iterated.
##' @param \dots any parameter to be pasted to the \code{wikiParseFunction}.
##'
##' @return A list containing the wiki content of the required pages
##' or the formatted objects returned by the \code{wikiParseFunction}
##' applied to each page.
##' 
##' @examples 
##' res <- getPages (titles = "Rs1234")
##' res
##'
##' res <- getPages (titles = c ("Rs1234", "Rs1234(A;A)", "Rs1234(A;C)"))
##' res
##' 
##' myfun <- function (x) substring (x, 1, 5)
##' lapply (res, myfun)
##'
##' res <- getPages (titles = c ("Rs1234", "Rs1234(A;A)", "Rs1234(A;C)"),
##' wikiParseFunction = myfun)
##' res
##'
##' @seealso extractTags, getCategoryElements
##' 
##' @import RCurl jsonlite
##' 
##' @export
getPages <- function (titles,
                      verbose = TRUE,
                      limit = 50,
                      wikiParseFunction = identity,
                      baseURL,
                      format,
                      query,
                      ...
                      ) {

    ## default URL parameters
    if (missing (baseURL)) baseURL <- "http://bots.snpedia.com/api.php"
    if (missing (format))  format  <- "format=json"
    if (missing (query))   query   <- "action=query&prop=revisions&rvprop=content&titles="
                 
    ## URL
    baseURL <- paste0 (baseURL, "?", format, "&", query)
    
    ## counters
    Np <- length (titles) ## number of pages
    Cp <- 0               ## downloaded (accumulated) pages
    
    ## format titles
    titles <- curlEscape (titles)  ## white spaces to %20 Suitable for URLs
    n.batches <- 1 + length (titles) %/% limit
    suppressWarnings (titles <- split (titles, 1:n.batches))
    titles <- sapply (titles, paste, collapse = "|")
    
    ## loop
    res <- list ()
    for (tit in titles) {
        pagesURL <- paste0 (baseURL, tit)
        if (verbose) {
            Cp <- Cp + limit
            cat ("Downloading", min (Cp, Np), "of", Np, "pages ...",
                 pagesURL, fill = TRUE)
        }
        ## get URL
        datos <- getURL (pagesURL)

        ## parsing some strange characters
        datos <- gsub ("\\n", "\\\\n", datos)  ## Some funny line ends broke the json
        datos <- gsub ("\\t", "\\\\t", datos)  ## Some funny tabs
        datos <- gsub ("\\\\\\\\x", "~x", datos)  ## Sometimes \\\\x appears (has to be doubled in R)
        datos <- gsub ("\\\\x",     "~x", datos)  ## Sometimes \\x   appears  (see for instance Rs9530)
        datos <- gsub ("\\| *",  "\\|"  , datos)  ## white after pipe
        datos <- gsub (" *= *",  "="    , datos)  ## white around equal
        
        ## json
        ##print (datos)
        datos <- fromJSON (datos)
        datos <- datos[["query"]][["pages"]]
        ## list
        nombres <- sapply (datos, function (x) x[["title"]])
        datos <- lapply (datos, function (x) x[["revisions"]][["*"]])
        names (datos) <- nombres
        ## parsing function
        datos <- lapply (datos, wikiParseFunction, ...)
        ## store
        res <- c (res, datos)
    }
    return (res)
}
