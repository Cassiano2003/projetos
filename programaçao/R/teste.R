install.packages("titanic")
library(titanic)
data("titanic_train")
View(titanic_train)

install.packages("dplyr")
library(dplyr)

freq_abs <- table(titanic_train$Survived)

freq_rel <- prop.table(freq_abs)

freq_rel_por <- prop.table(freq_abs)*100

print(freq_abs)
print(freq_rel)
print(freq_rel_por)


tabela_univaria <- data_frame(Categoria = names(freq_abs), Freq_Abs = as.vector(freq_abs), 
                              Freq_Rela = as.vector(freq_rel),Freq_Rel_Porcen = as.vector(freq_rel_por))


tabela_univaria$Categoria <- ifelse(tabela_univaria$Categoria == 0,"Morreu","Ta vivo")


print(tabela_univaria)

install.packages("knitr")
library(knitr)

freq_abs <- table(titanic_train$Survived, titanic_train$Pclass)


# Criar a tabela bivariada
tabela_bivariada <- data.frame(Survived =
                                rep(c("NaoSobreviveu", "Sobreviveu"), each = 3), Pclass =
                                rep(c("1Classe", "2Classe", "3Classe"), times =
                                      2), Freq_absoluta = as.vector (freq_abs), Freq_relativa =
                                as.vector (freq_rel), Freq_relativa_percentual =
                                as.vector (freq_rel_por))
# Exibir a tabela
kable(tabela_bivariada, caption = "Tabela Bivariada de
      Sobrevivˆencia por Classe")


install.packages("ggplot2")
library(ggplot2)

ggplot(tabela_bivariada,aes(tabela_bivariada$Categoria)) + geom_bar(fill = "skyblue", color = "black") + labs(tite = "Media anual",x = "Variaveis",
                                                                                                 y = "Valores") + theme_minimal()
