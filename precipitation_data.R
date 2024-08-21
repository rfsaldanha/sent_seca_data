library(tidyverse)

prec <- read_delim(
  file = "dados_precipitacao.csv", 
  delim = ";"
)

names(prec) <- c("cod6", "year_month", "value", "uf", "uf_label")

tab1 <- prec |>
  select(-uf, -uf_label) |>
  arrange(cod6, year_month) |>
  pivot_wider(names_from = year_month, values_from = value) |>
  mutate(cod6 = as.integer(cod6))

saveRDS(tab1, "tab1.rds")
