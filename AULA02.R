#revendo a aula anterior (parte de vetores)
a <- c(1,2,5)
b <- c(10,12)
d <- c(a,6) #concatena o vetor "a" com o vetor c(6),concatenando o vetor a com a variável 6 para formar um novo vetor

3 * a #a variável multiplica todos os elementos do vetor 
3 + a #a variável soma todos os elementos do vetor
a * b #como os dois vetores são de tamanho diferente, então ele recicla o menor vetor para realizar esse cálculo, nesse caso, fica 1 * 10, 2 * 12, e reciclamos o 10 para obter 5 * 10
d + b #nesse caso, também reciclamos

#aprendendo a fazer laços com o R (for no R)
x <- 0
for(i in 1:20){
  x <- x + i
}
print(x)

#qual a probabilidade de duas pessoas de uma mesma turma fazerem aniversário no mesmo dia?
aniversarios <- sample(x = 1:365, size = 10, replace = TRUE)
print(aniversarios)
duplicated(aniversarios) #verificando de forma detalhada se alguma data de aniversário é igual a alguma anterior
any(duplicated(aniversarios)) #verificando de forma geral se alguma data de aniversária é igual

calcula_prob <- function(n){ #criando um a função para passar o número diretamente
  resultados <- c()
  for(j in 1:10000){
    aniversarios <- sample(x = 1:365, size = n, replace = TRUE)
    resultados[j] <- any(duplicated(aniversarios))
  }
  return(mean(resultados))
}
calcula_prob(n = 25)

#problema da loteria
bilhete <- c(28, 47, 7, 8, 12, 23)
sorteio <- sample(x = 1:60, size = 6, replace = FALSE)
bilhete %in% sorteio #verificando quem do conjunto 'bilhete' está contido no conjutno 'sorteio'
semanas <- 0
acertos <- 0
#laço (while)
while(acertos < 4){
  sorteio <- sample(x = 1:60, size = 6, replace = FALSE)
  acertos <- sum(bilhete %in% sorteio)
  semanas <- semanas + 1
}
print(semanas)

#faça o experimento acima 10.000 vezes para definir uma média!

total_semanas <- 0 #inicializando a soma de semanas
for (k in 1:10000) {
  semanas <- 0  #reinicia o contador de semanas a cada simulação
  acertos <- 0  #reinicia o contador de acertos a cada simulação
  while(acertos < 4) {
    sorteio <- sample(x = 1:60, size = 6, replace = FALSE)
    acertos <- sum(bilhete %in% sorteio)
    semanas <- semanas + 1
  }
  total_semanas <- total_semanas + semanas
}
media_semanas <- total_semanas / 10000 #calculando a média
print(media_semanas)
