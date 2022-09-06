# EXERCÍCIO ESTRUTURAÇÃO DE DADOS

library(data.table)
library(dplyr)
library(tidyverse)
library(textshape)

general_data<-fread("https://covid.ourworldindata.org/data/owid-covid-data.csv") # carrega dados de covid19 no mundo

north_america_countries<-c("Canada", "Mexico", "United States")

north_america<- general_data %>% filter(location %in% north_america_countries) 

mNorth <- north_america %>% group_by(location) %>% mutate(row = row_number()) %>% select(location, new_cases, row)

result <- mNorth %>% group_by(location) %>% filter(row == max(row))
mNorth <- mNorth %>% filter(row<=min(result$row)) 

# pivota o data frame de long para wide
mNorthw <- mNorth %>% pivot_wider(names_from = row, values_from = new_cases) %>% remove_rownames %>% column_to_rownames(var="location") # Não entendi porque está dando erro 
