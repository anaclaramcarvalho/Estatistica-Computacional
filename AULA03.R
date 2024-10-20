#aula para aprender a importar e tratar dados
#titanic.exe
#https://franklinpedro.github.io/ensino.html

dados <- read.table(file = "titanic.txt", header = TRUE, sep = ",")

summary(dados) #resumo do conjunto. É bom pra analisar se há necessidade de modificar algum tipo de dado ou não
#dados <- dados[, -1] #exclui a primeira coluna 

dados <- dados[, -c(1, 12)] #excluindo colunas dos dados (fomos de 12 para 10)

dados$Survived <- as.factor(dados$Survived) #transformando os dados em fator 
dados$Sex <- as.factor(dados$Sex)
dados$Pclass <- as.factor(dados$Pclass)

str(dados) #pedindo a estrutura dos dados

summary(dados) #resumo de dados

dados[1,4] #linha 1 e coluna 4, sempre assim, antes da vírgula linha e depois da vírgula coluna

omi <- dados[dados$Sex == "male",]#ele compara entrada com entrada pra ver se é male. Vou guardar na variável "homem" quais os homens
summary(omi)
table(omi$Survived) #Saber quantos homens sobreviveram
barplot(table(omi$Survived))

muie <- dados[dados$Sex == "female",]
summary(muie)
table(muie$Survived) #Saber quantas mulheres sobreviveram
barplot(table(muie$Survived))

primeira <- dados[dados$Pclass == 1,]
barplot(table(primeira$Survived))

terceira <- dados[dados$Pclass == 3,]
barplot(table(terceira$Survived))


#Quantos homens que estavam na terceira classe morreram?
terceiraOmi <- omi[omi$Pclass == 3,]

table(terceiraOmi$Survived)

library(ggplot2)

ggplot(data = omi, aes(x = Pclass, fill = Survived)) + geom_bar()

#Para fazer a leitura de um arquivo ".txt" ou ".csv" no R:
# FUNÇÃO: "read.table"
# ESTRUTURA: read.table(file = "nome_do_arquivo.tipo", sep = ',', header = TRUE)
#o "sep" é pra especificar como as informações estão separadas/organizadas no arquivo base
# FUNÇÃO: "summary" -> faz um resumo das informações. é interessante pra ver se há necessidade de mudar alguma coisa ou não

