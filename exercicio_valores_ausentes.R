# EXERCÍCIO: VALORES AUSENTES

# carregando pacotes
pacman::p_load(data.table, funModeling, tidyverse) 

## identificando e removendo valores ausentes
status(airquality) # estrutura dos dados (missing etc)

## estimando se o NA é MCAR, MAR ou MANR
# shadow matrix 
airquality_new <- as.data.frame(abs(is.na(airquality)))

airquality_new

# mantém apenas as variáveis com NA
airquality_NA <- airquality_new[which(sapply(airquality_new, sd) > 0)] 

# calcula correlações
round(cor(airquality_NA), 3) 

### Correlação baixíssima entre as variáveis

# busca padrões entre os valores específicos das variáveis e os NA
cor(airquality, airquality_NA, use="pairwise.complete.obs")

### A distribuição de NAs parece ser aleatória na amostra