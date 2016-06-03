## ----style, echo = FALSE, results = 'asis'-------------------------------
BiocStyle::markdown()

## ------------------------------------------------------------------------
library (SNPediaR)
pg <- getPages (titles = "Rs53576")
pg

## ------------------------------------------------------------------------
pgs <- getPages (titles = c ("Rs53576(A;A)", "Rs53576(A;G)", "Rs53576(G;G)"))
pgs

## ------------------------------------------------------------------------
extractSnpTags (pg$Rs53576)

## ------------------------------------------------------------------------
sapply (pgs, extractGenotypeTags)

## ------------------------------------------------------------------------
getPages (titles = c ("Rs53576(A;A)", "Rs53576(A;G)", "Rs53576(G;G)"),
          wikiParseFunction = extractGenotypeTags,
          tags = c ("allele1", "allele2", "magnitude"))

## ------------------------------------------------------------------------
findPMID <- function (x) {
    x <- unlist (strsplit (x, split = "\n"))
    x <- grep ("PMID=", x, value = TRUE)
    x
}

## ------------------------------------------------------------------------
getPages (titles = c ("Rs53576", "Rs1815739"),
          wikiParseFunction = findPMID)


## ------------------------------------------------------------------------
res <- getCategoryElements (category = "Is_a_medical_condition")
head (res)

## ------------------------------------------------------------------------
grep ('cancer', res, value = TRUE)

## ------------------------------------------------------------------------
sessionInfo ()

