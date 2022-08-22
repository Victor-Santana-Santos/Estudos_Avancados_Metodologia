# EXERCÍCIO: Tipos de objetos

library(eeptools)

# Criação de vetores

Estados <- c("Alagoas", "Bahia", "Ceará", "Maranhão", "Paraíba", "Pernambuco",
             "Piauí", "Rio Grande do Norte", "Sergipe")

Sigla <- c("AL", "BA", "CE", "MA", "PB", "PE", "PI", "RN", "SE")

Area <- c(27843.295, 564760.427, 148894.441, 329642.182, 56467.242, 98067.881, 
          251756.515, 52809.602, 21925.424)

Populacao <- c(3365351, 14985284, 9240580, 7153262, 4059905, 9674793, 3289290,
               3560903, 2338474)

PIB <- c(58964000, 293241000, 163575000, 97340000, 67986000, 197853000, 
         52781000, 71337000, 44689000)

# Dataframe

EstadosNE <- data.frame(
  Estados = Estados,
  Sigla = Sigla,
  Area = Area,
  Populacao = Populacao,
  PIB = PIB
)
