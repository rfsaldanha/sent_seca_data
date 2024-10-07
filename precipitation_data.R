library(tidyverse)

# Read old data
load(file = "dados_sent_seca_original.RData")
objects <- ls()
objects <- objects[!objects == "tab1"]
rm(list = objects)
rm(objects)

# Filter 2000 data
tab1_filter <- tab1 |>
  select(cod6, starts_with("2000"))
rm(tab1)

# Read new data
prec <- read_delim(
  file = "dados_precipitacao.csv", 
  delim = ";"
)

# Set names
names(prec) <- c("cod6", "year_month", "value", "uf", "uf_label")

# Prepare file
prec <- prec |>
  select(-uf, -uf_label) |>
  arrange(cod6, year_month) |>
  pivot_wider(names_from = year_month, values_from = value) |>
  mutate(cod6 = as.integer(cod6))

tab1 <- inner_join(tab1_filter, prec, by = "cod6")

# Save
saveRDS(tab1, "tab1.rds")
