#Chamo essas bibliotecas
library(ggplot2)
library(dplyr)
library(knitr)

#Chama os arquivos com os dados
ipca_18 <- read.csv("IPCA_2018.csv",header = FALSE)
ipca_19 <- read.csv("IPCA_2019.csv" ,header = FALSE)
ipca_21 <- read.csv("IPCA_2021.csv",header = FALSE)
ipca_23 <- read.csv("IPCA_2023.csv" ,header = FALSE)
ipca_24 <- read.csv("IPCA_2024.csv",header = FALSE)

#Apenas faço a visuilizaçao das tabelas
View(ipca_18)
View(ipca_19)
View(ipca_21)
View(ipca_23)
View(ipca_24)

#Crio um vetor com o nomes das variaves
variaves <- c("Alimentos e bebidas","Habitaçao","Artigos de Residencia","Vestuario","Transporte","Saude","Despesas pessoais"
              ,"Educaçao","Cumunicaçao")

#É para selecionar qual a linha ira buscar os dados
i <- 6
#Faço a soma das variaves mensais de todos os anos para poder calcular a media
alimentos <- as.numeric(ipca_18$V3[i])+as.numeric(ipca_19$V3[i])+as.numeric(ipca_21$V3[i])+as.numeric(ipca_23$V3[i])+as.numeric(ipca_24$V3[i])
habitacao <- as.numeric(ipca_18$V4[i])+as.numeric(ipca_19$V4[i])+as.numeric(ipca_21$V4[i])+as.numeric(ipca_23$V4[i])+as.numeric(ipca_24$V4[i])
artigos <- as.numeric(ipca_18$V5[i])+as.numeric(ipca_19$V5[i])+as.numeric(ipca_21$V5[i])+as.numeric(ipca_23$V5[i])+as.numeric(ipca_24$V5[i])
vestuario <- as.numeric(ipca_18$V6[i])+as.numeric(ipca_19$V6[i])+as.numeric(ipca_21$V6[i])+as.numeric(ipca_23$V6[i])+as.numeric(ipca_24$V6[i])
transporte <- as.numeric(ipca_18$V7[i])+as.numeric(ipca_19$V7[i])+as.numeric(ipca_21$V7[i])+as.numeric(ipca_23$V7[i])+as.numeric(ipca_24$V7[i])
saude <- as.numeric(ipca_18$V8[i])+as.numeric(ipca_19$V8[i])+as.numeric(ipca_21$V8[i])+as.numeric(ipca_23$V8[i])+as.numeric(ipca_24$V8[i])
despesas <- as.numeric(ipca_18$V9[i])+as.numeric(ipca_19$V9[i])+as.numeric(ipca_21$V9[i])+as.numeric(ipca_23$V9[i])+as.numeric(ipca_24$V9[i])
educacao <- as.numeric(ipca_18$V10[i])+as.numeric(ipca_19$V10[i])+as.numeric(ipca_21$V10[i])+as.numeric(ipca_23$V10[i])+as.numeric(ipca_24$V10[i])
cumunicacao <- as.numeric(ipca_18$V11[i])+as.numeric(ipca_19$V11[i])+as.numeric(ipca_21$V11[i])+as.numeric(ipca_23$V11[i])+as.numeric(ipca_24$V11[i])


#Crio um vetor com cada uma de suas variaves para poder fazer os graficos de cada ano
#Com dados mensais
ipca_18_vet <- c(as.numeric(ipca_18$V3[i]),as.numeric(ipca_18$V4[i]),as.numeric(ipca_18$V5[i]),as.numeric(ipca_18$V6[i]),
                 as.numeric(ipca_18$V7[i]),as.numeric(ipca_18$V8[i]),as.numeric(ipca_18$V9[i]),as.numeric(ipca_18$V10[i]),as.numeric(ipca_18$V11[i]))

ipca_19_vet <- c(as.numeric(ipca_19$V3[i]),as.numeric(ipca_19$V4[i]),as.numeric(ipca_19$V5[i]),as.numeric(ipca_19$V6[i]),
                 as.numeric(ipca_19$V7[i]),as.numeric(ipca_19$V8[i]),as.numeric(ipca_19$V9[i]),as.numeric(ipca_19$V10[i]),as.numeric(ipca_19$V11[i]))

ipca_21_vet <- c(as.numeric(ipca_21$V3[i]),as.numeric(ipca_21$V4[i]),as.numeric(ipca_21$V5[i]),as.numeric(ipca_21$V6[i]),
                 as.numeric(ipca_21$V7[i]),as.numeric(ipca_21$V8[i]),as.numeric(ipca_21$V9[i]),as.numeric(ipca_21$V10[i]),as.numeric(ipca_21$V11[i]))

