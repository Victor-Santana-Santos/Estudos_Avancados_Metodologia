# EXERCÍCIO: SIMULAÇÕES E SEQUÊNCIAS

# Distribuição normal

distNormalSimulacao <- rnorm(200)
summary(distNormalSimulacao)

# distribuição binomial
distBinominalSimulacao <- rbinom(200, 1, 0.75) 

# sequências
indexSimulacao <- seq(2, length(distNormalSimulacao))
