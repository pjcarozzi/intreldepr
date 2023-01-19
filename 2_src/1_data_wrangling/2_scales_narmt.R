# *-*-*-*-*-*-*-*-*-*-*-*-*-*-
# Prepare database 
# pjcarozzi@uc.cl
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-

rm(list = ls(all.names = TRUE))

library(here)
library(foreign)
library(data.table)
library(bestNormalize)

# Data
dt <- read.spss("1_data/2_sent_jan_2023/BBDD ELRI HOMOLOGADA 3.0 WIDE INNOMINADA.sav", to.data.frame = T, use.value.labels = F)
setDT(dt)

# Variables
# Ethnicity (filter based on T1 responses)
dt <- dt[a12016!=12,]
dt[a12016>12,a12016:=NA]
summarytools::freq(dt[,"a12016"])

# Acculturation - Culture Maintenance
dt[c28_12016>5,c28_12016:=NA]
dt[c28_22016>5,c28_22016:=NA]
dt[, xaccma2016:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_12016", "c28_22016")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

dt[c28_12018>5,c28_12018:=NA]
dt[c28_22018>5,c28_22018:=NA]
dt[, xaccma2018:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_12018", "c28_22018")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

dt[c28_12021>5,c28_12021:=NA]
dt[c28_22021>5,c28_22021:=NA]
dt[, xaccma2021:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_12021", "c28_22021")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

# Acculturation, Contact
dt[c28_52016>5,c28_52016:=NA]
dt[c28_62016>5,c28_62016:=NA]
dt[, xacccon2016:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_52016", "c28_62016")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

dt[c28_52018>5,c28_52018:=NA]
dt[c28_62018>5,c28_62018:=NA]
dt[, xacccon2018:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_52018", "c28_62018")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

dt[c28_52021>5,c28_52021:=NA]
dt[c28_62021>5,c28_62021:=NA]
dt[, xacccon2021:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("c28_52021", "c28_62021")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

# Pigmentation
dt[,pigmentation2016:=a112016] #Caution pigmentation was a11 not a10 as appears in the spss script
dt[,pigmentation2018:=a112018]

# Perception personal discrimination 
dt[e6_12016>5,e6_12016:=NA]
dt[e6_22016>5,e6_22016:=NA]
dt[e6_32016>5,e6_32016:=NA]
dt[e6_42016>5,e6_42016:=NA]
dt[e6_52016>5,e6_52016:=NA]
dt[e6_62016>5,e6_62016:=NA]
dt[, xpercdiscr2016:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("e6_12016",
                                                                        "e6_22016",
                                                                        "e6_32016",
                                                                        "e6_42016",
                                                                        "e6_52016",
                                                                        "e6_62016")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both
dt[e6_12018>5,e6_12018:=NA]
dt[e6_22018>5,e6_22018:=NA]
dt[e6_32018>5,e6_32018:=NA]
dt[e6_42018>5,e6_42018:=NA]
dt[e6_52018>5,e6_52018:=NA]
dt[e6_62018>5,e6_62018:=NA]
dt[, xpercdiscr2018:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("e6_12018",
                                                                        "e6_22018",
                                                                        "e6_32018",
                                                                        "e6_42018",
                                                                        "e6_52018",
                                                                        "e6_62018")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both


# Social support
dt[g4_12016>5,g4_12016:=NA]
dt[g4_22016>5,g4_22016:=NA]
dt[g4_32016>5,g4_32016:=NA]
dt[g4_42016>5,g4_42016:=NA]
dt[g4_52016>5,g4_52016:=NA]
dt[g4_62016>5,g4_62016:=NA]
dt[g4_72016>5,g4_72016:=NA]
dt[g4_82016>5,g4_82016:=NA]
dt[g4_92016>5,g4_92016:=NA]
dt[, xsocsupp2016:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g4_12016",
                                                                      "g4_22016",
                                                                      "g4_32016",
                                                                      "g4_42016",
                                                                      "g4_52016",
                                                                      "g4_62016",
                                                                      "g4_72016",
                                                                      "g4_82016",
                                                                      "g4_92016")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both
dt[g4_12018>5,g4_12018:=NA]
dt[g4_22018>5,g4_22018:=NA]
dt[g4_32018>5,g4_32018:=NA]
dt[g4_42018>5,g4_42018:=NA]
dt[g4_52018>5,g4_52018:=NA]
dt[g4_62018>5,g4_62018:=NA]
dt[g4_72018>5,g4_72018:=NA]
dt[g4_82018>5,g4_82018:=NA]
dt[g4_92018>5,g4_92018:=NA]
dt[, xsocsupp2018:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g4_12018",
                                                                      "g4_22018",
                                                                      "g4_32018",
                                                                      "g4_42018",
                                                                      "g4_52018",
                                                                      "g4_62018",
                                                                      "g4_72018",
                                                                      "g4_82018",
                                                                      "g4_92018")]
dt[g4_12021>5,g4_12021:=NA]
dt[g4_22021>5,g4_22021:=NA]
dt[g4_32021>5,g4_32021:=NA]
dt[g4_42021>5,g4_42021:=NA]
dt[g4_52021>5,g4_52021:=NA]
dt[g4_62021>5,g4_62021:=NA]
dt[g4_72021>5,g4_72021:=NA]
dt[g4_82021>5,g4_82021:=NA]
dt[g4_92021>5,g4_92021:=NA]
dt[, xsocsupp2021:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g4_12021",
                                                                      "g4_22021",
                                                                      "g4_32021",
                                                                      "g4_42021",
                                                                      "g4_52021",
                                                                      "g4_62021",
                                                                      "g4_72021",
                                                                      "g4_82021",
                                                                      "g4_92021")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both

# Depression
dt[g5_12016>5,g5_12016:=NA]
dt[g5_22016>5,g5_22016:=NA]
dt[g5_32016>5,g5_32016:=NA]
dt[g5_42016>5,g5_42016:=NA]
dt[g5_52016>5,g5_52016:=NA]
dt[g5_62016>5,g5_62016:=NA]
dt[g5_72016>5,g5_72016:=NA]
dt[g5_82016>5,g5_82016:=NA]
dt[g5_92016>5,g5_92016:=NA]
dt[, xdepression2016:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g5_12016",
                                                                         "g5_22016",
                                                                         "g5_32016",
                                                                         "g5_42016",
                                                                         "g5_52016",
                                                                         "g5_62016",
                                                                         "g5_72016",
                                                                         "g5_82016",
                                                                         "g5_92016")] #Caution to replicate old variables from the T1-T2 database NAs are removed, so we are "calculating" the mean for individuals that have data in just one variable and not both
dt[g5_12018>5,g5_12018:=NA]
dt[g5_22018>5,g5_22018:=NA]
dt[g5_32018>5,g5_32018:=NA]
dt[g5_42018>5,g5_42018:=NA]
dt[g5_52018>5,g5_52018:=NA]
dt[g5_62018>5,g5_62018:=NA]
dt[g5_72018>5,g5_72018:=NA]
dt[g5_82018>5,g5_82018:=NA]
dt[g5_92018>5,g5_92018:=NA]
dt[, xdepression2018:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g5_12018",
                                                                         "g5_22018",
                                                                         "g5_32018",
                                                                         "g5_42018",
                                                                         "g5_52018",
                                                                         "g5_62018",
                                                                         "g5_72018",
                                                                         "g5_82018",
                                                                         "g5_92018")]
dt[g5_1_v12021>5,g5_1_v12021:=NA]
dt[g5_2_v12021>5,g5_2_v12021:=NA]
dt[g5_3_v12021>5,g5_3_v12021:=NA]
dt[g5_4_v12021>5,g5_4_v12021:=NA]
dt[g5_5_v12021>5,g5_5_v12021:=NA]
dt[g5_6_v12021>5,g5_6_v12021:=NA]
dt[g5_7_v12021>5,g5_7_v12021:=NA]
dt[g5_8_v12021>5,g5_8_v12021:=NA]
dt[g5_9_v12021>5,g5_9_v12021:=NA]
dt[, xdepression2021v1:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g5_1_v12021",
                                                                           "g5_2_v12021",
                                                                           "g5_3_v12021",
                                                                           "g5_4_v12021",
                                                                           "g5_5_v12021",
                                                                           "g5_6_v12021",
                                                                           "g5_7_v12021",
                                                                           "g5_8_v12021",
                                                                           "g5_9_v12021")] 

dt[g5_1_v22021>5,g5_1_v22021:=NA]
dt[g5_2_v22021>5,g5_2_v22021:=NA]
dt[g5_3_v22021>5,g5_3_v22021:=NA]
dt[g5_4_v22021>5,g5_4_v22021:=NA]
dt[g5_5_v22021>5,g5_5_v22021:=NA]
dt[g5_6_v22021>5,g5_6_v22021:=NA]
dt[g5_7_v22021>5,g5_7_v22021:=NA]
dt[g5_8_v22021>5,g5_8_v22021:=NA]
dt[g5_9_v22021>5,g5_9_v22021:=NA]
dt[, xdepression2021v2:= rowMeans(.SD, na.rm = T), by = folio, .SDcols = c("g5_1_v22021",
                                                                           "g5_2_v22021",
                                                                           "g5_3_v22021",
                                                                           "g5_4_v22021",
                                                                           "g5_5_v22021",
                                                                           "g5_6_v22021",
                                                                           "g5_7_v22021",
                                                                           "g5_8_v22021",
                                                                           "g5_9_v22021")] 


table(!is.na(dt$xdepression2021v1),!is.na(dt$xdepression2021v2))

dt[, xdepression2021:= ifelse(!is.na(xdepression2021v1),xdepression2021v1,xdepression2021v2)]
freq(!is.na(dt$xdepression2021))

# Save
write.csv(dt,file="1_data/3_processed/intreldepr_data_narm.csv",row.names = F)
