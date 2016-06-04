

About
================================================================================

[SNPedia](http://www.snpedia.com)
is a curated database containing information about thousands of
[SNPs](https://en.wikipedia.org/wiki/Single-nucleotide_polymorphism).
Related diseases,
genotypes and
references to relevant scientific publications are available trough their web.
This site is powered by [MediaWiki](https://www.mediawiki.org) and information about each SNP is written in the corresponding wiki page.

The `SNPediaR` library provides tools for automatically search and download such pages.
It also implements few functions to scrap some relevant information from the downloaded wiki text,
and allows users to extend such parsing functionality.



Downloading pages
================================================================================

For a known set of pages,
the function `getPages` downloads the corresponding wiki content using the 
MediaWiki web [API](https://www.mediawiki.org/wiki/API:Query).

We can for instance download the page
[Rs53576](http://www.snpedia.com/index.php/Rs53576), corresponding to the __rs53576__ SNP
doing:


```r
library (SNPediaR)
pg <- getPages (titles = "Rs53576")
pg
```

```
## $Rs53576
## [1] "{{Rsnum\n|rsid=53576\n|Gene=OXTR\n|Chromosome=3\n|position=8762685\n|Orientation=plus\n|GMAF=0.4128\n|Assembly=GRCh38\n|GenomeBuild=38.1\n|dbSNPBuild=141\n|Summary=influences social behavior and personality\n|geno1=(A;A)\n|geno2=(A;G)\n|geno3=(G;G)\n|Gene_s=OXTR\n|StabilizedOrientation=plus\n}}rs53576 is a silent G to A change in the oxytocin receptor (OXTR) gene. Studies have demonstrated that individuals with the G allele are more empathetic, feel less lonely, employ more sensitive parenting techniques, and have lower rates of autism (discussed in {{PMID|20724662|OA=1\n}})\n\nThe blog [http://blogs.discovermagazine.com/notrocketscience/2010/08/16/genes-and-culture-oxtr-gene-influences-social-behaviour-differently-in-americans-and-koreans/ Not Exactly Rocket Science] discusses that Americans with (G;G) tend to be more sensitive parents, more empathetic and less lonely than those with an &#8216;A&#8217;. In a Korean population people with (G;G) were less likely to seek support from their peers. \n\n{{PMID|20724662|OA=1\n}} Culture, distress, and oxytocin receptor polymorphism (OXTR) interact to influence emotional support seeking.\n\n{{PMID|19934046|OA=1\n}} Oxytocin receptor genetic variation relates to empathy and stress reactivity in humans. In brief, people with the G;G genotype were better able to discern the emotional state of others than those who carried the A-allele ([http://genes2brains2mind2me.com/2009/11/24/look-deeply-into-my-eyes-and-let-me-see-your-genes/ blog] summary found here).  The study encompassed 192 participants of both sexes and mixed ethnicities. The study subjects underwent a number of tests to determine their level of empathy and stress reactivity. They found that G;G individuals performed significantly better on the behavioral measure of empathy and were 22.7% less likely to make a mistake on the \"Reading the Mind in the Eyes Test\" (RMET) (a behavioural measure of empathic accuracy) than A;A/A;G individuals (P=0.005). Similarly, G;G individuals reported higher levels of dispositional empathy than A;A/A;G individuals: mean (SE)=3.69 (0.06) and 3.53 (0.04) for G;G and A;A/A;G, respectively (P=0.025), and were less affected by stress (as measured by their heart rates): mean (SE)=72.1 (0.54) and 78.4 (1.19) for G;G and A;A/A;G, respectively.\n\n{{PMID|19376182}} Associations between the oxytocin receptor gene (OXTR) and affect, loneliness and intelligence in normal subjects.\n\n{{PMID|19015103|OA=1\n}} This study examined the association between the OXTR gene and parenting. A total of 176 mothers of toddlers were included in the study. After controlling for marital discord, depression, and education status, rs53576 was found to significantly correlate with parenting, with the G;G genotype being associated with a significantly more sensitive parenting style than A;A or A;G genotypes. However, they concluded that the major factor influencing parenting was the maternal education level.\n\n{{PMID Auto\n|PMID=22069391\n|OA=1\n}} Forty-five female subjects (17 twin pairs and 11 twins without their sibling) were genotyped and tested for their ability to hear and understand conversations in noisy environments. Participants with the G;G genotype reported less difficulty hearing and understanding (difficulty hearing total score [Mean (SD)], 9.2 (4.2)) than participants with A;A/A;G genotypes (13.9 (3.8); p < 0.001). Even after adjusting for age, the relationship between genotype and difficulty hearing scores was still significant (p=0.003).\n\n{{PMID Auto\n|PMID=22123970\n|OA=1\n}} Two hundred three healthy German male university students (mean age 23.2 y, SD 2.9 y) were subjected to a mock interview and their saliva cortisol levels were tested before and at a number of time points after the interview. Half of the participants were told to bring a female friend as social support, whereas the other half came alone to the interview. The authors found that subjects carrying the G allele (G;G or A;G genotypes) had significantly lower cortisol responses to stress when they had social support (P < 0.01). Conversely, there were no differences in cortisol levels in subjects with the A;A genotype receiving or not receiving social support (P=0.46). Moreover, there was a trend (P=0.08) for people with the A;A genotype to display higher levels of cortisol throughout the session than G carriers (no differences between the genotypes were observed at baseline).\n\n[http://blog.23andme.com/2011/12/12/snpwatch-we-care-a-lot/ 23andMe blog] discusses the snp.\n\n[http://blogs.scientificamerican.com/scicurious-brain/2011/12/19/when-is-comfort-most-comforting-when-youve-got-a-specific-oxytocin-gene/ blogs.scientificamerican] discusses the snp.\n\n{{PMID Auto\n|PMID=20647384 \n|OA=1\n}} In this study, 345 healthy subjects were examined by multimodal neuroimaging techniques to identify structural and functional alterations in OXTR risk allele carriers and their link to temperament. The authors found that there was a significant association between the different rs53576 genotypes and grey matter volume in the hypothalamus, with the hypothalamus volume being significantly larger in G;G carriers than in A;A carriers (P=0.012). Moreover, they investigated the relationship between rs53576 and reward dependence (RD) using the Tridimensional Personality Questionnaire, and found that the G;G, G;A, and A;A genotypes were associated with the highest, intermediate, and lowest RD values, respectively (G;G vs. A;A, p=0.02; A;G vs. A;A, p=0.07). Lastly, they also demonstrated that rs53576 is associated with amygdala activation, with the A;A genotype being associated with a significant reduction in activation compared to the G;G genotype (p=0.036); and with the functional relationship between the amygdala and the hypothalamus, with A;A carrier having a significantly increased functional correlation (p=0.036). The authors concluded that there is likely a neural mechanism linking both structural and neural signalling alterations in the oxytocinergic system to individual differences in emotional reactivity and prosocial temperament.\n\n{{PMID Auto\n|PMID=17383819\n|Title=Association of the oxytocin receptor gene (OXTR) in Caucasian children and adolescents with autism.\n|OA=1\n}} This study found that there is no association between rs53576 variants and the risk of autism in Caucasian children and adolescents.\n\n{{PMID Auto\n|PMID=22084107\n|Title=Thin-slicing study of the oxytocin receptor (OXTR) gene and the evaluation and expression of the prosocial disposition\n|OA=1\n}}\n\nFollowup:\n\n{{PMID Auto\n|PMID=22499788\n|Title=Misuse of hierarchical linear models overstates the significance of a reported association between OXTR and prosociality.\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=22357335\n|Title=The association between oxytocin receptor gene polymorphism (OXTR) and trait empathy\n}}\n\n{{PMID Auto\n|PMID=22763666\n|Title=The influence of oxytocin administration on responses to infant faces and potential moderation by OXTR genotype\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=15992526\n|Title=Positive association of the oxytocin receptor gene (OXTR) with autism in the Chinese Han population.\n}}\n\n{{PMID Auto\n|PMID=18687882\n|Title=Genetic correlates of adult attachment style.\n}}\n\n{{PMID Auto\n|PMID=19515497\n|Title=Oxytocin receptor polymorphisms and adult attachment style in patients with depression.\n}}\n\n{{PMID Auto\n|PMID=20347913\n|Title=Evidence that genetic variation in the oxytocin receptor (OXTR) gene influences social cognition in ADHD.\n}}\n\n{{PMID Auto\n|PMID=20585395\n|Title=No association between oxytocin receptor (OXTR) gene polymorphisms and experimentally elicited social preferences.\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=21896752\n|Title=Oxytocin receptor gene (OXTR) is related to psychological resources.\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=22372486\n|Title=The role of oxytocin and oxytocin receptor gene variants in childhood-onset aggression.\n}}\n\n{{PMID Auto\n|PMID=22487732\n|Title=Influence of COX-2 and OXTR polymorphisms on treatment outcome in treatment resistant depression.\n}}\n\n{{PMID Auto\n|PMID=22563705\n|Title=Differential susceptibility in spillover between interparental conflict and maternal parenting practices: evidence for OXTR and 5-HTT genes.\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=22580735\n|Title=Breastfeeding and its relation to maternal sensitivity and infant attachment.\n}}\n\n{{PMID Auto\n|PMID=23089921\n|Title=Common oxytocin receptor gene polymorphisms and the risk for preterm birth\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=23284802\n|Title=Association between Oxytocin Receptor Gene Polymorphisms and Self-Rated 'Empathic Concern' in Schizophrenia\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=23470776\n|Title=Environmental stress, oxytocin receptor gene (OXTR) polymorphism, and mental health following collective stress\n}}\n\n{{PMID Auto\n|PMID=23684879\n|Title=Variant in OXTR gene and functional connectivity of the hypothalamus in normal subjects\n}}\n\n{{PMID Auto\n|PMID=24295535\n|Title=Oxytocin receptor gene variation predicts empathic concern and autonomic arousal while perceiving harm to others\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=24621832\n|Title=Oxytocin receptor gene polymorphism, perceived social support, and psychological symptoms in maltreated adolescents\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=22809402\n|Title=Associations between the oxytocin receptor gene (OXTR) and \"mind-reading\" in humans--an exploratory study.\n}}\n\n{{PMID Auto\n|PMID=22939719\n|Title=Oxytocin and catechol-O-methyltransferase receptor genotype predict the length of the first stage of labor.\n}}\n\n{{PMID Auto\n|PMID=23708061\n|Title=Neural mechanisms of oxytocin receptor gene mediating anxiety-related temperament.\n}}\n\n{{PMID Auto\n|PMID=22651577\n|Title=Oxytocin and oxytocin receptor gene polymorphisms and risk for schizophrenia: a case-control study\n}}\n\n{{PMID Auto\n|PMID=24814480\n|Title=Social cognition, face processing, and oxytocin receptor single nucleotide polymorphisms in typically developing children\n}}\n\n{{PMID Auto\n|PMID=25003328\n|Title=Social stress and the oxytocin receptor gene interact to predict antisocial behavior in an at-risk cohort\n}}\n\n{{PMID Auto\n|PMID=25001970\n|Title=Oxytocin receptor gene rs53576 polymorphism modulates oxytocin-dopamine interaction and neuroticism traits-A SPECT study\n}}\n\n{{PMID Auto\n|PMID=25564674\n|Title=Distress of ostracism: Oxytocin receptor gene polymorphism confers sensitivity to social exclusion\n}}\n\n{{PMID Auto\n|PMID=25637390\n|Title=Oxytocin receptor gene and racial ingroup bias in empathy-related brain activity\n}}\n\n{{PMID Auto\n|PMID=25680993\n|Title=Interaction between oxytocin receptor polymorphism and interdependent culture values on human empathy\n}}\n\n{{PMID Auto\n|PMID=25935637\n|Title=The association between 2D:4D ratio and cognitive empathy is contingent on a common polymorphism in the oxytocin receptor gene (OXTR rs53576)\n}}\n\n{{PMID Auto\n|PMID=24621820\n|Title=Personality, behavior and environmental features associated with OXTR genetic variants in British mothers\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=25287464\n|Title=Empathy, target distress, and neurohormone genes interact to predict aggression for others-even without provocation\n}}\n\n{{PMID Auto\n|PMID=25450139\n|Title=Preliminary evidence for the interaction of the oxytocin receptor gene (oxtr) and face processing in differentiating prenatal smoking patterns\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=26175754\n|Title=DNA methylation and single nucleotide variants in the brain-derived neurotrophic factor (BDNF) and oxytocin receptor (OXTR) genes are associated with anxiety/depression in older women\n|OA=1\n}}\n\n{{PMID Auto\n|PMID=26174935\n|Title=Oxytocin system social function impacts in children with attention-deficit/hyperactivity disorder\n}}\n\n{{PMID Auto\n|PMID=26178189\n|Title=A common oxytocin receptor gene (OXTR) polymorphism modulates intranasal oxytocin effects on the neural response to social cooperation in humans\n}}\n\n{{PMID Auto\n|PMID=26389606\n|Title=Genetic Moderation of Stability in Attachment Security From Early Childhood to Age 18 Years: A Replication Study\n}}\n\n{{PMID Auto\n|PMID=26444016\n|Title=Polymorphism of the Oxytocin Receptor Gene Modulates Behavioral and Attitudinal Trust among Men but Not Women\n|OA=1\n}}\n\n{{on chip |23andMe v2}}\n{{on chip |23andMe v3}}\n{{on chip |23andMe v4}}\n{{on chip |Ancestry v2}}"
```

We can use the same function to download several pages at a time,
for instance we can download the 3 _genotype_ pages corresponding with the same SNP: 
[Rs53576(A;A)](http://www.snpedia.com/index.php/Rs53576(A;A)), 
[Rs53576(A;G)](http://www.snpedia.com/index.php/Rs53576(A;G)) and 
[Rs53576(G;G)](http://www.snpedia.com/index.php/Rs53576(G;G))
as 


```r
pgs <- getPages (titles = c ("Rs53576(A;A)", "Rs53576(A;G)", "Rs53576(G;G)"))
pgs
```

```
## $`Rs53576(A;A)`
## [1] "{{Genotype\n|rsid=53576\n|allele1=A\n|allele2=A\n|magnitude=2.8\n|repute=Bad\n|summary=Lack of empathy?\n}}\nYou have a SNP in the oxytocin receptor which may make you less empathetic than most people.  When under stress you may have more difficulty recognizing the emotional state of others which impacts loneliness, parenting, and socializing skills."
## 
## $`Rs53576(A;G)`
## [1] "{{Genotype\n|rsid=53576\n|allele1=A\n|allele2=G\n|magnitude=2.8\n|repute=Bad\n|summary=Lack of empathy?\n}}\nYou have a SNP in the oxytocin receptor which may make you less empathetic than most people.  When under stress you may have more difficulty recognizing the emotional state of others which impacts loneliness, parenting, and socializing skills.\n\nSome studies have suggested that the A;G genotype is associated with an intermediate level of empathy (compared to the G;G and A;A genotypes), although most report that A;G and A;A individuals have similar levels of empathy and stress handling capabilities."
## 
## $`Rs53576(G;G)`
## [1] "{{Genotype\n|rsid=53576\n|allele1=G\n|allele2=G\n|magnitude=2.5\n|repute=Good\n|summary=Optimistic and empathetic; handle stress well\n}}\nThe one in four subjects who inherited a variation in this allele called G/G were significantly better at accurately reading the emotions of others by observing their faces than were the remaining three-quarters of subjects, who had inherited either a pair of A's or an A and a G from their parents at this site. Compared to the three-fourths with A/A or A/G variations, the G/G individuals were also less likely to startle when blasted by a loud noise, or to become stressed at the prospect of such a noise. And by their own reports, the G/G subjects were mellower and more attuned to other people than were the A/As or A/Gs. [http://latimesblogs.latimes.com/booster_shots/2009/11/do-these-genes-make-my-heart-seem-big-study-finds-a-gene-for-empathy-.html news]\n\n-------\nEffect on Parental Sensitivity\n\nControlling for maternal education, depression and marital discord, OXTR [F\t(1,152)=4.32, P=0.04, partial n2=0.03]\tgene was significantly associated with maternal sensitivity. Mothers with OXTR AA or AG genotypes were less sensitive than mothers with the GG genotype.  The genetic difference accounts for 3% influence on variation in sensitive parenting.  \n[Bakermans-Kranenburg MJ, van Ijzendoorn MH.  Oxytocin receptor (OXTR) and serotonin transporter (5-HTT) genes associated with observed parenting.  Soc Cogn Affect Neurosci. 2008 Jun;3(2):128-34.]\n\nIn another study, heart rate responses of 40 healthy females without children were measured during the presentation of three episodes of infant cry sounds.  Participants with the presumably more efficient variant of the oxytonergic system gene (OXTR GG) had more pronounced physiological reactivity to repeated cry sounds, except when they showed more symptoms of depression.\n[Riem MM, Pieper S, Out D, Bakermans-Kranenburg MJ, van Ijzendoorn MH.  Oxytocin receptor gene and depressive symptoms associated with physiological reactivity to infant crying.  Soc Cogn Affect Neurosci. 2010 Apr 16.]\n\n[http://newsroom.ucla.edu/portal/ucla/ucla-life-scientists-discover-215259.aspx optimism]\n\nYet another study ({{PMID|19934046|OA=1\n}}) found that people with the G;G genotype were better able to discern the emotional state of others and to handle stress, compared to those who carry the A-allele. The study encompassed 192 participants of both sexes and mixed ethnicities. The study subjects underwent a number of tests to determine their level of empathy and stress reactivity. They found that G;G individuals performed significantly better on the behavioral measure of empathy and were 22.7% less likely to make a mistake on the \"Reading the Mind in the Eyes Test\" (RMET) (a behavioural measure of empathic accuracy) than A;A/A;G individuals (P=0.005). Similarly, G;G individuals reported higher levels of dispositional empathy than A;A/A;G individuals: mean (SE)=3.69 (0.06) and 3.53 (0.04) for G;G and A;A/A;G, respectively (P=0.025), and were less affected by stress (as measured by their heart rates): mean (SE)=72.1 (0.54) and 78.4 (1.19) for G;G and A;A/A;G, respectively."
```

Extracting relevant information requires parsing the wiki text.
Some utility functions are already implemented in our library for such purpose and
any other can be implemented by users.

The function `extractSnpTags` for instance,
extracts the "tabular" information from _SNP pages_:


```r
extractSnpTags (pg$Rs53576)
```

```
##                                         rsid 
##                                      "53576" 
##                                   Chromosome 
##                                          "3" 
##                                     position 
##                                    "8762685" 
##                                  Orientation 
##                                       "plus" 
##                                         GMAF 
##                                     "0.4128" 
##                                     Assembly 
##                                     "GRCh38" 
##                                  GenomeBuild 
##                                       "38.1" 
##                                   dbSNPBuild 
##                                        "141" 
##                                        geno1 
##                                      "(A;A)" 
##                                        geno2 
##                                      "(A;G)" 
##                                        geno3 
##                                      "(G;G)" 
##                        StabilizedOrientation 
##                                       "plus" 
##                                       Status 
##                                           NA 
##                                       Merged 
##                                           NA 
##                                         Gene 
##                                       "OXTR" 
##                                       Gene_s 
##                                       "OXTR" 
##                                      Summary 
## "influences social behavior and personality"
```

The function `extractGenotypeTags`
can be used to get the "tabular" information from _genotype pages_:


```r
sapply (pgs, extractGenotypeTags)
```

```
##           Rs53576(A;A)       Rs53576(A;G)      
## rsid      "53576"            "53576"           
## allele1   "A"                "A"               
## allele2   "A"                "G"               
## repute    "Bad"              "Bad"             
## magnitude "2.8"              "2.8"             
## summary   "Lack of empathy?" "Lack of empathy?"
##           Rs53576(G;G)                                   
## rsid      "53576"                                        
## allele1   "G"                                            
## allele2   "G"                                            
## repute    "Good"                                         
## magnitude "2.5"                                          
## summary   "Optimistic and empathetic; handle stress well"
```

This same parsing can also be done while downloading the pages,
including the _wiki processing_ function as an argument of the in the `getPages` query.

If for instance we are just interested in the alleles and the _magnitude_
associated with each of the genotypes we can do:


```r
getPages (titles = c ("Rs53576(A;A)", "Rs53576(A;G)", "Rs53576(G;G)"),
          wikiParseFunction = extractGenotypeTags,
          tags = c ("allele1", "allele2", "magnitude"))
```

```
## $`Rs53576(A;A)`
##   allele1   allele2 magnitude 
##       "A"       "A"     "2.8" 
## 
## $`Rs53576(A;G)`
##   allele1   allele2 magnitude 
##       "A"       "G"     "2.8" 
## 
## $`Rs53576(G;G)`
##   allele1   allele2 magnitude 
##       "G"       "G"     "2.5"
```

Customized parsing functions
----------------------------------------

Any _wiki processing_ function can be included in the `getPages`.
If a user wants for instance to extract all _PubMed_ IDs from pages
[Rs53576](http://www.snpedia.com/index.php/Rs53576) and 
[Rs1815739](http://www.snpedia.com/index.php/Rs1815739), 
he or she can first define a parsing function like: 


```r
findPMID <- function (x) {
    x <- unlist (strsplit (x, split = "\n"))
    x <- grep ("PMID=", x, value = TRUE)
    x
}
```

and then call `getPages` as:


```r
getPages (titles = c ("Rs53576", "Rs1815739"),
          wikiParseFunction = findPMID)
```

```
## $Rs1815739
## [1] "|PMID=22891846" "|PMID=25761735" "|PMID=26324221"
## 
## $Rs53576
##  [1] "|PMID=22069391"  "|PMID=22123970"  "|PMID=20647384 "
##  [4] "|PMID=17383819"  "|PMID=22084107"  "|PMID=22499788" 
##  [7] "|PMID=22357335"  "|PMID=22763666"  "|PMID=15992526" 
## [10] "|PMID=18687882"  "|PMID=19515497"  "|PMID=20347913" 
## [13] "|PMID=20585395"  "|PMID=21896752"  "|PMID=22372486" 
## [16] "|PMID=22487732"  "|PMID=22563705"  "|PMID=22580735" 
## [19] "|PMID=23089921"  "|PMID=23284802"  "|PMID=23470776" 
## [22] "|PMID=23684879"  "|PMID=24295535"  "|PMID=24621832" 
## [25] "|PMID=22809402"  "|PMID=22939719"  "|PMID=23708061" 
## [28] "|PMID=22651577"  "|PMID=24814480"  "|PMID=25003328" 
## [31] "|PMID=25001970"  "|PMID=25564674"  "|PMID=25637390" 
## [34] "|PMID=25680993"  "|PMID=25935637"  "|PMID=24621820" 
## [37] "|PMID=25287464"  "|PMID=25450139"  "|PMID=26175754" 
## [40] "|PMID=26174935"  "|PMID=26178189"  "|PMID=26389606" 
## [43] "|PMID=26444016"
```



Categories
================================================================================

Besides the _SNP_ and the _genotype_ pages,
some other interesting SNPedia resources are the 
__category__ pages.
They constitute _indexes_ of all other pages which may be queried.

Most used categories are:
	
- Is_a_medical_condition
- Is_a_medicine
- Is_a_topic
- Is_a_snp
- In_dbSNP
- Is_a_genotype

Full list of categories may be found [here](http://www.snpedia.com/index.php/Special:Categories).

The function `getCategoryElements` is devised to query all elements under certain category. 
It can be used explore which is the available information in SNPedia.

We can get for instance all _medical conditions_


```r
res <- getCategoryElements (category = "Is_a_medical_condition")
head (res)
```

```
## [1] "21-hydroxylase deficiency"         
## [2] "3-Methylglutaconic aciduria type 2"
## [3] "Abdominal aortic aneurysm"         
## [4] "ABO blood group"                   
## [5] "Acetylation"                       
## [6] "Achondroplasia"
```

and find out those related to _cancer_


```r
grep ('cancer', res, value = TRUE)
```

```
##  [1] "Bladder cancer"          "Breast cancer"          
##  [3] "Cervical cancer"         "Colon cancer"           
##  [5] "Colorectal cancer"       "Endometrial cancer"     
##  [7] "Gallbladder cancer"      "Gastric cancer"         
##  [9] "Gastrointestinal cancer" "Liver cancer"           
## [11] "Lung cancer"             "Ovarian cancer"         
## [13] "Pancreatic cancer"       "Prostate cancer"        
## [15] "Skin cancer"             "Testicular cancer"      
## [17] "Thyroid cancer"
```

Session info
================================================================================


```r
sessionInfo ()
```

```
## R version 3.3.0 (2016-05-03)
## Platform: x86_64-pc-linux-gnu (64-bit)
## Running under: Ubuntu 14.04.4 LTS
## 
## locale:
##  [1] LC_CTYPE=en_US.UTF-8       LC_NUMERIC=C              
##  [3] LC_TIME=en_US.UTF-8        LC_COLLATE=en_US.UTF-8    
##  [5] LC_MONETARY=en_US.UTF-8    LC_MESSAGES=en_US.UTF-8   
##  [7] LC_PAPER=en_US.UTF-8       LC_NAME=C                 
##  [9] LC_ADDRESS=C               LC_TELEPHONE=C            
## [11] LC_MEASUREMENT=en_US.UTF-8 LC_IDENTIFICATION=C       
## 
## attached base packages:
## [1] stats     graphics  grDevices utils     datasets  methods   base     
## 
## other attached packages:
## [1] BiocStyle_1.8.0 SNPediaR_0.99.1 knitr_1.13      devtools_1.11.1
## 
## loaded via a namespace (and not attached):
##  [1] Rcpp_0.12.5     roxygen2_5.0.1  digest_0.6.9    crayon_1.3.1   
##  [5] withr_1.0.1     bitops_1.0-6    R6_2.1.2        jsonlite_0.9.20
##  [9] formatR_1.4     magrittr_1.5    evaluate_0.9    stringi_1.1.1  
## [13] testthat_1.0.2  rmarkdown_0.9.6 tools_3.3.0     stringr_1.0.0  
## [17] RCurl_1.95-4.8  yaml_2.1.13     htmltools_0.3.5 memoise_1.0.0
```



--------------------------------------------------------------------------------
<center>
Created: 2015-09-27 | Revised: 2016-06-03 | Compiled 2016-06-05
</center>
