# EXERCÍCIO: IMPUTAÇÃO

# carrega os pacotes
pacman::p_load(data.table, Hmisc, VIM) 

## imputação numérica

str(airquality)

airquality_new <- airquality

# tendência central
airquality_new$Ozone <- impute(airquality_new$Ozone, fun = mean) # média

## não sei porque está dando erro (unused argument (fun = mean)), fiz igual o código do professor


# predição

reg_airquality <- lm(Ozone ~ ., data = airquality_new) # criamos a regressão
airqualityNAIndex <- is.na(airquality_new$Ozone) # localizamos os NA
airquality_new$Ozone[airqualityNAIndex] <- predict(reg_airquality, newdata = airquality_new[airqualityNAIndex, ]) # imputamos os valores preditos

status(airquality_new)

# Continuou com 2 NAs, não sei o porquê...

## Hot deck
# imputação por instâncias /semelhança
airquality_novo <- kNN(airquality)
