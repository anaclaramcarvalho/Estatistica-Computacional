# nesta aula, construiremos um modelo de classificação de flores iris.
#usaremos o dataset iris, que contém 150 observações de 4 variáveis (comprimento e largura da sépala e da pétala) de 3 espécies de flores iris (setosa, versicolor e virginica).
#aprenderemos como utilizar estruturas condicionais e a partir destas estruturas, construiremos um modelo de classificação de flores iris chamado de árvore de decisão.

library(ggplot2) #pacote para visualização de dados

#passo 1: embaralhar as observações do cojunto e, em seguida, dividir este conjunto embaralhado em treino e teste.

iris <- iris[sample(nrow(iris)),] #embaralhando as observações
n <- round(0.8*nrow(iris)) #80% das observações para dividir em treino e teste; o treino conterá 80% das observações e o teste conterá 20% das observações; a função round arredonda o valor para o inteiro mais próximo.

treino <- iris[1:n,] #treino contém as primeiras n observações
teste <- iris[-(1:n),] #teste contém as observações restantes

ggplot(data = treino, mapping = aes(x = Species)) +
  geom_bar() #gráfico de barras para visualizar a distribuição das espécies no conjunto de treino

ggplot(data = treino, mapping = aes(x = Petal.Length))+
  geom_histogram(bins = 20, fill = "darkgray")+
  theme_minimal() #histograma para visualizar a distribuição do comprimento da pétala no conjunto de treino

ggplot(data = treino, mapping = aes(y = Petal.Length))+
  geom_boxplot()+
  facet_wrap(~Species) #boxplot para visualizar a distribuição do comprimento da pétala por espécie no conjunto de treino

ggplot(data = treino, mapping = aes(y = Sepal.Length))+
  geom_boxplot()+
  facet_wrap(~Species) #boxplot para visualizar a distribuição do comprimento da sépala por espécie no conjunto de treino

ggplot(data = treino, aes(x = Petal.Length, y = Petal.Width, color = Species))+
  geom_point() #gráfico de dispersão para visualizar a relação entre o comprimento e a largura da pétala por espécie no conjunto de treino

# a partir das visualizações, podemos observar que as espécies setosa são facilmente separáveis das outras duas espécies, versicolor e virginica, com base no comprimento e largura da pétala. nosso modelo ficará assim: se (if) o comprimento de pétala for menor do que 2.5, a espécie é setosa; caso contrário (else), se (if) a largura da pétala for menor do que 1.75, a espécie é versicolor; caso contrário (else), a espécie é virginica.

#a seguir um exemplo simples de estrutura condicional if-else em R:
x <- 25
if(x < 20){
  print("numero menor do que 20")
}else{
  print("maior ou igual a 20")
}

#passo 2: construir o modelo de classificação de flores iris com base na árvore de decisão.

resultados <- c() #vetor para armazenar as previsões do modelo
for(j in 1:nrow(teste)){
  if(teste$Petal.Length[j] < 2.5){
    resultados[j] <- "setosa"
  }else{
    if(teste$Petal.Width[j] < 1.75){
      resultados[j] <- "versicolor"
    }else{
      resultados[j] <- "virginica"
    }
  }
}
mean(teste$Species == resultados) #acurácia do modelo