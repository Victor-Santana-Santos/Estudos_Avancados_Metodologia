# EXERCÍCIO QUI-QUADRADO

library(data.table)
library(ggplot2)

# AGORA, A BASE DE DADOS CAR EVALUATION #
breast_cancer <- fread('https://raw.githubusercontent.com/hugoavmedeiros/cp_com_r/master/bases_tratadas/breast_cancer.csv', stringsAsFactors = T)

# TABELA DE CONTINGÊNCIA #
breast_cancer_table <- table(breast_cancer$breast, breast_cancer$idade)
breast_cancer_table

# GRÁFICOS DE DISPERSÃO PAREADOS DAS VARIÁVEIS #
ggplot(breast_cancer) + aes(x = idade, fill = breast) + geom_bar(position = "fill")

# TESTE QUI QUADRADO #
breast_cancer_test <- chisq.test(breast_cancer_table)
breast_cancer_test
breast_cancer_test$observed
breast_cancer_test$expected

# CORRPLOT DAS VARIÁVEIS #
corrplot(breast_cancer_test$residuals, is.cor = FALSE)
