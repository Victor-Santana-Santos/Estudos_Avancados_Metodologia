# EXERCÍCIO: AGRUPAMENTO

# carregar as bibliotecas
pacman::p_load(cluster, dplyr, factoextra, ggplot2)

USArrests

# pré-processamento
usArrests_cluster <- USArrests
str(usArrests_cluster)

# definir semente aleatória
set.seed(1)

# Método do Cotovelo
fviz_nbclust(usArrests_cluster, kmeans, method = "wss")

# O gráfico apresentou um padrão estranho, mas eu assumi o 4 como o número ideal.

# Agrupamento com kmeans
cls <- kmeans(x = usArrests_cluster, centers = 4) # aprendizagem ns
usArrests_cluster$cluster <- as.factor(cls$cluster) # passamos os clusters para a base original
head(usArrests_cluster)

# plot com função própria do pacote
clusplot(usArrests_cluster, cls$cluster, xlab = 'Fator1', ylab = 'Fator2', main = 'Agrupamento Estados EUA', lines = 0, shade = F, color = TRUE, labels = 2)

# Como não conheço a base em detalhes, é difícil interpretar o gráfico,
# mas, percebe-se que os estados com menores índices de violência estão 
# mais à esquerda do gráfico, assim como os estados com uma baixa quantidade
# de população urbana.Estes provavelmente compõem o cluster 2. Os outros clusters
# são de mais difícil definição.