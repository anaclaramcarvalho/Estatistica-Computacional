#AULA 10 06/09

#Vamos continuar a aula passada , porém mostrando no mapa do Brasil e dividir por cores
library(rvest)#só raspa de pagina estatico
library(dplyr)

#passo 1 -> pegar a url
url <- "https://pt.wikipedia.org/wiki/Lista_de_unidades_federativas_do_Brasil_por_alfabetiza%C3%A7%C3%A3o"
html <- read_html(url)
html

#Vamos raspar a tabela
#td é uam celula da tabela, tr é uma linha

tabelas <- html |> html_elements("table") |> html_table()
#[[6]] colchete duplo significa tabela

alfabetizacao <- tabelas[[3]]
print(alfabetizacao)
#o print a gnt usa na maioria das vezes em funções como for
alfabetizacao <- alfabetizacao[,c(2,3)]# a alfabetizacao vai receber alfabetizacao porém só com a coluna 2 e 3
names(alfabetizacao) <- c("estado","taxa")
names(alfabetizacao)
library(stringr)
#faz manipulação de string

str_replace_all(str = "ana145", pattern = "1",replacement = "")
#\\d é um digito generico
str_replace_all(str = "ana145", pattern = "\\d",replacement = "")

alfabetizacao$taxa
#Nós substituimos a virgula por . e substituimos o % por string vazia
parte1 <- str_replace_all(string = alfabetizacao$taxa, pattern = ",", replacement = ".")
parte2 <- str_replace_all(string = parte1,pattern = "%", replacement = "")
parte_final <- as.numeric(parte2)
parte_final
parte_final <- parte_final/100

alfabetizacao$taxa <- parte_final
alfabetizacao$taxa

library(geobr)
minas <- read_state(code_state = "MG")
library(ggplot2)
ggplot(data = minas)+geom_sf(fill = "darkorange")+theme_void()

municipiomg <- read_municipality(code_muni = "MG")
ggplot(data = municipiomg) + geom_sf() + theme_void()

#pintar somente seu estado
estados <- read_state()
estados$name_state
order(estados$name_state)
estados[2,]

estados <- estados[order(estados$name_state),]
estados

alfabetizacao <- alfabetizacao[order(alfabetizacao$estado),]
alfabetizacao

estados$taxa <- alfabetizacao$taxa
#colocar cada taxa dentro de cada estado correspondente, facilita e reduz o erro pois colocamos em ordem alfabetica
ggplot(data = estados ,aes(fill = taxa)) +geom_sf() + scale_fill_gradient(high = "#880093", low = "#FF68FE")

# scale ... ->trocando, deixando o com taxa maior mais escuro
