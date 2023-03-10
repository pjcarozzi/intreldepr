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
# dt2 <- read.csv("1_data/3_processed/intreldepr_datanarmt.csv")
setDT(dt)

dt[g202016>12, g202016:=NA]

# Models
# M1 ----
m1 <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 + xdepression2016
   xsocsupp2018     ~ xaccma2016   + xacccon2016
   xpercdiscr2018   ~ pigmentation2016
   xdepression2018  ~ xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   xacccon2016 ~~ xdepression2016
   pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
   xsocsupp2018 ~~ xdepression2018
   xpercdiscr2018 ~~ xdepression2018
'

# m1v2 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 + xdepression2016
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018  ~ xdepression2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xaccma2016 ~~ xdepression2016
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016
#    pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    #xsocsupp2018 ~~ xpercdiscr2018
#    #xsocsupp2018 ~~ xdepression2018
#    #xpercdiscr2018 ~~ xdepression2018
# '

# m1v3 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 + xdepression2016
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018  ~ xdepression2016
# 
#  # correlations
#  # T1
#    #xaccma2016 ~~ xacccon2016
#    #xaccma2016 ~~ pigmentation2016
#    #xaccma2016 ~~ xdepression2016
#    #xacccon2016 ~~ pigmentation2016
#    #xacccon2016 ~~ xdepression2016
#    #pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
#    xsocsupp2018 ~~ xdepression2018
#    xpercdiscr2018 ~~ xdepression2018
# '

# m1n <- '
#  # regressions
#    xdepression2021norm  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018norm + xdepression2016norm
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018norm  ~ xdepression2016norm
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xaccma2016 ~~ xdepression2016norm
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016norm
#    pigmentation2016 ~~ xdepression2016norm
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
#    xsocsupp2018 ~~ xdepression2018norm
#    xpercdiscr2018 ~~ xdepression2018norm
# '

# M2 ----
m2 <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 
   xsocsupp2018     ~ xaccma2016   + xacccon2016
   xpercdiscr2018   ~ pigmentation2016
   xdepression2018  ~ xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   xacccon2016 ~~ xdepression2016
   pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
   xsocsupp2018 ~~ xdepression2018
   xpercdiscr2018 ~~ xdepression2018
'
# 
# m2v2 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018  ~ xdepression2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xaccma2016 ~~ xdepression2016
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016
#    pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    #xsocsupp2018 ~~ xpercdiscr2018
#    #xsocsupp2018 ~~ xdepression2018
#    #xpercdiscr2018 ~~ xdepression2018
# '

# m2n <- '
#  # regressions
#    xdepression2021norm  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018norm 
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018norm  ~ xdepression2016norm
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xaccma2016 ~~ xdepression2016norm
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016norm
#    pigmentation2016 ~~ xdepression2016norm
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
#    xsocsupp2018 ~~ xdepression2018norm
#    xpercdiscr2018 ~~ xdepression2018norm
# '

# m2v3 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018 
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
#    xdepression2018  ~ xdepression2016
# 
#  # correlations
#  # T1
#    #xaccma2016 ~~ xacccon2016
#    #xaccma2016 ~~ pigmentation2016
#    #xaccma2016 ~~ xdepression2016
#    #xacccon2016 ~~ pigmentation2016
#    #xacccon2016 ~~ xdepression2016
#    #pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
#    xsocsupp2018 ~~ xdepression2018
#    xpercdiscr2018 ~~ xdepression2018
# '

# M3 ----
m3 <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018
   xsocsupp2018     ~ xaccma2016   + xacccon2016
   xpercdiscr2018   ~ pigmentation2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xacccon2016 ~~ pigmentation2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
   xsocsupp2018 ~~ xdepression2018
   xpercdiscr2018 ~~ xdepression2018
'

# m3v2 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xacccon2016 ~~ pigmentation2016
# 
#  # T2
#    #xsocsupp2018 ~~ xpercdiscr2018
#    #xsocsupp2018 ~~ xdepression2018
#    #xpercdiscr2018 ~~ xdepression2018
# '

# m3n <- '
#  # regressions
#    xdepression2021norm  ~ xsocsupp2018 + xpercdiscr2018norm + xdepression2018norm
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018norm   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xacccon2016 ~~ pigmentation2016
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018norm
#    xsocsupp2018 ~~ xdepression2018norm
#    xpercdiscr2018norm ~~ xdepression2018norm
# '

# m3v3 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    #xaccma2016 ~~ xacccon2016
#    #xaccma2016 ~~ pigmentation2016
#    #xacccon2016 ~~ pigmentation2016
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
#    xsocsupp2018 ~~ xdepression2018
#    xpercdiscr2018 ~~ xdepression2018
# '

# M4 ----
m4 <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + c*xpercdiscr2018 + a*xdepression2016 + d*pigmentation2016 + g22016 + g182016
   xsocsupp2018     ~ xaccma2016   + xacccon2016 + xdepression2016
   xpercdiscr2018   ~ f*pigmentation2016 + b*xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   # xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   # xacccon2016 ~~ xdepression2016
   # pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018


 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*c
              xzy.d2 := d
'

# M4 ----
m4cs <- '
 # regressions
   xdepression2016  ~ f*xsocsupp2016 + c*xpercdiscr2016 + a*pigmentation2016 + d*xacccon2016 + g22016 + g182016
   xsocsupp2016     ~ xaccma2016   + e*xacccon2016
   xpercdiscr2016   ~ b*pigmentation2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   # xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   # xacccon2016 ~~ xdepression2016
   # pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2016 ~~ xpercdiscr2016


 #Defined Parameters:
              xzy.i1 := b*c
              xzy.d1 := a
              xzy.i2 := f*e
              xzy.d2 := d