ipca_23_vet <- c(as.numeric(ipca_23$V3[i]),as.numeric(ipca_23$V4[i]),as.numeric(ipca_23$V5[i]),as.numeric(ipca_23$V6[i]),
                 as.numeric(ipca_23$V7[i]),as.numeric(ipca_23$V8[i]),as.numeric(ipca_23$V9[i]),as.numeric(ipca_23$V10[i]),as.numeric(ipca_23$V11[i]))

ipca_24_vet <- c(as.numeric(ipca_24$V3[i]),as.numeric(ipca_24$V4[i]),as.numeric(ipca_24$V5[i]),as.numeric(ipca_24$V6[i]),
                 as.numeric(ipca_24$V7[i]),as.numeric(ipca_24$V8[i]),as.numeric(ipca_24$V9[i]),as.numeric(ipca_24$V10[i]),as.numeric(ipca_24$V11[i]))

#Transformo os dados em um vetor
mensal_vet <- c(alimentos,habitacao,artigos,vestuario,transporte,
                saude,despesas,educacao,cumunicacao)


#É para selecionar qual a linha ira buscar os dados
i <- 7
#Faço a soma das variaves anuais de todos os anos para poder calcular a media
alimentos_a <- as.numeric(ipca_18$V3[i])+as.numeric(ipca_19$V3[i])+as.numeric(ipca_21$V3[i])+as.numeric(ipca_23$V3[i])+as.numeric(ipca_24$V3[i])
habitacao_a <- as.numeric(ipca_18$V4[i])+as.numeric(ipca_19$V4[i])+as.numeric(ipca_21$V4[i])+as.numeric(ipca_23$V4[i])+as.numeric(ipca_24$V4[i])
artigos_a <- as.numeric(ipca_18$V5[i])+as.numeric(ipca_19$V5[i])+as.numeric(ipca_21$V5[i])+as.numeric(ipca_23$V5[i])+as.numeric(ipca_24$V5[i])
vestuario_a <- as.numeric(ipca_18$V6[i])+as.numeric(ipca_19$V6[i])+as.numeric(ipca_21$V6[i])+as.numeric(ipca_23$V6[i])+as.numeric(ipca_24$V6[i])
transporte_a <- as.numeric(ipca_18$V7[i])+as.numeric(ipca_19$V7[i])+as.numeric(ipca_21$V7[i])+as.numeric(ipca_23$V7[i])+as.numeric(ipca_24$V7[i])
saude_a <- as.numeric(ipca_18$V8[i])+as.numeric(ipca_19$V8[i])+as.numeric(ipca_21$V8[i])+as.numeric(ipca_23$V8[i])+as.numeric(ipca_24$V8[i])
despesas_a <- as.numeric(ipca_18$V9[i])+as.numeric(ipca_19$V9[i])+as.numeric(ipca_21$V9[i])+as.numeric(ipca_23$V9[i])+as.numeric(ipca_24$V9[i])
educacao_a <- as.numeric(ipca_18$V10[i])+as.numeric(ipca_19$V10[i])+as.numeric(ipca_21$V10[i])+as.numeric(ipca_23$V10[i])+as.numeric(ipca_24$V10[i])
cumunicacao_a <- as.numeric(ipca_18$V11[i])+as.numeric(ipca_19$V11[i])+as.numeric(ipca_21$V11[i])+as.numeric(ipca_23$V11[i])+as.numeric(ipca_24$V11[i])


#Crio um vetor com cada uma de suas variaves para poder fazer os graficos de cada ano
#Com dados anuais
ipca_18_vet_a <- c(as.numeric(ipca_18$V3[i]),as.numeric(ipca_18$V4[i]),as.numeric(ipca_18$V5[i]),as.numeric(ipca_18$V6[i]),
                 as.numeric(ipca_18$V7[i]),as.numeric(ipca_18$V8[i]),as.numeric(ipca_18$V9[i]),as.numeric(ipca_18$V10[i]),as.numeric(ipca_18$V11[i]))

ipca_19_vet_a <- c(as.numeric(ipca_19$V3[i]),as.numeric(ipca_19$V4[i]),as.numeric(ipca_19$V5[i]),as.numeric(ipca_19$V6[i]),
                 as.numeric(ipca_19$V7[i]),as.numeric(ipca_19$V8[i]),as.numeric(ipca_19$V9[i]),as.numeric(ipca_19$V10[i]),as.numeric(ipca_19$V11[i]))

ipca_21_vet_a <- c(as.numeric(ipca_21$V3[i]),as.numeric(ipca_21$V4[i]),as.numeric(ipca_21$V5[i]),as.numeric(ipca_21$V6[i]),
                 as.numeric(ipca_21$V7[i]),as.numeric(ipca_21$V8[i]),as.numeric(ipca_21$V9[i]),as.numeric(ipca_21$V10[i]),as.numeric(ipca_21$V11[i]))

