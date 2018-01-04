# Complete all of the items below
# Use comments where you're having trouble or questions

# 1. Read your data set into R
scottdata <- read.csv("scottdata/CognitionPaperFinalData.csv")


# 2. Peek at the top few rows
head(scottdata)

# 3. Peek at the top few rows for only a few columns
head(scottdata[ , 1:4])
head(scottdata[ , c("Corpus", "Pair", "WithinMinPairs")])

# 4. How many rows does your data have?
nrow(scottdata)

# 5. Get a summary for every column
summary(scottdata)

# 6. Get a summary for one column
summary(scottdata$Corpus)

# 7. Are any of the columns giving you unexpected values?
# Nope!

# 8. Select a few key columns, make a vector of the column names
colnames(scottdata)
key.columns <- colnames(scottdata)[c(1, 3, 6, 8)]
key.columns2 <- c("Corpus", "Pair", "Merged", "BetweenMinPairs")

# 9. Create a new data.frame with just that subset of columns
scottdata.sub1 <- scottdata[, key.columns]

# 10. Create a new data.frame that is just the first 10 rows
#     and the last 10 rows of the data from the previous step
scottdata.sub2 <- scottdata.sub1[1:10, ] # first ten rows
nrow(scottdata.sub1)
scottdata.sub2 <- scottdata.sub1[625:634, ] # last ten rows
scottdata.sub2 <- scottdata.sub1[(nrow(scottdata.sub1)-9):nrow(scottdata.sub1), ] # last ten rows
n.rows <- nrow(scottdata.sub1)
scottdata.sub2 <- scottdata.sub1[(n.rows-9):n.rows, ] # last ten rows

scottdata.sub2 <- scottdata.sub1[c(1:10, (nrow(scottdata.sub1)-9):nrow(scottdata.sub1)), ]
scottdata.sub2

# 11. Create a new data.frame that is a random sample of half of the rows.
# HINT: ?sample
sample.rows <- sample(x = nrow(scottdata), size = nrow(scottdata)/2, replace = FALSE) # replace = FALSE is the default
sample.rows
scottdata.sample <- scottdata[sample.rows, ]

# 12. Find a comparison in your data that is interesting to make
#     (comparing two sets of numbers)
#     - run a t.test for that comparison
#     - decide whether you need a non-default test
#       (e.g., Student's, paired)
#     - run the t.test with BOTH the formula and "vector"
#       formats, if possible
#     - if one is NOT possible, say why you can't do it
my.ttest1 <- t.test(WithinMinPairs ~ Merged, data = scottdata)
my.ttest1

my.ttest2 <- t.test(BetweenMinPairs ~ Merged, data = scottdata)
my.ttest2

# currently no good way to just refer to the rows where Merged column is "Merged" or "Unmerged"
# we'll fix that soon!

# 13. Repeat #12 for TWO more comparisons
#     - ALTERNATIVELY, if correlations are more interesting,
#       do those instead of t-tests (and try both Spearman and
#       Pearson correlations)
#     - Tip: it's okay if the comparisons are kind of nonsensical, this is 
#       just a programming exercise
my.cortest1 <- cor.test(scottdata$WithinMinPairs, scottdata$BetweenMinPairs)
(my.cortest2 <- cor.test(scottdata$HiSegTok, scottdata$BetweenMinPairs))

# 14. Save all results from #12 and #13 in an .RData file
save(my.ttest1, my.ttest2, my.cortest1, my.cortest2, file = "day02/homework_results.RData")

# 15. Email me your version of this script, PLUS the .RData
#     file from #14
#     - ALTERNATIVELY, push your version of this script and your .RData results
#       to a repo on GitHub, and send me the link


