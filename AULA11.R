#AULA 11 11/09
#livro r for data science, estamos no capitulo web scraping
#pacote dplyr manipula dados e rvest é para a raspagem e a stringr é para manipulação de texto
#Web Scraping é o processo de extrair informações ou dados de páginas da web.
#para raspar toda uma classe vc usa um ponto antes do nome da classe 
# e a hashtag vc seleciona o elementro dentro da classe selecionada 
#html_elements()-> usado para encontrar todos os elementos 
#html_text2 -> extrair texto 
#html_attr -> extrair dado

library(rvest)#só raspa de pagina estatico
library(dplyr)
library(stringr)

url <- "https://www.timeout.com/film/best-horror-films"

html <- read_html(url)
nomes <- html |> html_elements("h3._h3_cuogz_1") |>
  html_text2()#cada vez que ele identificou um h3 com essa classe ele colocou em uma possição do vetor

posicao <- str_extract_all(nomes,pattern = "^\\d+")

#^ -> ancorar e extrair um ou mais digitos no inicio da frase
posicao <- unlist(posicao)#unlist é usado para tirar da lista
posicao
posicao <- as.numeric(posicao)#as.numeric é usado para tornar numerico 
posicao

anos <- unlist(str_extract_all(nomes,pattern = "\\(\\d+\\)$"))# o parenteses no R é \\( e o $ é para pegar no final
anos
anos <- unlist(str_extract_all(anos,"\\d+"))
anos

#O \\ é usado para pegar os caracteres especiais

titulos <- str_remove_all(nomes, "^\\d+\\.\\s+")#remova dessa string o seguinte padrão, ancora no inicio e remove os pontos e remove espaço
titulos <- str_remove_all(titulos,"\\s+\\(\\d+\\)$")#antes removemos o inicio e agora a gnt ancora no final e tira os espaços , seguido de parenteses , para ter só os nomes dos filmes
titulos

filmes_horror <- data.frame(posicao,titulos,anos)
  
write.csv(filmes_horror,file = "filmes_horror.csv", row.names = FALSE)
#para saber onde foi salvo o arquivo csv vc escreve no console getwd() e da enter

#-------------------------------------------------------------------------------------------------------------------------
#tentando solo
url <- "https://www.bosshunting.com.au/entertainment/movies/best-movies-imdb/"
html <- read_html(url)
html

nomes <-html |> html_elements("ol.wp-block-list") |> html_text2()
nomes
