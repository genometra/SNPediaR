#! /usr/bin/Rscript --vanilla

## make.r
## 2016-06-03 david.montaner@gmail.com
## my make file for developing R packages

date ()
rm (list = ls ())
R.version.string ##"R version 3.2.1 (2015-06-18)"
library (devtools); packageDescription ("devtools", fields = "Version") #"1.11.1"
library (knitr); packageDescription ("knitr", fields = "Version") #"1.13"
#help (package = devtools)

################################################################################


## Clean up some directories. Usually not needed.
unlink ("local", recursive = TRUE)
unlink ("check", recursive = TRUE)
##unlink ("pkg/man", recursive = TRUE)  ## BE CAREFUL HERE !!!
##unlink ("pkg/NAMESPACE")              ## BE CAREFUL HERE !!!

### Create directories
dir.create ("local") ## to install the library locally
dir.create ("check") ## to keep the output of the check command

################################################################################


### Build documentation and NAMESPACE
document (pkg = "pkg")

################################################################################


### FULL CHECK
check (pkg = "pkg", check_dir = "check")

## ### First (quick) CHECK of the library
## see how to avoid testing here ???
## check (pkg = "pkg",
##        document = FALSE,      ## document: if ‘TRUE’ (the default), will update and check documentation before running formal check.
##        check_dir = "check",   ## check_dir: the directory in which the package is checked
##        vignettes = FALSE,                           ## do not run vignette code ............ when BUILDING
##        args = c ("--no-examples", "--no-vignettes") ## do not run vignette code and examples when CHECKING -> args: Additional arguments passed to ‘R CMD check’
##        )

## ## Examples: run separately from check
## run_examples (pkg = "pkg")

## ### Test
## test (pkg = "pkg")


################################################################################


### Vignettes
build_vignettes (pkg = "pkg")

## md format for Github
knit (input = "pkg/vignettes/SNPediaR.Rmd")
li <- readLines ("SNPediaR.md")
li <- li[-(1:which (li == "</style>"))]
writeLines (li, "SNPediaR.md")
##system ("pandoc -f markdown -t html -o SNPediaR.html SNPediaR.md")

################################################################################


### Local Installation
install.packages ("pkg", lib = "local", repos = NULL, INSTALL_opts = "--html")

################################################################################


### Build the package
build (pkg = "pkg", manual = TRUE, vignettes = TRUE)


###EXIT
warnings ()
sessionInfo ()
q ("no")
