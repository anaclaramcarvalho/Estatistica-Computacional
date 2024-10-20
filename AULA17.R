## Teste falso positivo

#numerador vai ser a probabilidade da doença vezes a probabilidade de dar positivo vezes a criança já ter a doença.
#denominador é tudo do denominador e a probabilidade de ser rara.

numerador <- (1/5000) *0.999
denominador <- ((1/5000)*0.999) +((4999/5000)*(1-0.999))

numerador/denominador


library(dplyr)
library(tidytext)
library(SnowballC)#lematização
library(quanteda)#analise quantitativa texto
library(quanteda.textmodels)#modelagem de texto

noticias <- read.csv("noticias.csv")

stopwords_pt <- data.frame(word = stopwords("pt"))

noticias[1,] |>
  unnest_tokens(word, texto) |>
  anti_join(stopwords_pt) |>
  count(word, sort = TRUE) |>
  top_n(20)

noticias[1,] |>
  unnest_tokens(word, texto) |>
  anti_join(stopwords_pt) |>
  mutate(word = wordStem(word,"portuguese")) |>
  count(word , sort = TRUE) |>
  top_n(20)

#O [1,] é para pegar a primeira linha que tem toda a noticia .

#A wordStem ela lematiza todas as paralavras , reduzindo para o seu radical na lingua portuguesa.

#Agora vamos organizar para a frequencia das palavras de cada texto

noticias_tokens <- tokens(noticias$texto,remove_punct = TRUE, 
                          remove_symbols = TRUE, remove_numbers = TRUE,
                          remove_url = TRUE) |>
  tokens_remove(stopwords("pt")) |> tokens_wordstem(language = "portuguese")
noticias_tokens

matriz_frequencia <- dfm(noticias_tokens)
matriz_frequencia


# Agora vamos fazer o modelo 

n <- round(0.8* nrow(noticias))
n
indices <- sample(1:nrow(noticias), size = n,replace =  FALSE)

treino <- matriz_frequencia[indices,]
teste <- matriz_frequencia[-indices,]

modelo_nb <- textmodel_nb(treino,noticias$categorias[indices])

previsao <- predict(modelo_nb, newdata = teste)
previsao

mean(previsao == noticias$categorias[-indices])


# Lista 
