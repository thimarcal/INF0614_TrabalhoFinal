########################################
## Trabalho - INF-0614
########################################

planilha <- read.csv("~/maddison-data-gdp-per-capita-in-2011us.csv", header = TRUE, sep = ",")
planilha$Entity <- as.character(planilha$Entity)

# Adiciona os deltas
planilha$Delta_1950_1960 <- as.integer(0)
planilha$Delta_1960_1970 <- as.integer(0)
planilha$Delta_1970_1980 <- as.integer(0)
planilha$Delta_1950_1980 <- as.integer(0)

planilha$Delta_1980_1990 <- as.integer(0)
planilha$Delta_1990_2000 <- as.integer(0)
planilha$Delta_2000_2016 <- as.integer(0)
planilha$Delta_1980_2016 <- as.integer(0)

planilha$Delta_1950_2016 <- as.integer(0)

paises <- as.character(unique(planilha$Entity))

for (i in 1:length(paises)) {
  pais <- paises[i]
  valor_1950 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1950]
  valor_1960 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1960]
  valor_1970 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1970]
  valor_1980 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1980]
  valor_1990 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==1990]
  valor_2000 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==2000]
  valor_2016 = planilha$GDPperCapita[planilha$Entity==pais & planilha$Year==2016]
  
  # Verifica se os valore existem antes de calcular
  if (length(valor_1950) > 0 & length(valor_1960) > 0) {
    x <- round( (((valor_1960 - valor_1950) / valor_1950) * 100), digits = 1)
    planilha$Delta_1950_1960[planilha$Entity==pais &planilha$Year==1960] <- x
  }

  if (length(valor_1960) > 0 & length(valor_1970) > 0) {
    x <- round( ((valor_1970 - valor_1960) / valor_1960) * 100, digits = 1)
    planilha$Delta_1960_1970[planilha$Entity==pais &planilha$Year==1970] <- x
  }

  if (length(valor_1970) > 0 & length(valor_1980) > 0) {
    x <- round( ((valor_1980 - valor_1970) / valor_1970) * 100, digits = 1)
    planilha$Delta_1970_1980[planilha$Entity==pais &planilha$Year==1980] <- x
  }

  if (length(valor_1950) > 0 & length(valor_1980) > 0) {
    x < - round( ((valor_1980 - valor_1950) / valor_1950) * 100, digits = 1)
    planilha$Delta_1950_1980[planilha$Entity==pais &planilha$Year==1980] <- x
  }
  
  if (length(valor_1980) > 0 & length(valor_1990) > 0) {
    x <- round( ((valor_1990 - valor_1980) / valor_1980) * 100, digits = 1)
    planilha$Delta_1980_1990[planilha$Entity==pais &planilha$Year==1990] <- x
  }
  
  if (length(valor_1990) > 0 & length(valor_2000) > 0) {
    x <- round( ((valor_2000 - valor_1990) / valor_1990) * 100, digits = 1)
    planilha$Delta_1990_2000[planilha$Entity==pais &planilha$Year==2000] <- x
  }
  
  if (length(valor_2000) > 0 & length(valor_2016) > 0) {
    x <- round( ((valor_2016 - valor_2000) / valor_2000) * 100, digits = 1)
    planilha$Delta_2000_2016[planilha$Entity==pais &planilha$Year==2016] <- x
  }
  
  if (length(valor_1980) > 0 & length(valor_2016) > 0) {
    x <- round( ((valor_2016 - valor_1980) / valor_1980) * 100, digits = 1)
    planilha$Delta_1980_2016[planilha$Entity==pais &planilha$Year==2016] <- x
  }
  
  if (length(valor_1950) > 0 & length(valor_2016) > 0) {
    x < - round( ((valor_2016 - valor_1950) / valor_1950) * 100, digits = 1)
    planilha$Delta_1950_2016[planilha$Entity==pais &planilha$Year==2016] <- x
  }
}

write.csv(planilha, file = "~/maddison-data-gdp-per-capita-in-2011us_DELTAS.csv")



