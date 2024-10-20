#Operações
#O R funciona como uma calculadora
2 + 5 #soma
3 - 6 #subtração
3 * 3 #multiplicação
40 / 5 #divisão
3 ** 2 #potenciação
2 ^ 10 #potenciação
10 %% 3 #resto da divisão

set.seed(1) #usamos para controlar o gerador aleatório de números, nesse caso o runif usado abaixo
runif(1) #número aleatório no intervalo de 0 a 1

#atribuindo valores
  # <- simbolo de atribuição
a <- 20*3 #criando obejtos
print(a) #mostrando o valor desse objeto
30 * 3 -> b
print(b)

class(a) #mostrando a classe do objeto
d <- TRUE
class(d)
class(1)
d + a
FALSE + a

#true vale 1
#false vale 0

TRUE + TRUE
FALSE + FALSE
TRUE + FALSE/FALSE
TRUE/FALSE

v1 <- 4+3
V1 <- 3+90

x <- "teste"
class(x)
x

#criando vetores
x1 <- c(3,10,78) #criando vetor e alocando ele em um objeto
length(x1)
sum(x1)
mean(x1)
x1[2]#acessando a posição 2 do vetor 
c(1,6, "teste") #tenho que guardar esse vetor em algum lugar
x1[c(2,3)] #acessando duas posições ao mesmo tempo
x2 <- c(1, 6, "bat") #só podemos criar vetores utilizando elementos da mesma classe, nesse caso, transformamos o 1 e o 6 em classe de character, porém sua classe original é numeric
x3 <- c(x1, 67, 90) #concatenando elementos num vetor já existente
x3 #printando o vetor
x3 < 70 #analisando quais números dentro do vetor são menores que 70
sum(x2 < 70) #somando o valores menores que 70
x2[x2 < 70] #filtro lógico para extrair o que eu quero do vetor.Filtrando o vetor, e mostrando apenas elementos menores que 70

x2 > 54
x2 == 10 #igual
x2 != 10 #diferente

!TRUE
TRUE | FALSE #equivalente ao "ou"
TRUE & FALSE #equivalente ao "e"

sample #função de sortear

# dados: nome da variavel que recebe o experimento
dado <- sample(x = 1:6, size = 100, replace = TRUE)  #função simulando um dado, quantas faces esse dado tem, e se esseaa faces podem sair novamente
dado == 3
sum(dado == 3)
mean(dado == 3) #média de valores

table(dado)
barplot(table(dado)) #literalmente, um gráfico de barras
?table



# x = 1:6 é a "proporção". nesse caso significa que o sorteio será de 1 em 1, com números de 1 até 6
# size vai dizer quantas vezes você quer repetir o mesmo experimento
# replace indica se haverá ou não reposição dos números ou não (TRUE = repõe; FALSE = não repõe)
#table vai me mostrar quantos valores tem em cada uma das dimensões (colunas)


