library(tidyverse)

datos <- read_csv(file = "https://cnecovid.isciii.es/covid19/resources/casos_hosp_uci_def_sexo_edad_provres.csv",
                  na = "NC")

datos_bcn <-
  datos |> 
  drop_na(sexo) |> 
  filter(provincia_iso == "B" & fecha <= "2020-12-31") |> 
  select(fecha, sexo, grupo_edad, num_casos) |> 
  summarise(num_casos = sum(num_casos), .by = c(fecha, sexo))

write_csv(datos_bcn, file = "./datos_bcn.csv")
  