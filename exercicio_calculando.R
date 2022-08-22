# EXERCÍCIO: CALCULANDO

# Centralização de base de dados

poissonSimulacao <- rpois(500, 5)

hist(poissonSimulacao)

mean(poissonSimulacao)

median(poissonSimulacao)

sd(poissonSimulacao)

var(poissonSimulacao)

poissonSimulacaoCentral <- poissonSimulacao - mean(poissonSimulacao)

hist(poissonSimulacaoCentral)
