#AULA 13 -REVISÃO 18/09

#Analise de dados, modelos para analise(knn,arvore de desisão(modelorpart),floresta aleatoria)

#01)-
 juju <- 18
 jorel <- 7
 moeda <- c("cara","coroa")#definiu a moeda
 #jogar e contabilizar para pegar a minima probablidade de dar 50/50

 while(juju != 0 & jorel != 0){
   sorteio <- sample(moeda,size = 1);
   if(sorteio == "cara"){
   juju <- juju + 1
   jorel <- jorel - 1
 }else{
    juju <- juju - 1
    jorel <- jorel + 1
  }
 }
if(jorel == 0){
  print("juju")
}else{
  print("jorel")
}
 
resultados <- c()
for(j in 1:1000){
  #toda vez que fizer novamente a jogada tem q voltar as condições iniciais 
   juju <- 18
   jorel <- 7
 while(juju != 0 & jorel != 0){
   sorteio <- sample(moeda,size = 1);
   if(sorteio == "cara"){
     juju <- juju + 1
     jorel <- jorel - 1
   }else{
     juju <- juju - 1
     jorel <- jorel + 1
   }
 }
 if(jorel == 0){
   resultados <- c(resultados,"juju")
 }else{
   resultados <- c(resultados,"jorel")
 }
}
resultados
mean(resultados == "juju")
mean(resultados == "jorel")

#02)-
 bilhetes <- 1:30
 urna <-  sample(bilhetes,size = 1)#como figurinha é um elemento , não precisa usar replace
 while(length(unique(urna)) < 30){#unique retira a duplicada 
     urna <- c(urna,sample(bilhetes,size = 1))
 }
 length(urna)
 
resultados <- c()
bilhetes <- 1:30
for(j in 1:10000){
  urna <-  sample(bilhetes,size = 1)
  while(length(unique(urna)) < 30){
    urna <- c(urna,sample(bilhetes,size = 1))
  }
  resultados [j] <- length(urna)
}
mean(resultados)  
#tentar fazer para quando tem um bilhete premiado
resultados <- c()
bilhetes <- 1:30
for(j in 1:10000){
  urna <-  sample(bilhetes,size = 1,prob = c(1, rep(2, times = 29)))#criou um vetor de probablidade onde a figurinha 1 tem peso 1 e o das outras é 2 , ou seja , as outras figurinhas tem 2 vezes mais probablildade de sair
  while(length(unique(urna)) < 30){
    urna <- c(urna,sample(bilhetes,size = 1,prob = c(1, rep(2, times = 29))))
  }
  resultados [j] <- length(urna)
}
mean(resultados)  

#03)-
chicago <- read.csv("chicago.csv", header = TRUE, sep = ",")
str(chicago)#estrutura
#tirar o X e transformar o seson virar fator
chicago <- chicago[,-1]
chicago$season <- as.factor(chicago$season)

library(ggplot2)
ggplot(data = chicago, aes(x = time,y = temp, fill = season))+geom_point()+theme_minimal()

inverno <- chicago[chicago$season == "Winter"]#eu olho para o chicago com respeito a season e faço ser igual a inverno

papagaio <- read.table(file = "papagaio.txt", header = TRUE, sep = ",")


