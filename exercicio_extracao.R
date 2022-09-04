# EXERCÍCIO EXTRAÇÃO

for (itm in ls()) { 
  print(formatC(c(itm, object.size(get(itm))), 
                format="d", 
                width=30), 
        quote=F)
}

# Os objetos mais pesados são a base unificada, seguida da base relativa ao ano de 2019.

# Remoção de objetos desnecessários

rm(list = c('sinistrosRecife2020Raw', 'sinistrosRecife2021Raw', 
            'sinistrosRecife2019Raw', 'colunas_iguais', 'colunas_iguais_2'))

