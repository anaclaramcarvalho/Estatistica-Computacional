#Aula 12  13/09
#Raspagem da blaze no jogo double
#Com base nos resultados vamos ver a proporção de preto,vermelho e branco
#Pagina dinamica usando API, podendo estar ou n escondida.VoCê inspeciona ,clica na seta dupla, network e da um frefresh(F5) e acha lá a API

library(httr2)
library(httr)
library(dplyr)
library(jsonlite)#transformar em tabela para melhor vizualização

url <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:53.114Z&endDate=2024-09-13T16:43:53.116Z&page=1"

GET(url)#me deu os status e deixou entrar agora vamos extrair o conteudo

dados <- content(GET(url), "text")
dados

dados <- fromJSON(dados)#transforma em uma tabela
table(dados$record$color)#extrai só a coluna das cores

url_base <- "https://blaze1.space/api/roulette_games/history?startDate=2024-08-14T16:43:53.114Z&endDate=2024-09-13T16:43:53.116Z&page="

resultados <- c()
for(j in 1:50){
  url <- paste0(url_base, j)
  dados <- content(GET(url), "text")
  dados <- fromJSON(dados)
  resultados <- c(resultados,dados$records$color)
}
resultados
prop.table(table(resultados))#tabela de proporções

#--------------------------------------------------------------------------
#ver quantas vezes uma determinada plavra aparece
#sentimentalidade do texto
#Quebrar em tolken, quebrando em virgula ou ponto ou uma palavra

library(rvest)
library(dplyr)
library(ggplot2)

url <- "https://www.letras.mus.br/freaky-friday/863570/"
html <- read_html(url)
html
html |> html_elements("h1") |> html_text2()

letra <- html |> html_elements("div.lyric") |> html_elements("p") |> html_text2() |> paste(collapse = " ")
#colpaca tudo, pega o primeiro concateca com o segundo , porem da espaço entre pontos
letra

library(tidytext)#quebrar o texto em palavras 
#para quebrar tem que colocar em um dataframe para quebrar em palavras ele só aceita em estrutura de dados
letra <- data.frame(letra)

letra |> unnest_tokens(output = word, input = letra) |> count(word,sort = TRUE) |> head(n = 10) |> ggplot(aes(y = word, x = n)) + geom_col(fill = "orange")#colocar da mais frequente para a menos frequente
#imprimir e colocar em um grafico de barras as 10 palavras mais frequentes
#aula que vem vamos tirar as palavras fremming ou concetivos e retirar