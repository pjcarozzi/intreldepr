# *-*-*-*-*-*-*-*-*-*-*-*-*-*-
# Compare databases 
# pjcarozzi@uc.cl
# *-*-*-*-*-*-*-*-*-*-*-*-*-*-

library(here)
library(foreign)
library(summarytools)
library(data.table)

# Data
dt_h <- read.spss("1_data/1_hanna_db/Indig only T1T2.sav", to.data.frame = T, use.value.labels = F)
dt_e <- read.spss("1_data/2_sent_jan_2023/BBDD ELRI HOMOLOGADA 3.0 WIDE INNOMINADA.sav", to.data.frame = T, use.value.labels = F)
dt_n <- fread("1_data/ELRI_wide.csv")


setDT(dt_h)
setDT(dt_e)


# Variables
# Ethnicity (filter based on T1 responses) ----
freq(dt_h[,"a1.2016"])
freq(dt_e[a12016!=12,"a12016"])
freq(dt_n[a1_w16!=12,"a1_w16"])

# Acculturation - Culture Maintenance ----
# 2016
freq(dt_h[,"c30_1.2016"])
freq(dt_e[a12016!=12,"c28_12016"])
freq(dt_n[a1_w16!=12,"c28_1_w16"])

freq(dt_h[,"c30_2.2016"])
freq(dt_e[a12016!=12,"c28_22016"])
freq(dt_n[a1_w16!=12,"c28_2_w16"])


# 2018
freq(dt_h[,"c30_1.2018"])
freq(dt_e[a12016!=12,"c28_12018"])
freq(dt_n[a1_w16!=12,"c28_1_w18"])

freq(dt_h[,"c30_2.2018"])
freq(dt_e[a12016!=12,"c28_22018"])
freq(dt_n[a1_w16!=12,"c28_2_w18"])

# 2021
freq(dt_e[a12016!=12,"c28_12021"])
freq(dt_n[a1_w16!=12,"c28_1_w21"])

freq(dt_e[a12016!=12,"c28_22021"])
freq(dt_n[a1_w16!=12,"c28_2_w21"])



# Acculturation, Contact ----
# 2016
freq(dt_h[,"c30_5.2016"])
freq(dt_e[a12016!=12,"c28_52016"])
freq(dt_n[a1_w16!=12,"c28_5_w16"])

freq(dt_h[,"c30_6.2016"])
freq(dt_e[a12016!=12,"c28_62016"])
freq(dt_n[a1_w16!=12,"c28_6_w16"])

# 2018
freq(dt_h[,"c30_5.2018"])
freq(dt_e[a12016!=12,"c28_52018"])
freq(dt_n[a1_w16!=12,"c28_5_w18"])

freq(dt_h[,"c30_6.2018"])
freq(dt_e[a12016!=12,"c28_62018"])
freq(dt_n[a1_w16!=12,"c28_6_w18"])

# 2021
freq(dt_e[a12016!=12,"c28_52021"])
freq(dt_n[a1_w16!=12,"c28_5_w21"])

freq(dt_e[a12016!=12,"c28_62021"])
freq(dt_n[a1_w16!=12,"c28_6_w21"])

# Pigmentation ----
# 2016
freq(dt_h[,"a10.2016"])
freq(dt_e[a12016!=12,"a112016"])
freq(dt_n[a1_w16!=12,"a11_w16"])

# 2018
freq(dt_h[,"a10.2018"])
freq(dt_e[a12016!=12,"a112018"])
freq(dt_n[a1_w16!=12,"a11_w18"])

# Perception personal discrimination ----
# 2016
freq(dt_h[,"e6_1.2016"])
freq(dt_e[a12016!=12,"e6_12016"])
freq(dt_n[a1_w16!=12,"e6_1_w16"])

freq(dt_h[,"e6_2.2016"])
freq(dt_e[a12016!=12,"e6_22016"])
freq(dt_n[a1_w16!=12,"e6_2_w16"])

freq(dt_h[,"e6_3.2016"])
freq(dt_e[a12016!=12,"e6_32016"])
freq(dt_n[a1_w16!=12,"e6_3_w16"])

