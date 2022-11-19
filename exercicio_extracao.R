# EXERCÍCIO EXTRAÇÃO

## Inclusão do código anterior

## Cópia do script do github

pacman::p_load(dplyr)

sinistrosRecife2019Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/3531bafe-d47d-415e-b154-a881081ac76c/download/acidentes-2019.csv', sep = ';', encoding = 'UTF-8')

# carrega a base de sinistros de trânsito do site da PCR
sinistrosRecife2020Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/fc1c8460-0406-4fff-b51a-e79205d1f1ab/download/acidentes_2020-novo.csv', sep = ';', encoding = 'UTF-8')

sinistrosRecife2021Raw <- read.csv2('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

# junta as bases de dados com comando rbind (juntas por linhas)
colunas_iguais <- names(sinistrosRecife2020Raw[
  intersect(
    names(sinistrosRecife2020Raw), names(sinistrosRecife2021Raw))])

sinistrosRecife2020Raw <- sinistrosRecife2020Raw %>% select(all_of(colunas_iguais))

sinistrosRecifeRaw <- rbind(sinistrosRecife2020Raw, sinistrosRecife2021Raw)

# observa a estrutura dos dados
str(sinistrosRecifeRaw)

# modifca a data para formato date
sinistrosRecifeRaw$data <- as.Date(sinistrosRecifeRaw$data, format = "%Y-%m-%d")

# modifica natureza do sinistro de texto para fator
sinistrosRecifeRaw$natureza_acidente <- as.factor(sinistrosRecifeRaw$natureza_acidente)

# cria função para substituir not available (na) por 0
naZero <- function(x) {
  x <- ifelse(is.na(x), 0, x)
}

# aplica a função naZero a todas as colunas de contagem
sinistrosRecifeRaw[, 15:25] <- sapply(sinistrosRecifeRaw[, 15:25], naZero)

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrÃ£o para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

## EXERCÍCIO

## ADICIONANDO 2019 AO DATAFRAME

names(sinistrosRecife2019Raw)[names(sinistrosRecife2019Raw) == 'DATA'] <- 'data'

colunas_iguais_2 <- names(sinistrosRecifeRaw[
  intersect(
    names(sinistrosRecifeRaw), names(sinistrosRecife2019Raw))])

sinistrosRecife2019Raw <- sinistrosRecife2019Raw %>% select(all_of(colunas_iguais))

sinistrosRecife2019Raw$data <- as.Date(sinistrosRecife2019Raw$data, format = "%Y-%m-%d")

sinistrosRecife2019Raw$natureza_acidente <- as.factor(sinistrosRecife2019Raw$natureza_acidente)

sinistrosRecifeRaw_2 <- rbind(sinistrosRecife2019Raw, sinistrosRecifeRaw)

sinistrosRecifeRaw_2[, 15:25] <- sapply(sinistrosRecifeRaw_2[, 15:25], naZero)

## TRANSFORMANDO OUTRA COLUNA EM FATOR

sinistrosRecifeRaw_2$bairro <- as.factor(sinistrosRecifeRaw_2$bairro)

## SALVANDO BASE

# exporta em formato nativo do R
saveRDS(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.rds")

# exporta em formato tabular (.csv) - padrÃ£o para interoperabilidade
write.csv2(sinistrosRecifeRaw, "bases_tratadas/sinistrosRecife.csv")

## Extração

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# Os objetos mais pesados são a base unificada, seguida da base relativa ao ano de 2019.

# Remoção de objetos desnecessários

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 
            'sinistrosRecife2019Raw', 'colunas_iguais', 'colunas_iguais_2'))

