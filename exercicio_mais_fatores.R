# EXERCÍCIO MAIS FATORES

library(ade4)
library(arules)
library(forcats)

# One hot encoding

iris <- iris

iris_Factor <- as.factor(iris)

factors_Iris <- unlist(lapply(iris_Factor, is.factor))  
irisFactor <- iris[ , factors_Iris]
str(irisFactor)

iris_dummy <- acm.disjonctif(irisFactor)

# Frequência de fatores

Gênero <- factor(c("F", "M", "F", "M", "F", "M", "M", "M", "M"))
levels(Gênero)

Idade <- c(57, 50, 87, 86, 76, 75, 26, 23, 21)

Nome <- c("Lêda", "Emerson", "Arlette", "Leal", "Udjanir", "Enock", "Victor", "Caio", "Gabriel")

Nascimento <- factor(c("AL", "RJ", "AM", "AL", "RJ", "SE", "AL", "AL", "AL"))
levels(Nascimento)

Nível <- factor(c("Mãe", "Pai", "Avó", "Avô", "Avó", "Avô", "Filho", "Filho", "Filho"))

Familia <- data.frame(Nome, Idade, Nascimento, Gênero, Nível)

library(forcats)

fct_lump(Familia$Nível, n = 2)
