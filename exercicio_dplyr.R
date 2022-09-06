# EXERCÍCIO DPLYR

library(dplyr)

# sumários
count(iris, Species) 

# sumários com agrupamentos
iris %>% group_by(Species) %>% summarise(avg = mean(Sepal.Length))

# Manipulação de casos
arrange(iris, Sepal.Length) 

# Transformação de Variáveis

iris %>% mutate(Proportion.Sepal.Petal.Length = Sepal.Length/Petal.Length)