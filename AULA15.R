#AULA 15   02/10
#Continuação da aula passada

library(janeaustenr)
library(tidytext)
library(dplyr)
library(ggplot2)
library(tidyr)
library(stopwords)
library(rvest)


livro <- prideprejudice
livro <- paste(livro,collapse = " ")

livro <-data.frame(texto = livro)
livro
stopwords_en <- data.frame(word = stopwords("en"))

livro |> unnest_tokens(output = word, input = texto) |>  
  anti_join(stopwords_en, by = "word") |>
  count(word, sort = TRUE) |> top_n(10) |> 
  mutate(word = reorder(word,n))|> 
  ggplot(aes(x = n, y = word)) + geom_col(fill = "lightblue")+ theme_bw()

#Analisar os sentimentos para saber se é um final feliz

sentimentos <- get_sentiments("bing")
library(stringr)
capitulos <- str_detect(prideprejudice,"^Chapter \\d+")#Transformar em um vetor
capitulos <- cumsum(capitulos)
livro <- data.frame(texto = prideprejudice)

livro |> mutate(capitulo = capitulos) |> 
  unnest_tokens(word,texto) |> 
  inner_join(sentimentos) |>
  count(capitulo,sentiment) |> 
  spread(sentiment,n,fill = 0) |> 
  mutate(total = positive - negative) |> 
  ggplot(aes(x = capitulo, y = total)) + geom_col()+ theme_minimal()
