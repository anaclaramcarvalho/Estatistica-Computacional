#AULA 09 -04/09
#knn não tem uma representação visual , tem uma logica matematica ai se usa a arvore
#Nessa aula vamos usar a floresta
#Vai ter reposição tendo  a diferença
#tem que fazer uma arvore ser independentes umas das outras

install.packages("randomForest")
library(randomForest)
library(rpart)
library(rpart.plot)
library(ggplot2)

data(iris)
dados <- iris

set.seed(123)
indice_treino <- sample(1:nrow(dados),size = 0.8*nrow(dados),replace = TRUE)
#replace é para repor 

treino <- dados[indice_treino,]
teste <- dados[-indice_treino,]
#---------------------------------------------------------------------------------------------------------------------
dados <- read.csv("cancer.csv")#se der merda ir em session chosse directry e achar a pasta que tá
str(dados)
dados$diagnosis <- as.factor(dados$diagnosis)

n <- round(0.8*nrow(dados))
n

set.seed(1731)
indices <- sample(1:nrow(dados), size = n,replace = TRUE)
indices

treino <- dados[indices,]
teste <- dados[-indices,]

arvore <- rpart(formula = diagnosis ~.,data = treino,method = "class")
previsao.arvore <- predict(arvore,newdata = teste, type = "class")
mean(previsao.arvore == teste$diagnosis)

floresta <- randomForest(formula = diagnosis ~ ., data = treino,ntree = 200)

floresta #imprimindo floresta

#dentro de cada arvore eu uso coisas que foram deixadas de fora para fazer essas arvores verem aquelas observações  que n foram vista e compara 
#voce sempre vai devolvendo , gatantindo ter mt variedade
#vc tem o treinamento e pega o treinamento novamente, tendo a amostra da amostra

previsao.arvore <- predict(floresta, newdata = teste, type = "class")#vai pegar cada uma do teste e jogar nas 200 arvores
mean(previsao.arvore == teste$diagnosis)

#----------------------------------------------------------------------------------
#terceira parte da aula
library(rvest)
library(dplyr)
library(ggplot2)

url <- "https://pt.wikipedia.org/wiki/Lista_de_unidades_federativas_do_Brasil_por_alfabetiza%C3%A7%C3%A3o"

html <- read_html(url)
html

html_elements(html,"h1")#pegue o html e investigue os elementos que são h1 dentro dele
html_text2(html_elements(html,"h1"))#extraia o texto dessa tag
#ou escrever de uma maneira mais elegante
html |> html_elements("h1") |> html_text2()#pega o html e joga dentro dessa funçaõ
# o trefco '|>' significa joga

tabelas <- html |> html_elements("table") |> html_table()
taxa <-tabelas[[3]]
View(taxa)

