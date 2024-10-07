library(tidyverse)

# Load old NDVI data (200301 to 201608)
load(file = "dados_sent_seca_original.RData")
objects <- ls()
objects <- objects[!objects == "tab7"]
rm(list = objects)
rm(objects)

# Load new NDVI data
ndvi <- read_delim(file = "ndvi2016_2023.csv", delim = ";", locale = locale(decimal_mark = "."), na = "NA", col_types = cols(
  ndvi = col_double(),
  anomes = col_double(),
  codmun = col_double()
)) |>
  rename(valor = ndvi, tempo = anomes, cod6 = codmun) |>
  select(cod6, tempo, valor)

# Remove 2016 from old data
tab7_filter <- tab7 |>
  filter(!(substr(tempo, 0, 4) == 2016))

# Prepare new data file
rm(tab7)
tab7 <- bind_rows(tab7_filter, ndvi) |>
  arrange(cod6, tempo)

# Save
saveRDS(tab7, file = "tab7.rds")
