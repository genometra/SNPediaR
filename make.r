## make.r
## 2015-08-06 david.montaner@gmail.com
## my make file for developing R packages

### Some nice links
## http://hilaryparker.com/2014/04/29/writing-an-r-package-from-scratch/
## http://r-pkgs.had.co.nz/namespace.html#imports
## http://master.bioconductor.org/packages/release/bioc/vignettes/BiocStyle/inst/doc/HtmlStyle.html

date ()
Sys.info ()[c("nodename", "user")]
commandArgs ()
rm (list = ls ())
R.version.string ##"R version 3.2.1 (2015-06-18)"
## library (roxygen2);  packageDescription ("roxygen2",  fields = "Version") #"4.1.1"
## library (rmarkdown); packageDescription ("rmarkdown", fields = "Version") #"0.7"
## library (knitr);     packageDescription ("knitr",     fields = "Version") #"1.10.5"
library (devtools); packageDescription ("devtools", fields = "Version") #"1.8.0"
#help (package = devtools)



################################################################################
### INITIALIZE THE FOLDER STRUCTURE OF THE LIBRARY
################################################################################

## ## comment this section after first usage...

## ## Initialize the actual R source folder and the DESCRIPTION file
## ## ‘"cre"’ (Creator) Use for the package maintainer.
## create ("pkg", rstudio = FALSE,
##         description = list (
##             "Authors@R" = 'person ("David", "Montaner", email = "david.montaner@gmail.com", role = c ("aut", "cre"))',
##             ##"Authors@R" = 'c (person ("David", "Montaner", email = "david.montaner@gmail.com", role = c ("aut", "cre")),
##             ##                  person ("Someone", "Else", email = "se@gmail.com", role = c ("aut")))',
##             License = "GPL-2",
##             URL = "http://www.dmontaner.com/, https://github.com/dmontaner/PKG",
##             BugReports = "https://github.com/dmontaner/PKG/issues",
##             Suggests = "BiocStyle" ## just for Bioconductor style vignettes
##             ))


## ### Initialize Vignettes
## ## Adds needed packages to ‘DESCRIPTION’, and creates draft vignette
## ## in ‘vignettes/’. It adds ‘inst/doc’ to ‘.gitignore’ so you don't
## ## accidentally check in the built vignettes.
## use_vignette (name = "my_vignette", pkg = "pkg")

## ## Bioconductor style vignettes
## .file <- "pkg/vignettes/my_vignette.Rmd"
## .li <- readLines (.file)
## ## html
## .li <- sub ("output: rmarkdown::html_vignette", "output:\n  BiocStyle::html_document:\n    toc: yes\n    fig_width: 5\n    fig_height: 5", .li)  ## keep all spaces !!!
## ## pdf
## #.li <- sub ("output: rmarkdown::html_vignette", "output:\n  BiocStyle::pdf_document:\n    toc: yes\n    fig_width: 4\n    fig_height: 4.5", .li)
## ##
## ## not sure if this is still needed
## ## see http://master.bioconductor.org/packages/release/bioc/vignettes/BiocStyle/inst/doc/HtmlStyle.html
## .li[which (.li == "---")[2]] <- "---\n\n```{r style, echo = FALSE, results = 'asis'}\nBiocStyle::markdown()\n```"
## ##
## writeLines (.li, con = .file)



################################################################################
### PACKAGE DEVELOPMENT
################################################################################

## Clean up directories. Usually not needed.
unlink ("local", recursive = TRUE); dir.create ("local")  ## to install the library locally
unlink ("check", recursive = TRUE); dir.create ("check")  ## to keep the output of the check command
unlink ("pkg/man", recursive = TRUE)  ## BE CAREFUL HERE !!!
##unlink ("pkg/NAMESPACE")              ## BE CAREFUL HERE !!!


################################################################################

### Build documentation and NAMESPACE
document (pkg = "pkg")

################################################################################

### First (quick) Check of the library
check (pkg = "pkg",
       check_dir = "check", ## dir to store the output
       cleanup = FALSE,     ## do not remove the output directory
       vignettes = FALSE,                            ## do not run vignette code when BUILDING
       args = c ("--no-examples", "--no-vignettes")) ## do not run vignette code and examples when CHECKING

## cleanup: if ‘TRUE’ the check directory is removed if the check is successful
## document: if ‘TRUE’ (the default), will update and check documentation before running formal check. FALSE NOT WORKING???
## args,build_args: An optional character vector of additional command line arguments to be passed to ‘R CMD check’/‘R CMD build’/‘R CMD INSTALL’.
##
##full check
#check (pkg = "pkg", document = TRUE, check_dir = "check", cleanup = FALSE)
## do not run examples and vignettes
#check (pkg = "pkg", document = TRUE, check_dir = "check", cleanup = FALSE, args = "--no-examples")
## do not run examples and vignettes
## args = c ("--no-examples", "--no-vignettes"), build_args = "--no-build-vignettess")

################################################################################

### Local Installation
with_libpaths ("local", install ("pkg", lib = "local", args = "--html"))

## and this should work now
help (package = SNPediaR)
## browseVignettes ("SNPediaR")
## vignette ("my_vignette", package = "SNPediaR")

example (getCategoryElements)
example (getPages)
example (getPages)

################################################################################


## EXAMPLES
run_examples (pkg = "pkg") ## run examples separately from check

### Vignettes
build_vignettes (pkg = "pkg")

##re-run local installation
#with_libpaths ("local", install ("pkg", lib = "local", args = "--html"))



################################################################################
### FINAL STEPS
################################################################################X

## Full chek
check (pkg = "pkg", check_dir = "check", cleanup = FALSE)

### Build the package
build (pkg = "pkg", manual = TRUE, vignettes = TRUE)

###EXIT
warnings ()
sessionInfo ()
q ("no")
