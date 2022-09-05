# EXERCÍCIO LEITURA

# RESPOSTA: Arquivos .csv tem a vantagem da interoperabilidade. Por outro lado,
#           eles ocpuam mais espaço e sua leitura é menos eficiente. Já arquivos 
#           .rds ocupam menos espaço, e portanto, tem uma leitura mais eficiente.
#           Contudo, sua linguagem é própria para R e isso impossibilita a inter-
#           operabilidade com outras linguagens.

library(microbenchmark)

# exporta em formato nativo do R
saveRDS(ciclovias_Recife, "bases_tratadas/ciclovias_Recife.rds")

# exporta em formato tabular (.csv) - padrão para interoperabilidade
write.csv2(ciclovias_Recife, "bases_tratadas/ciclovias_Recife.csv")

# carrega base de dados em formato nativo R
ciclovias_Recife <- readRDS('bases_tratadas/ciclovias_Recife.rds')

# carrega base de dados em formato tabular (.csv) - padrão para interoperabilidade
ciclovias_Recife <- read.csv2('bases_tratadas/ciclovias_Recife.csv', sep = ';')

# compara os dois processos de exportação, usando a função microbenchmark

microbenchmark(a <- saveRDS(ciclovias_Recife, "bases_tratadas/ciclovias_Recife.rds"), b <- write.csv2(ciclovias_Recife, "bases_tratadas/ciclovias_Recife.csv"), times = 10L)

microbenchmark(a <- readRDS('bases_tratadas/ciclovias_Recife.rds'), b <- read.csv2('bases_tratadas/ciclovias_Recife.csv', sep = ';'), times = 10L)

