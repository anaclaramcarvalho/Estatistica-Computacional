#Para mudar o csole de lugar primeiro vamos em tools, depois global options e por fim layout.

pinguins <- read.csv("pinguins.csv",header = TRUE)
#O header = true é para entender que aquele arquivo tem o uma primeira lina como cabecario, com algumas informações 
#Estamos salvando os dados do arquivo a vaiavl e vamos usar somente a variavel.

pinguins

head(pinguins)#Consegue ver as primeiras linhas do conjunto de dados.
tail(pinguins)#Cosegue ver as ultimas linhas do conjunto de dados.
dim(pinguins)#Vai mostrar a dimensão, pois o conjunto é um data.frame e o data tem dimensões de lihas e colunas.
colnames(pinguins)#Vai mostrar os nomes das variaveis.
str(pinguins)#Para ver a estrutura do conjunto.

#acessando as colunas do conjunto
pinguins$especie

#acessando as linhas do conjunto
pinguins[1,]#primeiro é as linhas e depois da virula e coluna.
#Deixando o spaço das coluas sm ada ele pega todas as coluas.
pinguins[1,"peso_g"]
pinguins[1:5,]#acessado as 5 primeiras linas, : é um intervalo.
pinguins[13:16,]

#Criando ojetos no R
pinguins$peso_g[1]
peso_pinguim1 <- pinguins$peso_g[1]
peso_pinguim1
comprimeto_bico <- pinguins$tamanho_bico_mm[2]
comprimeto_bico

#Operações aritmeticas basicas
#soma
pinguins$peso_g[1] + pinguins$peso_g[2]
soma_pinguins <- pinguins$peso_g[1] + pinguins$peso_g[2]
soma_pinguins
#divisao
#transformando de quilogramas para quilo
peso_Kg <- soma_pinguins/1000
peso_Kg
#MULTIPLICAÇÃO
multiplicacao_pinguim <- pinguins$peso_g[22] * pinguins$peso_g[5]
multiplicacao_pinguim  
#subtração
diferenca_pinguins <- pinguins$peso_g[1] - pinguins$peso_g[2]
diferenca_pinguins
#potencia
pinguins$nadadeira_mm[1] ** 2
pinguins$nadadeira_mm[1] ^ 2

#remover a variavel
teste <- pinguins[1,]
rm(teste)

#Exercício
#Calcule a media do tamanho do bico dos 3 primeiros pinguins
media_3 <- (pinguins$tamanho_bico_mm[1]+pinguins$tamanho_bico_mm[2]+pinguins$tamanho_bico_mm[3])/3
media_3
media <- mean(pinguins$tamanho_bico_mm[1:3])#O mean já soma e divide, caso eu queira só somar uso a função sum
media


#Como criar vetor
pinguins$peso_g
vetor <- c(1,6,36)
pinguins[c(1,6,36),]
pinguins[vetor,]

#Funções basicas o R
pesos <- pinguins$peso_g
?sum
soma_pesos <- sum(pesos, na.rm = TRUE)#o na.rm = TRUE retira os valores NA do conjunto de dados
soma_pesos#Vai dar NA, ão conseguimos fazer cotas com valores faltantes
#função MAX - > pinguim mais pesado
pinguim_maisPesado <- max(pinguins$peso_g, na.rm = TRUE)
pinguim_maisPesado
#função MIN
pinguim_maisLeve <- min(pinguins$peso_g, na.rm = TRUE)
pinguim_maisLeve
#Ver a posição do pinguim com o peso
posicao_pinguim_leve <- which.min(pinguins$peso_g)
posicao_pinguim_pesado <-which.max(pinguins$peso_g)
pinguins[posicao_pinguim_leve,]
#função length(tamanho/comprimento)
length(pinguins$especie)

#Execício
#Calcule a media dos pinguins 10 ao 25 usando as funções
peso_10_25 <- pinguins$peso_g[10:25]
media_10_25 <- sum(peso_10_25)/length(peso_10_25)
media_10_25
mean(peso_10_25)

#Função mean
media_pinguins_nadadeira <- mean(pinguins$nadadeira_mm,na.rm = TRUE)
media_pinguins_nadadeira
media_pinguins_nadadeira <- mean(pinguins$nadadeira_mm[10:25],na.rm = TRUE)
media_pinguins_nadadeira

#Função mediana
pinguins$profundidade_bico_mm
#Mediana prmeiro coloca em ordem e depois vê a media dos dois numeros do meio, no caso do número par.No caso da quantidade for impar, você pega o número do meio
mediana_profundidade_bico <-median(pinguins$profundidade_bico_mm,na.rm = TRUE)
mediana_profundidade_bico

#Função desvio padrão
#Quanto os valores desperção da média
desvio_padrao_peso <- sd(pinguins$peso_g,na.rm = TRUE)
desvio_padrao_peso

#Explorar o conjunto
summary(pinguins)#resumo do dados

#identificado as variaveis com valores faltantes
is.na(pinguins$sexo)#mostra a matriz true e false, pois é um vetor logico
pinguins[is.na(pinguins$sexo), ]#retorna todas as obsrvações com valores NA na coluna sexo
pinguins[!is.na(pinguins$sexo), ]#! é a negação
pinguins <- na.omit(pinguins)#remover os NA de todas as colunas
pinguins

#Filtrando o conjunto de dados
pinguins[pinguins$peso_g > 3000,]#selecioar somete os pinguis que tem o peso maior que 3Kg
pinguins[pinguins$peso_g >= 3000,]#maior ou igual
pinguins[pinguins$peso_g < 3000,]#selecioar somete os pinguis que tem o peso menor que 3Kg
pinguins[pinguins$peso_g <= 3000,]#Meor igual
pinguins[pinguins$peso_g == 2700,]#qual pinguim tem exatamente esse peso

pinguim_maisLeve <- min(pinguins$peso_g)
pinguins[pinguins$peso_g == pinguim_maisLeve,]

pinguins[pinguins$sexo == "femea",]

#Sub conjunto somente com os pinguins da especie Adelie
pinguim_adelie <- pinguins[pinguins$especie == "Adelie",]
pinguim_adelie
mean(pinguim_adelie$peso_g)

pinguins_gentoo <- pinguins[pinguins$especie == "Gentoo" ,]
pinguins_gentoo
mean(pinguins_gentoo$peso_g)

pinguins[pinguins$peso_g > 3000 & pinguins$especie == "Adelie",]

vetor_peso_adelie <- pinguins$peso_g > 3000 & pinguins$especie == "Adelie"

sum(vetor_peso_adelie)
