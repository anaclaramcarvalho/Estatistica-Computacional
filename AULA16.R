#Aula 16   04/10/2024

#Hoje vamos analisar os sentimentos presentes em todos os livros.

library(janeaustenr)
library(tidytext)
library(dplyr)
library(ggplot2)
library(stringr)
library(stopwords)
libra

livros <- austen_books()
unique(livros$book) #ver todos os livros presentes nesse pacote 

#livros[livros$book == "Emma"]
livros |>
  filter(book == "Emma") |>
  unnest_tokens(output = word, input = text) |>
  count(word, sort = TRUE) |>
  top_n(10)

stopwords("en")

stopwords_en <- data.frame(word = stopwords("en"))
#Retirar as palavras que não tras sentido nenhum

livros |>
  filter(book == "Emma") |>
  unnest_tokens(output = word, input = text) |>
  anti_join(stopwords_en) |>
  count(word, sort = TRUE) |>
  top_n(10)

livros |>
  filter(book == "Emma") |>
  print(n = 20)

emma <- livros |>
  filter(book == "Emma")

capitulos <- str_detect(emma$text,"^CHARPTER[IVXLCDM]+") #voce entra com o texto e o padrão que quer procurar
#Olhar para as palavras capitulos no inicio, ai o ^ é uma ancora para garantir que é do começo da frase, entre os [] é um bloco de padrão , então aparecendo alguma dessas palavras nesse bloco ele capitura 
capitulos <- cumsum(capitulos) #acumulada de true e false
capitulos 
emma$capitulos <- capitulos 
str(emma)

#transformar em sentimentos para contar e ter aquele grafico para analiser como que é o sentimento da historia.
emma |>
  unnest_tokens(word,text) |>
  anti_join(stopwords_en) |>
  inner_join(get_sentiments("bing")) |>
  count(capitulos,sentiment) |>
  spread(sentiment, n, fill = 0)

#Retirar as palavras que são stopwords