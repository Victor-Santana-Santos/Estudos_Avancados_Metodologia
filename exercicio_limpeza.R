# EXERCÍCIO LIMPEZA

library(data.table)
library(dplyr)
library(tidyverse)
library(funModeling) 

# NÃO SEI PORQUE ESTÁ DANDO ERRO, SE SÓ FIZ COPIAR O SCRIPT DO GITHUB... o erro
# que está aparecendo é: Error in h(simpleError(msg, call)) : 
# erro na avaliação do argumento 'x' na seleção do método para a função '%in%': 'object 'location' not found'

general_data <- fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

latin_america_countries <-c("Argentina", "Brazil", "Bolivia", "Chile", "Colombia", "Costa Rica", "Cuba", "Dominican Republic", "Ecuador", "El Salvador", "Guatemala", "Haiti", "Honduras", "Mexico", "Nicaragua", "Panama", "Paraguay", "Peru", "Uruguay", "Venezuela") # vetor que identifica países latino americanos

latin_america <- general_data %>% filter(location %in% latin_america_countries) # filtra casos apenas no vetor

latin_america <- latin_america %>% select(location, new_cases, new_deaths)

status(latin_america) # estrutura dos dados (missing etc)
freq(latin_america) # frequência das variáveis fator
plot_num(latin_america) # exploração das variáveis numéricas
profiling_num(latin_america) # estatísticas das variáveis numéricas

latin_america %>% filter(new_cases < 0)

# Remoção de NAs


latin_america <- latin_america %>% filter(new_cases>=0)