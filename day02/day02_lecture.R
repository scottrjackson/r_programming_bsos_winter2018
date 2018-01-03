# Day 2 lecture

# Review
# - pulling down changes from the class repo
# - setting up your own repo
# - other questions?


# Topics:
# - calculator and simple interactive use in the console
# - syntax/formatting basics
# - interface: scripts
# - workbench analogy
# - object basics
# - functions as "tools"
# - function structure
# - help
# - packages
# - environments
# - saving environments and objects
# - naming objects
# - reading data from files

####################################################################

# Console
# - most "bare bones" interface with R
# - type commands at the command line, hit Enter after each command
# - code run and evaluated every time you hit Enter
# - can (usually) use up/down arrows to scroll through previous commands

# Basic calculator examples (type along!)
2 + 2
4 * 67
3939/23.2

# Some syntax basics
# - whitespace (mostly) doesn't matter
# - no "line end" character
# - "plus" sign instead of ">" prompt when a line is "incomplete"
#    can hit Esc (or equivalent) to bail out

2+2
2 + 2
      2 +     2

2 -
  2

#########
# Scripts
# - End with .R
# - written *entirely* in R
# - this document is a script!
# - the "comment" symbol is #
#   anything to the right of a # symbol is ignored when running code
#   (exception: if the # is part of a string, as indicated by quotes,
#   it's treated as part of that string and not as a comment character)
# - you can run entire scripts using `source()` function

2 + 2 # this is trivial math

#############################
# Workbench analogy for R use


##############################
# Objects: creating and naming

# assignment: creating something in your workspace
x <- 23 * 45
x
x * 2
x <- 24 * 45
x

# checking the workspace contents
objects()
ls()

# removing things from the workspace
rm("x")
objects()
x <- 10
y <- 20
mean(x, y)

# rm(list = objects()) # remove everything from the workspace


# object naming conventions
# cannot start with a number
b1 <- 10
# 1b <- 10 

# b1*w <- 10 # no "meaningful" symbols in object names

# some principles
# 1. make them meaningful
# 2. make them easy to type

big_long_name_that_describes_things_in_detail <- 10 # not a great name

# RStudio helps with #2
# tab-completion
big_long_name_that_describes_things_in_detail

# some different "style" options
camelCase <- 10
thisIsaVariableInCamelCase <- 11
thisisavariablenotincamelcase <- 12 # harder to read
dot.delimited <- 10
underscore_delimited <- 10

# other style examples:
# https://google.github.io/styleguide/Rguide.xml
# http://adv-r.had.co.nz/Style.html


# case matters
x <- 10
X 
X <- 12
x
X

######################
# Structure of objects

# simple structure: vectors
# c()
# seq() for sequences
# x:y as a shortcut for seq(from = x, to = y, by = 1)
# [] for subsetting

my.vector <- c(1, 2, 3, 4, 5)
my.vector
my.seq <- seq(1, 5)
my.seq
seq(from = 1, to = 10, by = 1)
seq(from = 1, to = 10, by = 2)
seq(from = 2, to = 10, by = 2)

10:20 # same as seq(10, 20, 1)

my.vector <- c(2, 45, 21, 4000, 82)
my.vector

my.vector[4]
c(2, 4)
my.vector[c(2, 4)]

my.vector[4] <- 3000
my.vector

# syntax note: [square brackets] are used ONLY for "extraction"/subsetting
#              (parentheses) are used in math, and in functions (more below)

(3 + 3) * 6
3 + (3 * 6)

# vectors:
# - all a single data type
# - always one-dimensional
# - multi-dimensional things are other types of objects
#   - data frames
#   - lists
#   - matrices
#   - arrays

#############
# Data frames
# - two dimensional
# - columns act as vectors (all same data type)
# - ideal standard format for (most) data
# - columns = variables, rows = cases
?sleep

my.sleep <- sleep
my.sleep

# [rows, columns]  
# names
# $

my.sleep[ , ]
my.sleep[2, 1]

my.sleep[1:5, 1]

my.sleep[1:5, 1:2]

my.sleep[1:5, c(1, 3)]

my.sleep[1:5, "extra"]
extra <- c(2, 3)
my.sleep[1:5, extra]

my.order <- c(2, 1, 3)
my.order
my.sleep[1:5, 1:3]
my.sleep[1:5, my.order] # shortcut for my.order[1:5, c(2, 1, 3)]

my.sleep$extra

my.sleep$extra[6:10]

# Some handy functions for inspecting data frames
# head(), tail()
# nrow(), ncol()
# summary()
# colnames()
head(my.sleep)
head(my.sleep, 3)

tail(my.sleep)

nrow(my.sleep)
ncol(my.sleep)

colnames(my.sleep)

summary(my.sleep)

View(my.sleep)

###########
# Functions
# - everything in R is an object!
# - some objects function as "tools" -- they *do* stuff
# - these are "functions"
# - functions are still objects, too!

# syntax: FUNCTIONNAME(arg1, arg2, arg3...)

# functions return a single value, but may have other "side effects"
# the returned value may be complex, but it is still a single *object*

# example: t.test()
# with made-up vectors
x <- 1:10
y <- 2:11

t.test(x, y)

################
# Quick practice

# using [ ] and <-, pull out some numbers from the sleep data, and compare with t.test
View(my.sleep)
vector1 <- my.sleep[7:10, "extra"]
# some equivalents
vector1b <- my.sleep[7:10, 1]
vector1c <- my.sleep$extra[7:10]
vector1d <- my.sleep$extra[10:7]

vector2 <- my.sleep[12:15, "extra"] 

t.test(vector1, vector2)

###################
# More on arguments
# - names
# - order
# - optional vs. required

# getting help()
help(t.test)
example(t.test)

t.test(x = vector1, y = vector2)
t.test(vector1, vector2) # names are optional

objects()
?objects

t.test(vector1)

# finding help
# Google
# "fuzzy matching"
??correlation

# sometimes hints from tab-completion in RStudio

# can be sloppy with argument names

# return to t-test (options)


########################################
# PRACTICE TIME!
# Complete items 1-3 in day02_practice.R
########################################
?iris
my.iris <- iris
head(my.iris)
View(my.iris)

##########
# Packages

library(MASS)
install.packages("dplyr")
library(dplyr)
install.packages(c("ggplot2", "tidyr"))
library(ggplot2)
install.packages("tidyverse") # https://www.tidyverse.org/

# update.packages()

##############
# Environments

# workspaces

# naming conflicts

# MASS::select(x)  # 
# select(x) # this will run the dplyr version of select()

# saving workspaces & objects

sepalwidth.setosa <- my.iris[1:50, "Sepal.Width"]
sepalwidth.versicolor <- my.iris[51:100, "Sepal.Width"]

my.results <- t.test(sepalwidth.setosa, sepalwidth.versicolor)
save(my.results, file = "ttest_result.RData")
rm("my.results")
my.results
load("ttest_result.RData")
my.results

########################################
# PRACTICE TIME!
# Complete items 4-7 in day02_practice.R
########################################


#########################
# Reading data from files

# read.table() family
?read.table
# for SPSS
# old package: `foreign`
# new package: `haven`

# for Excel: `readxl`
# install.packages("readxl")
# library(readxl)

# Others?

####################################
# PRACTICE: Try to read in your data
####################################