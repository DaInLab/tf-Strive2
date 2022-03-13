library(readxl)
library(ggplot2)
mortes <- read_excel("./Dados/covid_19_bauru_mortes.xlsx", col_types = c("date", "text", "numeric", "date", "text", "text", "date", "numeric"))
mortes$sexo <- factor(mortes$sexo, levels=c("masculino","feminino"), labels =c(0, 1))
#masculino = 0, feminino = 1
ggplot(mortes, aes(x = idade, colour = sexo)) + geom_histogram(bins = 50, fill = "white") + guides(colour = guide_legend(title = "Sexo")) + scale_colour_discrete(labels = c("Masculino", "Feminino")) + ggtitle("Óbitos por covid") + xlab("Idade") + ylab("Quantidade") + theme(plot.title = element_text(hjust = 0.5))
#caso seja necessário transformar em valores numéricos:
#mortes$tipo_hosp <- factor(mortes$tipo_hosp, levels=c("privado", "público"), labels=c(0,1))
#privado = 0, público = 1
mortes$tempo_internacao = as.numeric(difftime(mortes$data_obito , mortes$inicio_sintoma, units=c("days")))
mortes$tempo_internacao[mortes$tempo_internacao < 0] = NA
boxplot(mortes$tempo_internacao ~ mortes$tipo_hosp, col=c("Red", "Blue"), xlab = "Dias internados", ylab = "Tipo de hospital", outline = FALSE, horizontal = TRUE)
ggplot(mortes, aes(x=doses_vacina)) + geom_bar(fill = c("Red", "Blue", "Purple", "Brown")) + ggtitle("Óbitos x Doses de Vacina") + xlab("Doses de vacina") + ylab("Mortes") + theme(plot.title = element_text(hjust = 0.5))

#Apenas para o ano de 2020:
#datas_2020 <- subset(mortes, data_obito >= "2020-01-01" & data_obito < "2021-01-01")
#datas_2020 <- table(datas_2020$data_obito)
#plot(datas_2020, type="l", las = 2, col="blue", ylab = "Obitos diários", main = "Óbitos diárias por Covid - Bauru 2020")

#Apenas para o ano de 2021:
#datas_2021 <- subset(mortes, data_obito >= "2021-01-01" & data_obito < "2022-01-01")
#datas_2021 <- table(datas_2021$data_obito)
#plot(datas_2021, type="l", las = 2, col="red", ylab = "Obitos diários", main = "Óbitos diárias por Covid - Bauru 2021")

#Apenas para o ano de 2022:
#datas_2022 <- subset(mortes, data_obito >= "2022-01-01")
#datas_2022 <- table(datas_2022$data_obito)
#plot(datas_2022, type="l", las = 2, col="brown", ylab = "Obitos diários", main = "Óbitos diárias por Covid - Bauru 2022")

datas <- subset(mortes, data_obito >= "2020-01-01")
datas <- table(datas$data_obito)
plot(datas, type="l", las = 2, col="black", ylab = "Obitos diários", main = "Óbitos diários por Covid - Bauru")