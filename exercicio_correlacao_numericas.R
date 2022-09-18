# CORRELAÇÃO VARIÁVEIS NUMÉRICAS

library(corrplot) 
library(dplyr)
library(ggplot2)

# TABELA DE CORRELAÇÃO COM TODAS AS VARIÁVEIS #
cor(USArrests)

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
pairs(USArrests)

# CORRPLOT DAS VARIÁVEIS #
USArrestsCor <- cor(USArrests)
corrplot(USArrestsCor, method = "number", order = 'alphabet')
corrplot(USArrestsCor, order = 'alphabet') 
