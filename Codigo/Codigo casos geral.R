library(readxl)
library(ggplot2)
casos_gerais <- read_excel("./Dados/covid_19_bauru_casos_geral.xlsx", col_types = c("date", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"))
casosGerais_tratado <- data.frame(casos_gerais)
casosGerais_tratado <- casosGerais_tratado[-c(48, 201, 260, 3:5, 338:360), ]
casosGerais_tratado <- casosGerais_tratado[complete.cases(casosGerais_tratado$confirmacoes_total), ]
ggplot(casosGerais_tratado, aes(x = data_boletim)) + geom_line(aes(y = confirmacoes_total)) + ggtitle("Casos confirmados de covid em Bauru") + xlab("Data do boletim") + ylab("Quantidade") + theme(plot.title = element_text(hjust = 0.5))


casosGeraisNovos_tratados <- data.frame(casos_gerais)
casosGeraisNovos_tratados <- casosGeraisNovos_tratados[-c(1:5, 48), ]
casosGeraisNovos_tratados <- casosGeraisNovos_tratados[complete.cases(casosGeraisNovos_tratados$casos_novos), ]
ggplot(casosGeraisNovos_tratados, aes(x = data_boletim)) + geom_line(aes(y = casos_novos)) + ggtitle("Casos novos diários de covid em Bauru") + xlab("Data do boletim") + ylab("Quantidade") + theme(plot.title = element_text(hjust = 0.5))