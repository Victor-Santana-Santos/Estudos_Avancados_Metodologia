# EXERCÍCIO: IMPLEMENTAÇÃO COM CARET

install.packages("funModeling")

# carrega as bibliotecas
pacman::p_load(ade4, car, caret, corrplot, data.table, dplyr, forcats, funModeling, ggplot2, mlbench, mltools, randomForest, rattle, recipes, tidyverse)

# leitura da base de dados
ataque_cardiaco <- read.csv('https://archive.ics.uci.edu/ml/machine-learning-databases/00519/heart_failure_clinical_records_dataset.csv', stringsAsFactors = T)

# ATENÇÃO: Não foi preciso transformar a variável de interesse em dummy porque ela ja é uma variável desse tipo
# VARIÁVEL DE INTERESSE: DEATH_EVENT

# AED 
status(ataque_cardiaco) # explorar a qualidade das variáveis
freq(ataque_cardiaco) # explorar os fatores
plot_num(ataque_cardiaco) # exploração das variáveis numéricas
profiling_num(ataque_cardiaco) # estatísticas das variáveis numéricas

corrplot(cor(ataque_cardiaco[ , c("age", "anaemia", "diabetes", "ejection_fraction",
                                  "high_blood_pressure", "platelets", "sex", "smoking")])) # correlação entre as variáveis

# Treino e Teste: Pré-processamento
particao_ataque_cardiaco = createDataPartition(ataque_cardiaco$DEATH_EVENT, p=.7, list = F) # cria a partição 70-30
treino_ataque_cardiaco = ataque_cardiaco[particao_ataque_cardiaco, ] # treino
teste_ataque_cardiaco = ataque_cardiaco[-particao_ataque_cardiaco, ] # - treino = teste

# Validação Cruzada: Pré-processamento
# Controle de treinamento
train.control <- trainControl(method = "cv", number = 10, verboseIter = T) # controle de treino

# Treinamentos
## Regressão Linear
ac_lm <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "lm", trControl = train.control)
summary(ac_lm) # sumário do modelo linear
plot(varImp(ac_lm))

# Vou tentar com uma regressão logística, porque eu acho que ela será mais apropriada para o modelo
ac_glm <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "glm", trControl = train.control)
summary(ac_glm) # sumário do modelo logístico
plot(varImp(ac_glm))

# O gráfico não apresentou nenhuma alteração. Idade e quantidade de plaquetas continuam tendo a maior ordem de importância

## Árvore de Decisão
ac_RPART <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "rpart", trControl = train.control)

summary(ac_RPART)
fancyRpartPlot(ac_RPART$finalModel) # desenho da árvore
plot(varImp(ac_RPART)) # importância das variáveis

# Com a árvore de decisão, a variável plaquetas assumiu o primeiro grau de importância, contudo, é a variável idade a primeira a isolar as árvores de decisão, a partir da idade 71.

## Bagging com Floresta Aleatória
ac_RF <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "cforest", trControl = train.control)

plot(ac_RF) # evolução do modelo

# Percebe-se que o erro foi subindo à medida em que mais variáveis eram inseridas. 
# Nesse caso, a máquina escolhe o modelo com apenas duas variáveis para rodar suas predições? Não me parece ser uma boa escolha, uma vez que duas variáveis representa um conjunto baixo do total de variáveis do modelo.

plot(varImp(ac_RF)) # plot de importância

# Nesse terceiro modelo, as variáveis mais importantes continuaram sendo idade e plaquetas; contudo, o grau de importância de idade se destacou mais.

## Boosting com Boosted Generalized Linear Model
ac_ADA <- train(DEATH_EVENT ~ age + anaemia + diabetes + high_blood_pressure + platelets + sex + smoking, data = treino_ataque_cardiaco, method = "glmboost", trControl = train.control)

plot(ac_ADA) # evolução do modelo

# Percebe-se que a cada rodada, o erro foi subindo (?), o que não fez muito sentido pra mim. Talvez a base escolhida não seja a melhor para se testar tais modelos.

print(ac_ADA) # modelo
summary(ac_ADA) # sumário

melhor_modelo <- resamples(list(LM = ac_lm, RPART = ac_RPART, RF = ac_RF, ADABOOST = ac_ADA))
melhor_modelo

summary(melhor_modelo)

# Segundo a comparação das estatísticas MAEs, o modelo com o menor erro foi o da árvore de decisão.

predVals <- extractPrediction(list(ac_RPART), testX = teste_ataque_cardiaco[, c("age", "anaemia", "diabetes", "high_blood_pressure", "platelets", "sex", "smoking")], testY = teste_ataque_cardiaco$DEATH_EVENT) 

plotObsVsPred(predVals)

# Deu erro...