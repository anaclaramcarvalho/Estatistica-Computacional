#Aula 08 - 30/08

#Formalizar uma arvore de decisão
#O conjunto vai ser mais puro quando tiver mais quantidades de individuos em uma mesma categoria, mais puro é

#Para uma classificação na arvore , vem a pergunta e dois galhos,de um lado uma resposta negativa e do outro positiva
#Usaremos primeiramente o BPM para saber se ter o BPM alto pode estar ligado a ter doença no coração e faremos isso para o colesterol e açucar no sangue...individualmente, para depois avaliar eles juntos.
#Visualmente falando , usar BPM é melhor, pois tem um puro e com a proporção melhor...vamos ver se bate montando

#Gp = Pv(1-Pv)+Pa(1-Pa) -> usa para cada lado 
#Pv = proporção vermelho
#Pa = proporção azul
#Estado caotico é 50/50
#o G final eu tenho que multiplicar a quantidade do total que foi para um lado vezes o G daquela parte + a quantidade do todo que foi para o outro lado vezes a parte G dela.

#Importanto os dados do cancer
#Session- achar diretorio 
#Depois abrir o file e fazer htlm de todos e usar o sorce
library(rpart)
library(rpart.plot)

cancer <- read.csv("cancer.csv",header = TRUE)
cancer <-cancer[sample(nrow(cancer)),]
n <- round(0.8*nrow(cancer))
n
indices_treino <- sample(1:nrow(cancer), size = n,replace = FALSE)

treino <- cancer[indices_treino,]
teste <- cancer[-indices_treino,]

modelo.arvore <- rpart(formula = diagnosis~ .,data = treino,method = "class")
rpart.plot(modelo.arvore, extra = 101)

previsao <- predict(modelo.arvore,newdata = teste,type = "class")

mean(previsao == teste$diagnosis)#media

#Tentar fazer matriz de confusao ou contusão

