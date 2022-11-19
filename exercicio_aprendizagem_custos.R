# EXERCÍCIO: APRENDIZAGEM COM CUSTOS

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

# A variável é desbalançeada mas não tanto como a do exemplo que o professor usou.

# Validação Cruzada: Pré-processamento
# Controle de treinamento
train.control <- trainControl(method = "cv", number = 10, verboseIter = T) # controle de treino

matrizCusto <- matrix(c(0,10,100,0), ncol = 2) #Troquei as penalidades pelo fato da variável ser menos desbalançeada
rownames(matrizCusto) <- levels(treino_ataque_cardiaco$DEATH_EVENT)
colnames(matrizCusto) <- levels(treino_ataque_cardiaco$DEATH_EVENT)
matrizCusto

treino_ataque_cardiaco$DEATH_EVENT <- as.factor(treino_ataque_cardiaco$DEATH_EVENT)

ac_RF_CLASS <- randomForest(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "cforest", parms = list(loss = matrizCusto))
ac_RF_CLASS

# Aparentemente, a máquina está errando bastante ao prever a variável, 
# especialmente no caso de pessoas que faleceram (sendo computadas como se não tivessem falecido)

ac_C5_CLASS <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "C5.0Cost", trControl = train.control)
ac_C5_CLASS

predicao_ac_RF_CLASS = predict(ac_RF_CLASS, teste_ataque_cardiaco) # criar predição
cm_ac_RF_CLASS <- confusionMatrix(as.factor(predicao_ac_RF_CLASS), as.factor(teste_ataque_cardiaco$DEATH_EVENT))
cm_ac_RF_CLASS

predicao_ac_C5_CLASS = predict(ac_C5_CLASS, teste_ataque_cardiaco) # criar predição
cm_ac_C5_CLASS <- confusionMatrix(as.factor(predicao_ac_C5_CLASS), as.factor(teste_ataque_cardiaco$DEATH_EVENT))
cm_ac_C5_CLASS

# Claramente, a base que eu escolhi não é boa para testar aprendizagem de máquina.
# Acurácia e Kappa muito baixos em ambos os testes. No modelo próprio da função
# caret, consegui a proeza do kappa ser igual a zero. 