# EXERCÍCIO: BALANCEAMENTO

# carrega as bibliotecas
pacman::p_load(ade4, arules, car, caret, corrplot, data.table, dplyr, DMwR, e1071, forcats, funModeling, ggplot2, mlbench, mltools, randomForest, rattle, tidyverse)

# Carregando a base

ataque_cardiaco <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv', stringsAsFactors = T)

prop.table(table(ataque_cardiaco$DEATH_EVENT))

ataque_cardiaco$DEATH_EVENT <- as.factor(ataque_cardiaco$DEATH_EVENT)

# NÃO PRECISEI DISCRETIZAR PORQUE A VARIÁVEL JÁ É BINÁRIA

# Treino e Teste: Pré-processamento
particao_ataque_cardiaco = createDataPartition(ataque_cardiaco$DEATH_EVENT, p=.7, list = F) # cria a partição 70-30
treino_ataque_cardiaco = ataque_cardiaco[particao_ataque_cardiaco, ] # treino
teste_ataque_cardiaco = ataque_cardiaco[-particao_ataque_cardiaco, ] # - treino = teste

table(treino_ataque_cardiaco$DEATH_EVENT)

# up
treino_ataque_cardiaco_up <- upSample(x = treino_ataque_cardiaco[, -ncol(treino_ataque_cardiaco)], y = treino_ataque_cardiaco$DEATH_EVENT)
table(treino_ataque_cardiaco_up$Class) 
