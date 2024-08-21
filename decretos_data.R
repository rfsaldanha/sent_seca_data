library(tidyverse)

decr <- read_delim(file = "decretos_marcel_seca(1).csv", delim = ";")

tab6 <- decr |>
  select(dt_portaria = Registro, desastre = COBRADE, n_portaria = Protocolo, cod6) |>
  mutate(dt_portaria = as_date(dt_portaria, format = "%d/%m/%Y")) |>
  mutate(desastre = substr(desastre, 9, 1000)) |>
  filter(desastre %in% c("Estiagem", "Seca")) |>
  mutate(desastre = toupper(desastre))

saveRDS(tab6, "tab6.rds")