freq(dt_h[,"e6_4.2016"])
freq(dt_e[a12016!=12,"e6_42016"])
freq(dt_n[a1_w16!=12,"e6_4_w16"])

freq(dt_h[,"e6_5.2016"])
freq(dt_e[a12016!=12,"e6_52016"])
freq(dt_n[a1_w16!=12,"e6_5_w16"])

freq(dt_h[,"e6_6.2016"])
freq(dt_e[a12016!=12,"e6_62016"])
freq(dt_n[a1_w16!=12,"e6_6_w16"])

# 2018
freq(dt_h[,"e6_1.2018"])
freq(dt_e[a12016!=12,"e6_12018"])
freq(dt_n[a1_w16!=12,"e6_1_w18"])

freq(dt_h[,"e6_2.2018"])
freq(dt_e[a12016!=12,"e6_22018"])
freq(dt_n[a1_w16!=12,"e6_2_w18"])

freq(dt_h[,"e6_3.2018"])
freq(dt_e[a12016!=12,"e6_32018"])
freq(dt_n[a1_w16!=12,"e6_3_w18"])

freq(dt_h[,"e6_4.2018"])
freq(dt_e[a12016!=12,"e6_42018"])
freq(dt_n[a1_w16!=12,"e6_4_w18"])

freq(dt_h[,"e6_5.2018"])
freq(dt_e[a12016!=12,"e6_52018"])
freq(dt_n[a1_w16!=12,"e6_5_w18"])

freq(dt_h[,"e6_6.2018"])
freq(dt_e[a12016!=12,"e6_62018"])
freq(dt_n[a1_w16!=12,"e6_6_w18"])

# Social support ----
# 2016
freq(dt_h[,"g3_1.2016"])
freq(dt_e[a12016!=12,"g4_12016"])
freq(dt_n[a1_w16!=12,"g4_1_w16"])

freq(dt_h[,"g3_2.2016"])
freq(dt_e[a12016!=12,"g4_22016"])
freq(dt_n[a1_w16!=12,"g4_2_w16"])

freq(dt_h[,"g3_3.2016"])
freq(dt_e[a12016!=12,"g4_32016"])
freq(dt_n[a1_w16!=12,"g4_3_w16"])

freq(dt_h[,"g3_4.2016"])
freq(dt_e[a12016!=12,"g4_42016"])
freq(dt_n[a1_w16!=12,"g4_4_w16"])

freq(dt_h[,"g3_5.2016"])
freq(dt_e[a12016!=12,"g4_52016"])
freq(dt_n[a1_w16!=12,"g4_5_w16"])

freq(dt_h[,"g3_6.2016"])
freq(dt_e[a12016!=12,"g4_62016"])
freq(dt_n[a1_w16!=12,"g4_6_w16"])

freq(dt_h[,"g3_7.2016"])
freq(dt_e[a12016!=12,"g4_72016"])
freq(dt_n[a1_w16!=12,"g4_7_w16"])

freq(dt_h[,"g3_8.2016"])
freq(dt_e[a12016!=12,"g4_82016"])
freq(dt_n[a1_w16!=12,"g4_8_w16"])

freq(dt_h[,"g3_9.2016"])
freq(dt_e[a12016!=12,"g4_92016"])
freq(dt_n[a1_w16!=12,"g4_9_w16"])

# 2018
freq(dt_h[,"g3_1.2018"])
freq(dt_e[a12016!=12,"g4_12018"])
freq(dt_n[a1_w16!=12,"g4_1_w18"])

freq(dt_h[,"g3_2.2018"])
freq(dt_e[a12016!=12,"g4_22018"])
freq(dt_n[a1_w16!=12,"g4_2_w18"])

freq(dt_h[,"g3_3.2018"])
freq(dt_e[a12016!=12,"g4_32018"])
freq(dt_n[a1_w16!=12,"g4_3_w18"])

freq(dt_h[,"g3_4.2018"])
freq(dt_e[a12016!=12,"g4_42018"])
freq(dt_n[a1_w16!=12,"g4_4_w18"])

