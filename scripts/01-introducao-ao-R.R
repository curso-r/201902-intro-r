# Nome dos objetos/variáveis ----------------------------------------------

# Os nomes devem começar com uma letra. Podem conter letras, números, _ e .

eu_uso_snake_case
outrasPessoasUsamCamelCase
algumas.pessoas.usam.pontos
E_algumasPoucas.Pessoas_RENUNCIAMconvenções

# Criando objetos/variáveis -----------------------------------------------

obj <- 1
obj

# ATALHO para rodar o código: CTRL + ENTER
# ATALHO para a <- : ALT - (alt menos)

# O R difencia minúscula de maiúscula!

a <- 5
A <- 42


# EXERCÍCIO ----------------------------------------------------------------

# Calculo o número de ouro no R e salve o resultado num objeto chamado "n_ouro".
# Dica: o número de ouro é dado pela expressão (1+√52)/2.


# Vetores -----------------------------------------------------------------

# Vetores são conjuntos ordenados de números

c(1, 4, 3, 10)

1:10

# Tipos -------------------------------------------------------------------

# Numéricos (numeric)

a <- 10
class(a)

# Caracteres (character, strings)

obj <- "a"
obj2 <- "masculino"

class(obj)

# Bases (data.frame)

mtcars
tibble::as_tibble(mtcars)

class(mtcars)
class(tibble::as_tibble(mtcars))

# Pacotes -----------------------------------------------------------------

# Para instalar pacotes

install.packages(c("tidyverse", "rmarkdown", "devtools"))

# Para carregar pacotes

library(dplyr)
library(ggplot2)

# Também é possível acessar as funções usando ::

dplyr::select()


# Funções -----------------------------------------------------------------

# Argumentos e ordem

seq(to = 10, from = 1, by = 2)
seq(1, 10, 2)

# Funções dentro de funções

mean(seq(1, 10, 2))

# Guardando as saídas

y <- seq(1, 10, length.out = 5)
y

# Criando funções

minha_soma <- function(x, y) {
  
  x + y
  
}

minha_soma(2, 3)

# Retornando explicitamente

minha_soma2 <- function(x, y) {
  
  x <- x^2
  y <-y^2
  
  soma <- x + y
  
  return(soma)
  
}

minha_soma2(1, 2)


# EXERCÍCIOS ---------------------------------------------------------------

# 1. Crie uma função que receba um valor em horas e devolva o seu equivalente
# em minutos.

# 2. Crie uma função que retorne o coeficiente de variação de um conjunto de 
# números. 
# DICA: o coeficiente de variação é o desvio-padrão dividido pela média.

# Comparações lógicas ------------------------------------------------------

1 > 0
2 < 1
3 == 3
3 != 1
5 %in% c(2, 4, 5)

# Valores especiais -------------------------------------------------------

# Existem valores reservados para representar dados faltantes, 
# infinitos, e indefinições matemáticas.

NA   # (Not Available) significa dado faltante/indisponível. 

NaN  # (Not a Number) representa indefinições matemáticas, como 0/0 e log(-1). 
# Um NaN é um NA, mas a recíproca não é verdadeira.

Inf  # (Infinito) é um número muito grande ou o limite matemático, por exemplo, 
# 1/0 e 10^310. Aceita sinal negativo -Inf.

NULL # representa a ausência de informação.

# Use as funções is.na(), is.nan(), is.infinite() e is.null() 
# para testar se um objeto é um desses valores.

1 == NA

is.na(NA)

a <- NA
is.na(NA)

# Controles de fluxo ------------------------------------------------------

x <- 0

if(x < 0) {
  "negativo"
} else if(x == 0) {
  "neutro"
} else {
  "positivo"
}

# Coerção ------------------------------------------------------------------

class(c(1, 2, 3))

c(1, 2, 3, "a")
c(TRUE, FALSE, "a")
c(1L, 2L, "a")
c(TRUE, FALSE, 1)

# logico < inteiro < numerico < caracter

# EXERCÍCIO ----------------------------------------------------------------

# Refaça a função que calcula o coeficiente de variação garantindo que 
# o valor recebido tenha comprimento maior que 1 e que ele seja numérico.



# Categorização ------------------------------------------------------------

x <- -10:30

x_categorizado <- ifelse(x < 0, "negativo", "positivo")

# Identação ---------------------------------------------------------------

funcao_com_muitos_argumentos(argumento_1 = 10, argumento_2 = 14, argumento_3 = 30, argumento_4 = 11)

# ATALHO: CTRL+I

# Operações vetoriais  -----------------------------------------------------

a <- 1:3
b <- 4:9

a + 1
b * 2
a + b


# Subsetting ---------------------------------------------------------------

# Vetores

letters
letters[1]
letters[1:3]
letters[c(1, 4, 6)]
letters[-1]
letters[-c(1, 2, 3)]

# Data frames

mtcars
mtcars[1, ]
mtcars[, 1]
mtcars[, c(1,2)]
mtcars[,-1]
mtcars[1, 1]
mtcars[,"mpg"]
mtcars[,c("mpg", "disp")]

mtcars[mtcars$mpg > 30, ]


# EXERCÍCIO ----------------------------------------------------------------

# Selecione do data frame mtcars apenas as linhas correspondentes aos carros
# com hp maior que 100 e apenas as colunas mpg, cyl e hp.

# Pipe (%>%) --------------------------------------------------------------

# Receita de bolo sem pipe. Tente entender o que é preciso fazer.

esfrie(
  asse(
    coloque(
      bata(
        acrescente(
          recipiente(
            rep(
              "farinha", 
              2
            ), 
            "água", "fermento", "leite", "óleo"
          ), 
          "farinha", até = "macio"
        ), 
        duração = "3min"
      ), 
      lugar = "forma", tipo = "grande", untada = TRUE
    ), 
    duração = "50min"
  ), 
  "geladeira", "20min"
)

# Veja como o código acima pode ser reescrito utilizando-se o pipe. 
# Agora realmente se parece com uma receita de bolo.

recipiente(rep("farinha", 2), "água", "fermento", "leite", "óleo") %>%
  acrescente("farinha", até = "macio") %>%
  bata(duração = "3min") %>%
  coloque(lugar = "forma", tipo = "grande", untada = TRUE) %>%
  asse(duração = "50min") %>%
  esfrie("geladeira", "20min")

# ATALHO: CTRL + SHIFT + M


# R Markdown --------------------------------------------------------------

# Usado para gerar relatórios, apresentações e dashboards estáticos

