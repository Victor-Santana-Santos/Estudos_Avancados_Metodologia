install.packages("bbl")

library(bbl)

TitanicCopia <- as.data.frame(Titanic)

TitanicCopia <- freq2raw(data=TitanicCopia[,1:4], freq=TitanicCopia$Freq)

str(TitanicCopia)

par(mfrow = c(2, 2)) 

sapply(TitanicCopia[ , 1:4], plot)

# Estrutura de controle

for (i in 1:4) { 
  x <- TitanicCopia[ ,i] 
  plot(x,
       main = names(TitanicCopia)[i], 
       xlab = "Categorias da Variável", 
       ylab = 'Frequência',) 
}
