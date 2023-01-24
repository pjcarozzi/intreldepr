# *-*-*-*-*-*-*-*-*-*-*-*-*-*-
# Descriptives and others
# pjcarozzi@uc.cl
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-

# libraries
library(summarytools)
library(Hmisc)

# Data
dt <- read.csv("1_data/3_processed/intreldepr_data.csv")



rcorr(as.matrix(my_data))