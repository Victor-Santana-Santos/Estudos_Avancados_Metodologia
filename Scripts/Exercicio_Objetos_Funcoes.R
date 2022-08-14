# Objetos e funções no R

# Objetos simples

Vetor <- c(1:10)

str(Vetor)

# Função e objeto complexo

library(datasets)

Iris_1 <- iris

str(Iris_1)

regIris <- lm(Sepal.Length ~ Petal.Length, Iris_1)


str(regIris)