ipca_23_vet_a <- c(as.numeric(ipca_23$V3[i]),as.numeric(ipca_23$V4[i]),as.numeric(ipca_23$V5[i]),as.numeric(ipca_23$V6[i]),
                 as.numeric(ipca_23$V7[i]),as.numeric(ipca_23$V8[i]),as.numeric(ipca_23$V9[i]),as.numeric(ipca_23$V10[i]),as.numeric(ipca_23$V11[i]))

ipca_24_vet_a <- c(as.numeric(ipca_24$V3[i]),as.numeric(ipca_24$V4[i]),as.numeric(ipca_24$V5[i]),as.numeric(ipca_24$V6[i]),
                 as.numeric(ipca_24$V7[i]),as.numeric(ipca_24$V8[i]),as.numeric(ipca_24$V9[i]),as.numeric(ipca_24$V10[i]),as.numeric(ipca_24$V11[i]))

#Transformo os dados em um vetor
anual_vet <- c(alimentos_a,habitacao_a,artigos_a,vestuario_a,transporte_a,
                saude_a,despesas_a,educacao_a,cumunicacao_a)
#Calculos

#Numeros de anos
n <- 5

#Medias
mensal_media <- c(rep(mensal_vet/n))
anual_media <- c(rep(anual_vet/n))

#Variancia
variancia_mes <- c(rep(((mensal_vet-mensal_media)**2)/n))
variancia_ano <- c(rep(((anual_vet-anual_media)**2)/n))

#Desvio padrão
desvio_mes <- c(rep(sqrt(variancia_mes)))
desvio_ano <- c(rep(sqrt(variancia_ano)))


#Crio datas fremes com os dados dos calculos acima

#Mensal
dados_mensais <- data.frame(Variaves = rep(variaves),Soma = rep(mensal_vet),Media_Mensal = rep(mensal_media),
                            Mensal_Variancia = rep(variancia_mes),Desvio_Mensal = rep(desvio_mes))

#Anual
dados_anuais <- data.frame(Variaves = rep(variaves),Soma = rep(anual_vet),Media_Anual = rep(anual_media),
                           Anual_Variancia = rep(variancia_ano),Desvio_Anual = rep(desvio_ano))


#Crio datas fremes com cada informaçao de cada ano, para ter os graficos de cada ano
dados_ipca_18 <- data.frame(Variaves = variaves, Valores = rep(ipca_18_vet_a))
dados_ipca_19 <- data.frame(Variaves = variaves, Valores = rep(ipca_19_vet_a))
dados_ipca_21 <- data.frame(Variaves = variaves, Valores = rep(ipca_21_vet_a))
dados_ipca_23 <- data.frame(Variaves = variaves, Valores = rep(ipca_23_vet_a))
dados_ipca_24 <- data.frame(Variaves = variaves, Valores = rep(ipca_24_vet_a))


#Uso o ggplot para gerar os graficos
ggplot(dados_ipca_18,aes(x = Variaves,y = Valores, fill = Variaves)) + geom_bar(stat = "identity")+
  labs(title = "Variações de 2018")+theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(dados_ipca_19,aes(x = Variaves,y = Valores, fill = Variaves)) + geom_bar(stat = "identity")+
  labs(title = "Variações de 2019")+theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(dados_ipca_21,aes(x = Variaves,y = Valores, fill = Variaves)) + geom_bar(stat = "identity")+
  labs(title = "Variações de 2021")+theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(dados_ipca_23,aes(x = Variaves,y = Valores, fill = Variaves)) + geom_bar(stat = "identity")+
  labs(title = "Variações de 2023")+theme(axis.text.x = element_text(angle = 45, hjust = 1))
ggplot(dados_ipca_24,aes(x = Variaves,y = Valores, fill = Variaves)) + geom_bar(stat = "identity")+
  labs(title = "Variações de 2024")+theme(axis.text.x = element_text(angle = 45, hjust = 1))


#Plot um grafico com a media anual de todos os anos
ggplot(dados_anuais, aes(x = Media_Anual, y = Variaves, fill = Variaves)) + geom_bar(stat = "identity") +
  labs(title = "Variancia Dos Anos De  2018, 2019, 2021, 2023 e 2024", y = "Variáveis", x = "Valores")+theme_linedraw()


#Para gerar graficos de habitaçao, transporte e educaçao
#Trocando o j, vai selecionar qual vairiavel vai ser selecionada
j <- 1
#Vetor para quais anos temos
a <- c("2018","2019","2021","2023","2024")

#Vetor com o valor da variavel seleciona em cada ano
d_h <- c(ipca_18_vet_a[j],ipca_19_vet_a[j],ipca_21_vet_a[j],ipca_23_vet_a[j],ipca_24_vet_a[j])

#Data freme para poder criar os graficos
dados_habitalcao <- data.frame(Variaves = a,Valores = d_h)

#Plot o grafico apartir do data frame
ggplot(dados_habitalcao, aes(x = Variaves, y = Valores, fill = Variaves)) + geom_bar(stat = "identity") +
  labs(x = "Anos", y = "Variação", title = variaves[j])