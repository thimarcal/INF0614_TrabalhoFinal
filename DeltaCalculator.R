########################################
## Trabalho - INF-0614
########################################

planilha <- read.csv("~/maddison-data-gdp-per-capita-in-2011us.csv", header = TRUE, sep = ",")
planilha$Entity <- as.character(planilha$Entity)

# Adiciona os deltas
planilha$Delta_1950_1960 <- as.integer(0)

paises <- as.character(unique(planilha$Entity))


for (i in 1:length(paises)) {
  pais <- paises[i]
  valor_1950 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1950]
  valor_1960 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1960]
  
  # Verifica se os valore existem antes de calcular
  if (length(valor_1950) > 0 & length(valor_1960) > 0) {
    planilha$Delta_1950_1960[planilha$Entity==pais &planilha$Year==1960] <-
      valor_1960 - valor_1950
  }
}








planilha$Delta_1950_1960 <- as.integer(0)


planilha$Delta_1950_1960[planilha$Year==1960] <- planilha$GDP[planilha$Year==1960] -
                                                  planilha$GDP[planilha$Year==1950]




values_1950 <- planilha[planilha$Year == 1950,]
tamanho_values_1950 <- length(values_1950[,1])
print("O tamanho de values_1950 eh: "); print(tamanho_values_1950)

values_1960 <- planilha[planilha$Year == 1960,]
tamanho_values_1960 <- length(values_1960[,1])
print("O tamanho de values_1960 eh: "); print(tamanho_values_1960)


for (i in 1:tamanho_values_1960) {
  
}


