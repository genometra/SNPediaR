## extractTags.R
## 2015-08-05 dmontaner@genometra.com jpanadero@genometra.com
## functions to parse wiki text form SNPedia

##' Extract information form downloaded SNPedia pages.
##'
##' SNPedia pages usually have a table in the right hand side which summarizes
##' most relevant information in the page.
##' This functions help extracting this kind of information for the given tags
##' or rows.
##'
##' \code{extractTags} is a general purpose function aimed to work at any page. 
##' \code{extractSnpTags} calls \code{extractTags} with a set of predefined
##' tags suitable for SNP pages.
##' \code{extractGenotypeTags} does the same for genotype pages.
##' 
##' This functions take a character vector of length one
##' but return a vector with as many values as the tag list provided.
##' They are devised to be used with \code{sapply} functions.
##' 
##' Notice that in SNPedia
##' not all information presented in the HTML table
##' is available in the JSON format retrieved by the R package.
##' Risk information for instance needs to be collected from the genotype pages
##' as it is not available in the JSON version of the SNP pages.
##'
##' @param x a wiki page (single character vector)
##' @param tags character vector of tags (row names) to be collected.
##'
##' @usage
##' extractTags (x, tags)
##' extractSnpTags (x, tags)
##' extractGenotypeTags (x, tags)
##'
##' @return A character vector with the value of each of the tags if available
##' in the page and NA otherwise.
##'
##' @examples
##' res <- getPages (c ("Rs1234", "Rs53576"))
##' t (sapply (res, extractSnpTags))
##'
##' extractTags (res[[1]], tags = c("rsid", "Chromosome", "position"))
##'
##' res <- getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"))
##' t (sapply (res, extractGenotypeTags))
##'
##' getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"),
##'           wikiParseFunction = extractGenotypeTags)
##'
##' getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"),
##'           wikiParseFunction = extractGenotypeTags,
##'           tags = c("rsid", "allele1", "allele2"))
##' 
##' @aliases extractSnpTags extractGenotypeTags
##' @seealso getPages, getCategoryElements
##' 
##' @import RCurl jsonlite
##' 
##' @export
extractTags <- function (x, tags) {
    
    ##format tags
    N <- length (tags)
    tagsP <- paste0 ("\\|", tags, "=")
    
    ## split lines
    x <- unlist (strsplit (x, "\n"))
    
    res <- rep (NA, times = N)
    names (res) <- tags
    for (i in 1:N) {
        s <- sub (tagsP[i], "", grep (tagsP[i], x, value = TRUE))
        suppressWarnings (try (res[i] <- s, silent = TRUE))
        ## I am not sure this is the best way
    }
    ## sometimes the end of the _table_ "}}"is after the tag instead of being in a newline
    ## see example: http://www.snpedia.com/index.php/I5012760
    res <- sub ("}}$", "", res)
    ## output
    return (res)
}


##' @export
extractSnpTags <- function (x, tags) {
    if (missing (tags)) {
        tags <- c ("rsid", "Chromosome", "position", "Orientation", "GMAF",
                   "Assembly", "GenomeBuild", "dbSNPBuild", "geno1", "geno2",
                   "geno3", "StabilizedOrientation", "Status", "Merged",
                   "Gene", "Gene_s", "Summary")
        ## "Gene", "Gene_s" sometimes are duplicated just the first one is used
        ## "alias" is created form rsid in the web site
    }
    res <- extractTags (x=x, tags=tags)
    ## output
    return (res)
}


##' @export
extractGenotypeTags <- function (x, tags) {
    if (missing (tags)) {
        tags <- c ("rsid", "allele1", "allele2", "repute",
                   "magnitude", "summary")
    }
    res <- extractTags (x=x, tags=tags)
    ## output
    return (res)
}