'

# m4v2 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2016
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xaccma2016 ~~ xdepression2016
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016
#    pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    #xsocsupp2018 ~~ xpercdiscr2018
# '
# m4n <- '
#  # regressions
#    xdepression2021norm  ~ xsocsupp2018 + xpercdiscr2018norm + xdepression2016norm
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018norm   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    xaccma2016 ~~ xacccon2016
#    xaccma2016 ~~ pigmentation2016
#    xacccon2016 ~~ pigmentation2016
#    xacccon2016 ~~ xdepression2016norm
#    pigmentation2016 ~~ xdepression2016norm
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018norm
# '

# m4v3 <- '
#  # regressions
#    xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2016
#    xsocsupp2018     ~ xaccma2016   + xacccon2016
#    xpercdiscr2018   ~ pigmentation2016
# 
#  # correlations
#  # T1
#    #xaccma2016 ~~ xacccon2016
#    #xaccma2016 ~~ pigmentation2016
#    #xaccma2016 ~~ xdepression2016
#    #xacccon2016 ~~ pigmentation2016
#    #xacccon2016 ~~ xdepression2016
#    #pigmentation2016 ~~ xdepression2016
# 
#  # T2
#    xsocsupp2018 ~~ xpercdiscr2018
# '

# M5 ----
m5 <- '
 # regressions
   xdepression2021  ~ xsocsupp2021 + xpercdiscr2018 + xdepression2018 + xdepression2016
   xsocsupp2021 ~ xsocsupp2018
   xsocsupp2018 ~ xaccma2016 + xacccon2016
   xpercdiscr2018 ~ pigmentation2016
   xdepression2018  ~ xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   xacccon2016 ~~ xdepression2016
   pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
   xsocsupp2018 ~~ xdepression2018
   xpercdiscr2018 ~~ xdepression2018
'

# M6 ----
m6 <- '
 # regressions
   xdepression2021  ~ xsocsupp2021 + xpercdiscr2018 + xdepression2018 + xdepression2016
   xsocsupp2021 ~ xaccma2016 + xacccon2016
   xpercdiscr2018 ~ pigmentation2016
   xdepression2018  ~ xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   xacccon2016 ~~ xdepression2016
   pigmentation2016 ~~ xdepression2016

 # T2
   xpercdiscr2018 ~~ xdepression2018
'

m7 <- '
 # regressions
   xdepression2021  ~ xsocsupp2021 + xpercdiscr2018 + xdepression2018
   xsocsupp2021 ~ xsocsupp2018
   xsocsupp2018 ~ xaccma2016 + xacccon2016
   xpercdiscr2018 ~ pigmentation2016
   xdepression2018  ~ xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   # xacccon2016 ~~ xdepression2016
   # pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
   # xsocsupp2018 ~~ xdepression2018
   # xpercdiscr2018 ~~ xdepression2018
'

# M8 ----
m8 <- '
 # regressions
   xdepression2021  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2016 + xaccma2016 + xacccon2016 + pigmentation2016
   xsocsupp2018     ~ xaccma2016   + xacccon2016 + xdepression2016
   xpercdiscr2018   ~ pigmentation2016 + xdepression2016

 # correlations
 # T1
   xaccma2016 ~~ xacccon2016
   xaccma2016 ~~ pigmentation2016
   # xaccma2016 ~~ xdepression2016
   xacccon2016 ~~ pigmentation2016
   # xacccon2016 ~~ xdepression2016
   # pigmentation2016 ~~ xdepression2016

 # T2
   xsocsupp2018 ~~ xpercdiscr2018
'


fit_m1 <- sem(m1, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m2 <- sem(m2, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m3 <- sem(m3, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m4 <- sem(m4, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m4cs <- sem(m4cs, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")

fit_m5 <- sem(m5, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m6 <- sem(m6, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m7 <- sem(m7, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
fit_m8 <- sem(m8, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")

summary(fit_m1, standardized = TRUE, fit.measures = TRUE)
summary(fit_m2, standardized = TRUE, fit.measures = TRUE)
summary(fit_m3, standardized = TRUE, fit.measures = TRUE)
summary(fit_m4, standardized = TRUE, fit.measures = TRUE)
summary(fit_m4cs, standardized = TRUE, fit.measures = TRUE)

summary(fit_m5, standardized = TRUE, fit.measures = TRUE)
summary(fit_m6, standardized = TRUE, fit.measures = TRUE)
summary(fit_m7, standardized = TRUE, fit.measures = TRUE)
summary(fit_m8, standardized = TRUE, fit.measures = TRUE)
# 
# fit_m1v2 <- sem(m1v2, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m2v2 <- sem(m2v2, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m3v2 <- sem(m3v2, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m4v2 <- sem(m4v2, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# 
# summary(fit_m1v2, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m2v2, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m3v2, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m4v2, standardized = TRUE, fit.measures = TRUE)
# 
# 
# 
# fit_m1v3 <- sem(m1v3, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m2v3 <- sem(m2v3, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m3v3 <- sem(m3v3, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# fit_m4v3 <- sem(m4v3, data = dt, estimator="MLR", missing = "FIML", cluster = "comuna2016")
# 
# summary(fit_m1v3, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m2v3, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m3v3, standardized = TRUE, fit.measures = TRUE)
# summary(fit_m4v3, standardized = TRUE, fit.measures = TRUE)


