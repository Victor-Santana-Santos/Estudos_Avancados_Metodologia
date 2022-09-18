# EXERCÍCIO ESTATÍSTICA DESCRITIVA BÁSICA

### Estatística Descritiva com R
USArrests <- USArrests

mean(USArrests$Rape)

median(USArrests$Rape)

quantile(USArrests$Rape, probs=0.75)
quantile(USArrests$Rape, probs=0.10)
quantile(USArrests$Rape, probs=0.95)
boxplot(USArrests$Rape)

sd(USArrests$Rape)
plot(USArrests$Rape)

summary(USArrests)

pacman::p_load(fBasics)
basicStats(USArrests[ , c(1:4)])
hist(USArrests$Rape)
