# EXERCÍCIO MÉTRICAS DE REGRESSÃO

melhor_modelo <- resamples(list(LM = ac_lm, RPART = ac_RPART, RF = ac_RF, ADABOOST = ac_ADA))
melhor_modelo

summary(melhor_modelo)

# De acordo com o erro médio, o melhor modelo é o da árvore de decisão.
# Contudo, a raiz quadrada do erro médio indica que o modelo da árvore de decisão tem
# uma maior variância. Por sua vez, o r-quadrado mais baixo foi justamente o modelo
# da árvore de decisão, por uma ampla diferença. Considerendo-se apenas o r-quadrado,
# os melhores modelos são o Bagging com a floresta aleatória e o Boosting. Por fim, 
# considerando-se o quadro geral, uma vez que a diferença entre os modelos não foi
# tão expressiva no MAE e no RMSE; julga-se que o melhor modelo seria o Bagging com
# floresta aleatória, por conta do bom ajuste do modelo. 