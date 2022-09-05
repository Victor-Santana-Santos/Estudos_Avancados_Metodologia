# EXERCÍCIO PRINCIPAIS FONTES PARA EXTRAÇÃO

# arquivos de texto com read.csv2
ciclovias_Recife <- read.csv2('http://dados.recife.pe.gov.br/dataset/667cb4cf-fc93-4687-bb8f-431550eeb2db/resource/575613ac-9660-4210-989c-eed4255d400c/download/detalhamentocicloviario2022-08.csv', sep = ';', encoding = 'UTF-8'
)

# arquivos json

library(rjson)

ciclovias_Recife_Metadados <- fromJSON(file= "http://dados.recife.pe.gov.br/dataset/667cb4cf-fc93-4687-bb8f-431550eeb2db/resource/985e58e2-df0b-4d29-a938-983a47e39329/download/metadados-malhacicloviariarecife.json" )

ciclovias_Recife_Metadados <- as.data.frame(ciclovias_Recife_Metadados)

# arquivos xml

library(XML)

Reed_College_Courses <- xmlToDataFrame("http://aiweb.cs.washington.edu/research/projects/xmltk/xmldata/data/courses/reed.xml")