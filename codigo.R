library(tidyverse)

datos <- read_csv(file = "https://cnecovid.isciii.es/covid19/resources/casos_hosp_uci_def_sexo_edad_provres.csv",
                  na = "NC")

datos_madrid <-
  datos |> 
  drop_na(sexo) |> 
  filter(provincia_iso == "M" & fecha <= "2020-12-31") |> 
  select(fecha, sexo, grupo_edad, num_casos) |> 
  summarise(num_casos = sum(num_casos), .by = c(fecha, sexo))

write_csv(datos_madrid, file = "./datos_madrid.csv")
  