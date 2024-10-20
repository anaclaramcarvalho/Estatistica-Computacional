#AULA 06 - 23/08

#Um modelo chamado KNN do ingles lá, basicamente procurar o vizinho mais proximo, usada em quantas direções precisar
#Envolve a distancia de dois pontos 
#d= raiz(a1 -b1)+(a2-b2)-(a3-b3)
#Usamos o pacote palmerpenguins
#echo : false -> mostra só o resultado , true mostra a operação e o resultado
#a gente pegou os dados, leu , observou que tem dados faltantes e removeu eles
#pegar o primeiro do teste e ver a distancia dele e dos outros do treinamento
#pegando o primeiro do teste em relação ao peso dele menos o com maior peso

x <- c(10,4,8)
 sort(x)
#4  8 10 #colocou em ordem do menor para o maior
order(x)
#2 3 1 # indicou a posição do menor numero

#fazer com a iris