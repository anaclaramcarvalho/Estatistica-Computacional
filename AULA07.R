#AULA 07 - 28/08

#Recapitulando a ultima aula
#Olhar para o primeiro mais proximo ...assim ele toma a classificação dele
#Nesta aula vamos expandir para um número K de vizinhos mais proximo

#Levar todas as variaveis para a mesma regua, padronizando 
#franklinpedro.github.io

#scale = deixa todas as colunas padronizadas 

cancer <- read.csv("cancer.csv")

library(ggplot2)
library(palmerpenguins)
library(class)

data(penguins)
pinguins <- penguins
str(pinguins)
pinguins <- pinguins[,-c(2,7,8)]
pinguins <-na.omit(pinguins)#omitir dados faltantes 

n <- round(0.8*nrow(pinguins))
n
indices_treino <- sample(1:nrow(pinguins),size = n,replace = FALSE)

treino <- pinguins[indices_treino,]
teste <- pinguins[-indices_treino,]
treino_padronizado <- scale(treino[,-1]) #tirou a especie pq tira tudo que não é padronizado
teste_padronizado <- scale(teste[,-1])


classe_treino <- treino$species
classe_teste <- teste$species

modelo01 <- knn(train = treino_padronizado, test = teste_padronizado,cl = classe_treino,k = 1)
mean(modelo01 == teste$species)

modelo02 <- knn(train = treino_padronizado,test = teste_padronizado,cl = classe_treino, k = 2)
mean(modelo02 == teste$species)

modelo03 <- knn(train = treino_padronizado, test = teste_padronizado,cl = classe_treino,k = 3)
mean(modelo03 == teste$species)

modelo10 <- knn(train = treino_padronizado,test = teste_padronizado,cl = classe_treino, k = 10)
mean(modelo10 == teste$species)

cor(treino[,-1])

taxa_acerto <- c()
for(k in 1:10){
  modeloi <- knn(train = treino_padronizado,test = teste_padronizado,cl = classe_treino, k = k)
  mean(modeloi == teste$species)
  taxa_acerto[k] <- mean(modeloi == teste$species)
}

df <- data.frame(k = 1:10,taxa_acerto)

ggplot(data = df,aes(x = k,y = taxa_acerto))+geom_line()

#FAZER PASTA E COLOCAR UNS X PINGUINS   


#FAZENDO PARA O CANCER
# eixo x tumor y blocksplot
cancer <- read.csv("cancer.csv",header = TRUE)
str(cancer)
summary(cancer)

cancer <- cancer[sample(nrow(cancer)),]
n <- round(0.8*nrow(cancer))
n
indices_treino <- sample(1:nrow(cancer), size = n,replace = FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

treino_padronizado <- scale(treino[,-1])
teste_padronizado <- scale(teste[,-1])

classe_treino <- treino$diagnosis
classe_teste <- teste$diagnosis

modelo_cancer <- knn(train = treino_padronizado,test = teste_padronizado,k = 1,cl = classe_treino)
mean(modelo_cancer == classe_teste)
