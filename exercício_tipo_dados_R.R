# EXERCÍCIO TIPO DE DADOS NO R

# Criação de fatores

Gênero <- factor(c("F", "M", "F", "M", "F", "M"))
levels(Gênero)

Idade <- c(57, 50, 87, 86, 76, 75)

Nome <- c("Lêda", "Emerson", "Arlette", "Leal", "Udjanir", "Enock")

Nascimento <- factor(c("AL", "RJ", "AM", "AL", "RJ", "SE"))
levels(Nascimento)

Nível <- factor(c("Mãe", "Pai", "Avó", "Avô", "Avó", "Avô"))

Família <- data.frame(Nome, Idade, Nascimento, Gênero, Nível)