freq(dt_h[,"g3_5.2018"])
freq(dt_e[a12016!=12,"g4_52018"])
freq(dt_n[a1_w16!=12,"g4_5_w18"])

freq(dt_h[,"g3_6.2018"])
freq(dt_e[a12016!=12,"g4_62018"])
freq(dt_n[a1_w16!=12,"g4_6_w18"])

freq(dt_h[,"g3_7.2018"])
freq(dt_e[a12016!=12,"g4_72018"])
freq(dt_n[a1_w16!=12,"g4_7_w18"])

freq(dt_h[,"g3_8.2018"])
freq(dt_e[a12016!=12,"g4_82018"])
freq(dt_n[a1_w16!=12,"g4_8_w18"])

freq(dt_h[,"g3_9.2018"])
freq(dt_e[a12016!=12,"g4_92018"])
freq(dt_n[a1_w16!=12,"g4_9_w18"])

# 2021
freq(dt_e[a12016!=12,"g4_12021"])
freq(dt_n[a1_w16!=12,"g4_1_w21"])

freq(dt_e[a12016!=12,"g4_22021"])
freq(dt_n[a1_w16!=12,"g4_2_w21"])

freq(dt_e[a12016!=12,"g4_32021"])
freq(dt_n[a1_w16!=12,"g4_3_w21"])

freq(dt_e[a12016!=12,"g4_42021"])
freq(dt_n[a1_w16!=12,"g4_4_w21"])

freq(dt_e[a12016!=12,"g4_52021"])
freq(dt_n[a1_w16!=12,"g4_5_w21"])

freq(dt_e[a12016!=12,"g4_62021"])
freq(dt_n[a1_w16!=12,"g4_6_w21"])

freq(dt_e[a12016!=12,"g4_72021"])
freq(dt_n[a1_w16!=12,"g4_7_w21"])

freq(dt_e[a12016!=12,"g4_82021"])
freq(dt_n[a1_w16!=12,"g4_8_w21"])

freq(dt_e[a12016!=12,"g4_92021"])
freq(dt_n[a1_w16!=12,"g4_9_w21"])

# Depression ----
# 2016
freq(dt_h[,"g4_1.2016"])
freq(dt_e[a12016!=12,"g5_12016"])
freq(dt_n[a1_w16!=12,"g5_1_w16"])

freq(dt_h[,"g4_2.2016"])
freq(dt_e[a12016!=12,"g5_22016"])
freq(dt_n[a1_w16!=12,"g5_2_w16"])

freq(dt_h[,"g4_3.2016"])
freq(dt_e[a12016!=12,"g5_32016"])
freq(dt_n[a1_w16!=12,"g5_3_w16"])

freq(dt_h[,"g4_4.2016"])
freq(dt_e[a12016!=12,"g5_42016"])
freq(dt_n[a1_w16!=12,"g5_4_w16"])

freq(dt_h[,"g4_5.2016"])
freq(dt_e[a12016!=12,"g5_52016"])
freq(dt_n[a1_w16!=12,"g5_5_w16"])

freq(dt_h[,"g4_6.2016"])
freq(dt_e[a12016!=12,"g5_62016"])
freq(dt_n[a1_w16!=12,"g5_6_w16"])

freq(dt_h[,"g4_7.2016"])
freq(dt_e[a12016!=12,"g5_72016"])
freq(dt_n[a1_w16!=12,"g5_7_w16"])

freq(dt_h[,"g4_8.2016"])
freq(dt_e[a12016!=12,"g5_82016"])
freq(dt_n[a1_w16!=12,"g5_8_w16"])

freq(dt_h[,"g4_9.2016"])
freq(dt_e[a12016!=12,"g5_92016"])
freq(dt_n[a1_w16!=12,"g5_9_w16"])

# 2018
freq(dt_h[,"g4_1.2018"])
freq(dt_e[a12016!=12,"g5_12018"])
freq(dt_n[a1_w16!=12,"g5_1_w18"])

