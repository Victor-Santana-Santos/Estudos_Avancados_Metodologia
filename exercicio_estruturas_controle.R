# EXERCÍCIO: ESTRUTURAS DE CONTROLE

# Condicional

TitanicCopia <- as.data.frame(Titanic)

TitanicCopia$CrewDummy <- ifelse(TitanicCopia$Class == 'Crew', 1, 0)

str(TitanicCopia)
