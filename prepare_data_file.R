rm(list = ls())

load(file = "dados_sent_seca_original.RData")

rm(tab5, tab4, tab2)

tab5 <- readRDS("tab5.rds")
tab4 <- readRDS("tab4.rds")
tab2 <- readRDS("tab2.rds")
tab1 <- readRDS("tab1.rds")

save.image("../sent_seca/dados_sent_seca_v2.RData")