freq(dt_h[,"g4_2.2018"])
freq(dt_e[a12016!=12,"g5_22018"])
freq(dt_n[a1_w16!=12,"g5_2_w18"])

freq(dt_h[,"g4_3.2018"])
freq(dt_e[a12016!=12,"g5_32018"])
freq(dt_n[a1_w16!=12,"g5_3_w18"])

freq(dt_h[,"g4_4.2018"])
freq(dt_e[a12016!=12,"g5_42018"])
freq(dt_n[a1_w16!=12,"g5_4_w18"])

freq(dt_h[,"g4_5.2018"])
freq(dt_e[a12016!=12,"g5_52018"])
freq(dt_n[a1_w16!=12,"g5_5_w18"])

freq(dt_h[,"g4_6.2018"])
freq(dt_e[a12016!=12,"g5_62018"])
freq(dt_n[a1_w16!=12,"g5_6_w18"])

freq(dt_h[,"g4_7.2018"])
freq(dt_e[a12016!=12,"g5_72018"])
freq(dt_n[a1_w16!=12,"g5_7_w18"])

freq(dt_h[,"g4_8.2018"])
freq(dt_e[a12016!=12,"g5_82018"])
freq(dt_n[a1_w16!=12,"g5_8_w18"])

freq(dt_h[,"g4_9.2018"])
freq(dt_e[a12016!=12,"g5_92018"])
freq(dt_n[a1_w16!=12,"g5_9_w18"])

# 2021
## v1
freq(dt_e[a12016!=12,"g5_1_v12021"])
freq(dt_n[a1_w16!=12,"g5_1_v1_w21"])

freq(dt_e[a12016!=12,"g5_2_v12021"])
freq(dt_n[a1_w16!=12,"g5_2_v1_w21"])

freq(dt_e[a12016!=12,"g5_3_v12021"])
freq(dt_n[a1_w16!=12,"g5_3_v1_w21"])

freq(dt_e[a12016!=12,"g5_4_v12021"])
freq(dt_n[a1_w16!=12,"g5_4_v1_w21"])

freq(dt_e[a12016!=12,"g5_5_v12021"])
freq(dt_n[a1_w16!=12,"g5_5_v1_w21"])

freq(dt_e[a12016!=12,"g5_6_v12021"])
freq(dt_n[a1_w16!=12,"g5_6_v1_w21"])

freq(dt_e[a12016!=12,"g5_7_v12021"])
freq(dt_n[a1_w16!=12,"g5_7_v1_w21"])

freq(dt_e[a12016!=12,"g5_8_v12021"])
freq(dt_n[a1_w16!=12,"g5_8_v1_w21"])

freq(dt_e[a12016!=12,"g5_9_v12021"])
freq(dt_n[a1_w16!=12,"g5_9_v1_w21"])

## v2
freq(dt_e[a12016!=12,"g5_1_v22021"])
freq(dt_n[a1_w16!=12,"g5_1_v2_w21"])

freq(dt_e[a12016!=12,"g5_2_v22021"])
freq(dt_n[a1_w16!=12,"g5_2_v2_w21"])

freq(dt_e[a12016!=12,"g5_3_v22021"])
freq(dt_n[a1_w16!=12,"g5_3_v2_w21"])

freq(dt_e[a12016!=12,"g5_4_v22021"])
freq(dt_n[a1_w16!=12,"g5_4_v2_w21"])

freq(dt_e[a12016!=12,"g5_5_v22021"])
freq(dt_n[a1_w16!=12,"g5_5_v2_w21"])

freq(dt_e[a12016!=12,"g5_6_v22021"])
freq(dt_n[a1_w16!=12,"g5_6_v2_w21"])

freq(dt_e[a12016!=12,"g5_7_v22021"])
freq(dt_n[a1_w16!=12,"g5_7_v2_w21"])

freq(dt_e[a12016!=12,"g5_8_v22021"])
freq(dt_n[a1_w16!=12,"g5_8_v2_w21"])

freq(dt_e[a12016!=12,"g5_9_v22021"])
freq(dt_n[a1_w16!=12,"g5_9_v2_w21"])


