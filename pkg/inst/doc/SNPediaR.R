## ----style, echo = FALSE, results = 'asis'-------------------------------
BiocStyle::markdown()

## ------------------------------------------------------------------------
library (SNPediaR)
sal <- getPages (titles = "Rs1121980")
sal

## ---- fig.show='hold'----------------------------------------------------
plot(1:10)
plot(10:1)

## ---- echo=FALSE, results='asis'-----------------------------------------
knitr::kable(head(mtcars, 10))

