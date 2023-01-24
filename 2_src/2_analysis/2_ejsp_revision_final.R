# *-*-*-*-*-*-*-*-*-*-*-*-*-*-
# EJSP Revision  
# pjcarozzi@uc.cl
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-

rm(list = ls(all.names = TRUE))

# libraries
library(lavaan)
library(data.table)

# Data
dt <- read.csv("1_data/3_processed/intreldepr_data.csv")
setDT(dt)
dt[g202016>12, g202016:=NA]

# Models
# cross ----
mcrs <- '
 # regressions
   xdepression2016  ~ f*xsocsupp2016 + c*xpercdiscr2016 + a*pigmentation2016 + d*xacccon2016 + g22016 + g182016
   xsocsupp2016     ~ xaccma2016   + e*xacccon2016
   xpercdiscr2016   ~ b*pigmentation2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xacccon2016 ~~ pigmentation2016

 # T2
   xsocsupp2016 ~~ xpercdiscr2016


 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*e
              xzy.d2 := d
'

mcrswo <- '
 # regressions
   xdepression2016  ~ f*xsocsupp2016 + c*xpercdiscr2016 + a*pigmentation2016 + d*xacccon2016 #+ g22016 + g182016
   xsocsupp2016     ~ xaccma2016   + e*xacccon2016
   xpercdiscr2016   ~ b*pigmentation2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xacccon2016 ~~ pigmentation2016

 # T2
   xsocsupp2016 ~~ xpercdiscr2016


 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*e
              xzy.d2 := d
'

# long ----
mlng <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + c*xpercdiscr2018 + a*xdepression2016 + d*pigmentation2016 + g22016 + g182016
   xsocsupp2018     ~ xaccma2016 + xacccon2016 + xdepression2016
   xpercdiscr2018   ~ f*pigmentation2016 + b*xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xacccon2016 ~~ pigmentation2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018

 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*c
              xzy.d2 := d
'

mlngwo <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + c*xpercdiscr2018 + a*xdepression2016 + d*pigmentation2016 #+ g22016 + g182016
   xsocsupp2018     ~ xaccma2016 + xacccon2016 + xdepression2016
   xpercdiscr2018   ~ f*pigmentation2016 + b*xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xacccon2016 ~~ pigmentation2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018

 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*c
              xzy.d2 := d
'

fit_mcrs <- sem(mcrswo, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_mlng <- sem(mlngwo, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")

summary(fit_mcrs, standardized = TRUE, fit.measures = TRUE)
summary(fit_mlng, standardized = TRUE, fit.measures = TRUE)
