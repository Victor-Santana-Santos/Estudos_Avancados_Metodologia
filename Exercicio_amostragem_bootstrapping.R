# EXERCÍCIO: AMOSTRAGEM E BOOTSTRAPPING

# BOOTSTRAPPING

set.seed(1000)

bootsDistNormal20 <- replicate(20, sample(distNormalSimulacao, 20, replace = TRUE))
bootsDistNormal20
