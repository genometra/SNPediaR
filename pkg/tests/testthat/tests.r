##tests.r
##2015-10-03 dmontaner@genometra.com
##testing getPages

context ("Testing function getPages")

test_that ("get pages", {
    pg <- getPages (titles = "Rs1234")
    id <- unlist (strsplit (pg[[1]], split = '\n'))[2]
    expect_equal (id, "|rsid=1234")
})

################################################################################

context ("Testing function getCategoryElements")

test_that ("get category elements", {
    cat <- getCategoryElements (category = "Is_a_medical_condition")
    expect_match (cat, "cancer", ignore.case = TRUE, all = FALSE)
})

################################################################################

context ("Testing function extractTags")

test_that ("extract tags", {
    
    x <- "{{Rsnum\n|rsid=1234\n|Gene=FAKE1\n|Chromosome=3\n..."
    es <- c (rsid = "1234", Gene = "FAKE1", Chromosome = "3")
    
    ex <- extractTags (x, tags = c ("rsid", "Gene", "Chromosome"))
    
    expect_equal (ex, es)
})
