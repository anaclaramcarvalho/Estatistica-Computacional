library(ggplot2)

titanic <- read.table(file = "titanic.txt", sep = ",", header = TRUE)
titanic <- titanic[,-c(1,9:12)] #quero excluir a linha 1 e de 9 a 12 (por isso o ":", porque é sequencial, então concateno os vetores que eu quero tirar) 
str(titanic)
titanic$Survived <- as.factor(titanic$Survived)
summary(titanic$Survived)

titanic$Survived <- as.factor(titanic$Survived) 
titanic$Sex <- as.factor(titanic$Sex)
titanic$Pclass <- as.factor(titanic$Pclass)

#transformar em fator (pode ser me número, string, conforme a demanda)
#os "fatores" também podem ser chamados de "varíaveis categóricas". Essas variáveis geralmente tem uma quantidade limitada de atribuições.
# sexo, por exemplo, tem feminino e masculino. O as.factor pega o que seria o "femino" e o "masculino", em character, e transforma em um fator (categoria)
#também pode funcionar para o exemplo da nacionalidade
#é melhor transformar em fator porque quando você pede um "summary" ele retorna quais as opções aquela categoria possui
summary(titanic)

ggplot(data = titanic, aes(x = Survived)) + geom_bar(fill = "darkblue") + theme_dark()

ggplot(data = titanic, aes(x = Survived, fill = Sex)) + geom_bar(color = "black") + scale_fill_manual(values = c("male" = "#4169E1", "female" = "#FF69B4")) + theme_dark()

ggplot(data = titanic, aes(x = Sex, fill = Survived)) + geom_bar(color = "black") + scale_fill_manual(values = c("0" = "#DC143C", "1" = "#32CD32")) + theme_dark()

ggplot(data = titanic, aes(x = Sex, fill = Survived)) + geom_bar(color = "black") + scale_fill_manual(values = c("0" = "#DC143C", "1" = "#32CD32"), labels = c("0" = "Não", "1" = "Sim")) + facet_wrap(~Pclass) + scale_x_discrete(labels = c("female" = "Muie", "male" = "Omi")) + labs(title = "Análise de sobrevivência entre homens e mulheres por classe no Titanic", x = "Sexo", y = "Frequência", fill = "Sobreviveu?") + theme_dark()

#Agora é sobre flores
iris
iris <- iris[sample(), (nrow(iris)),]
iris
n <- round(0.8*nrow(iris)) #pegando 80% do número de linhas
n

treinamento <- iris[1:n,] 
teste <- iris[-(1:n)]

ggplot(data = treinamento, aes(x = Petal.Length, y = Petal.Width, col = Species))+
  geom_point(size = 2, alpha = 0.5)+
  theme_minimal()

