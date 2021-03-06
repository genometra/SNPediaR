% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/extractTags.R
\name{extractTags}
\alias{extractTags}
\alias{extractSnpTags}
\alias{extractGenotypeTags}
\title{Extract information form downloaded SNPedia pages.}
\usage{
extractTags (x, tags)
extractSnpTags (x, tags)
extractGenotypeTags (x, tags)
}
\arguments{
\item{x}{a wiki page (single character vector)}

\item{tags}{character vector of tags (row names) to be collected.}
}
\value{
A character vector with the value of each of the tags if available
in the page and NA otherwise.
}
\description{
SNPedia pages usually have a table in the right hand side which summarizes
most relevant information in the page.
This functions help extracting this kind of information for the given tags
or rows.
}
\details{
\code{extractTags} is a general purpose function aimed to work at any page. 
\code{extractSnpTags} calls \code{extractTags} with a set of predefined
tags suitable for SNP pages.
\code{extractGenotypeTags} does the same for genotype pages.

This functions take a character vector of length one
but return a vector with as many values as the tag list provided.
They are devised to be used with \code{sapply} functions.

Notice that in SNPedia
not all information presented in the HTML table
is available in the JSON format retrieved by the R package.
Risk information for instance needs to be collected from the genotype pages
as it is not available in the JSON version of the SNP pages.
}
\examples{
res <- getPages (c ("Rs1234", "Rs53576"))
t (sapply (res, extractSnpTags))

extractTags (res[[1]], tags = c("rsid", "Chromosome", "position"))

res <- getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"))
t (sapply (res, extractGenotypeTags))

getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"),
          wikiParseFunction = extractGenotypeTags)

getPages (c ("Rs1234(A;A)", "Rs1234(A;C)","Rs1234(C;C)"),
          wikiParseFunction = extractGenotypeTags,
          tags = c("rsid", "allele1", "allele2"))

}
\seealso{
getPages, getCategoryElements
}
