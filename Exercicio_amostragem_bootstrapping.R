# EXERCÍCIO: AMOSTRAGEM E BOOTSTRAPPING

# BOOTSTRAPPING

distNormalSimulacao <- rnorm(100) 

set.seed(1000)

bootsDistNormal20 <- replicate(20, sample(distNormalSimulacao, 20, replace = TRUE))
bootsDistNormal20
