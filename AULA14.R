#Aula 14  25/09
#primeira aula pos P1

#PARTE 02 - CONTINUAÇÃO DA RASPAGEM
library(rvest)
library(dplyr)

url <- "https://www.bbc.com/portuguese/articles/cql3lwgl3ldo"

html <- read_html(url)
html

titulo <- html |> html_elements("h1") |> html_text2()
titulo

noticia <- html |> html_elements("p.bbc-hhl7in") |> html_text2()

#Como tem muitaas entradas e tem que estar tudo dentro de um bloco só
noticia <- paste(noticia, collapse = " ")#paste é para colar e o collapse é para colocar algo entre
noticia

#Agora faz o data.frame
artigos<- data.frame(titulo, noticia)
View(artigos)

library(tidytext)#quebrar um bloco em palavras ,para ficar mais estruturado

artigos |> unnest_tokens(output = words, input = noticia) |> count(words) |> arrange(desc(n))
#input é qual coluna quero que quebra