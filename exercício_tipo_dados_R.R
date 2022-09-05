# EXERCÍCIO TIPO DE DADOS NO R

# Criação de fatores

Gênero <- factor(c("F", "M", "F", "M", "F", "M", "M", "M", "M"))
levels(Gênero)

Idade <- c(57, 50, 87, 86, 76, 75, 26, 23, 21)

Nome <- c("Lêda", "Emerson", "Arlette", "Leal", "Udjanir", "Enock", "Victor", "Caio", "Gabriel")

Nascimento <- factor(c("AL", "RJ", "AM", "AL", "RJ", "SE", "AL", "AL", "AL"))
levels(Nascimento)

Nível <- factor(c("Mãe", "Pai", "Avó", "Avô", "Avó", "Avô", "Filho", "Filho", "Filho"))

Familia <- data.frame(Nome, Idade, Nascimento, Gênero, Nível)
