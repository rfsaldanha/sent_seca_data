rm(list = ls())

load(file = "dados_sent_seca_original.RData")

rm(tab7, tab6, tab5, tab4, tab2, tab1)

tab7 <- readRDS("tab7.rds")
tab6 <- readRDS("tab6.rds")
tab5 <- readRDS("tab5.rds")
tab4 <- readRDS("tab4.rds")
tab2 <- readRDS("tab2.rds")
tab1 <- readRDS("tab1.rds")

save.image("../sent_seca/dados_sent_seca_v2.RData")
