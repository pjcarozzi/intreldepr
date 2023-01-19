# *-*-*-*-*-*-*-*-*-*-*-*-*-*-
# Descriptives and others
# pjcarozzi@uc.cl
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-

rm(list = ls(all.names = TRUE))

# libraries
library(here)
library(data.table)
library(summarytools)
library(bestNormalize)
library(Hmisc)
library(psych)


# Data
dt1 <- setDT(read.csv("1_data/3_processed/intreldepr_data.csv"))
dt2 <- setDT(read.csv("1_data/3_processed/intreldepr_data_narm.csv"))



# Descriptives
descr(dt1[,c("xdepression2021","xdepression2021v1","xdepression2021v2","xdepression2018","xdepression2016",
            "xsocsupp2018","xpercdiscr2018","xaccma2016","xacccon2016","pigmentation2016"), with=F], transpose = T)


# 









# hist(dt1$xdepression2021)
# hist(dt1$xdepression2018)
# hist(dt1$xdepression2016)

dt1[,xdepression2021norm:=bestNormalize(dt1$xdepression2021, standardize = T)[["x.t"]]]
dt1[,xdepression2018norm:=bestNormalize(dt1$xdepression2018, standardize = T)[["x.t"]]]
dt1[,xdepression2016norm:=bestNormalize(dt1$xdepression2016, standardize = T)[["x.t"]]]

dt2[,xdepression2021norm:=bestNormalize(dt2$xdepression2021, standardize = T)[["x.t"]]]
dt2[,xdepression2018norm:=bestNormalize(dt2$xdepression2018, standardize = T)[["x.t"]]]
dt2[,xdepression2016norm:=bestNormalize(dt2$xdepression2016, standardize = T)[["x.t"]]]
# hist(dt1$xdepression2021norm)
# hist(dt1$xdepression2018norm)
# hist(dt1$xdepression2016norm)


dt1[,xpercdiscr2018norm:=bestNormalize(dt1$xpercdiscr2018, standardize = T)[["x.t"]]]
dt1[,xsocsupp2018norm:=bestNormalize(dt1$xsocsupp2018, standardize = T)[["x.t"]]]
dt2[,xpercdiscr2018norm:=bestNormalize(dt2$xpercdiscr2018, standardize = T)[["x.t"]]]
dt2[,xsocsupp2018norm:=bestNormalize(dt2$xsocsupp2018, standardize = T)[["x.t"]]]

m <- lm(xdepression2021norm  ~ xsocsupp2018 + xpercdiscr2018 + xdepression2018norm, data=dt1)
summary(m)

plot(m, 1)
plot(m, 2)
plot(m, 3)
plot(m, 4, id.n = 20)
plot(m, 5, id.n = 10)


# Correlations
vars <- c("xdepression2021","xdepression2021v1","xdepression2021v2","xdepression2018","xdepression2016",
          "xdepression2021norm","xdepression2018norm","xdepression2016norm",
          "xsocsupp2018","xpercdiscr2018","xaccma2016","xacccon2016","pigmentation2016",
          "g182016")
cor <- rcorr(as.matrix(dt1[,..vars]))
cor


# WHo answ depression v1 and v2?

# dt1[,deprvers:=fcase(
#   !is.na(xdepression2021v1), 1,
#   !is.na(xdepression2021v2), 2)]
# 
dt1[,gender:=g82016-1]
dt1[gender>3,gender:=NA]
# 
# descr(dt1[deprvers==1, c("gender","g182016"), with=F])
# descr(dt1[deprvers==2, c("gender","g182016"), with=F])
# 
# 
# freq(dt1[deprvers==1, "a12016", with=F])
# freq(dt1[deprvers==2, "a12016", with=F])
# 
# freq(dt1[deprvers==1, "macrozona2016", with=F])
# freq(dt1[deprvers==2, "macrozona2016", with=F])
# 
# freq(dt1[deprvers==1, "urbano_rural2016", with=F])
# freq(dt1[deprvers==2, "urbano_rural2016", with=F])


write.csv(dt1,file="1_data/3_processed/intreldepr_data.csv",row.names = F)
write.csv(dt2,file="1_data/3_processed/intreldepr_data_narm.csv",row.names = F)

