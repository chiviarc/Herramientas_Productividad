#Silvia Ramos Cabral
library(dslabs)
data("murders")
unique(murders$region)
reg<-sum(murders$region == "North Central")
nr<-nrow(murders)
prop <- sum(reg) / nr
prop
prop_r <- round(prop * 20) / 20
prop_r

#Ejercicio 2
library(dslabs)
data("murders")
dist <- table(murders$region)
print(dist)
plot(dist)


#Ejercicio 3
data("heights")
alturah <- heights$height[heights$sex == "Male"]
ecdf_h <- ecdf(alturah)
plot(ecdf_h)

#Ejercicio 4
data("heights")
alturah <- heights$height[heights$sex == "Male"]
mediana_h <- median(alturah)
mediana_h

#Ejercicio 5
data("murders")
prop_asesinatos <- (murders$total/murders$population)*100000
sum(prop_asesinatos >5)

#Ejercicio 6
data("murders")
prop_asesinatos <- (murders$total/murders$population)*100000
sum(prop_asesinatos >5)

#Ejercicio 8
library(ggplot2)
data(heights)

altura_h<- heights[heights$sex == "Male", ]
ggplot(altura_h, aes(x = height)) +
  geom_histogram(binwidth = 1, fill = "pink", color = "blue") +
  geom_vline(xintercept = c(59)) +
  labs(
    title = "Histograma de alturas masculinas",
    x = "Altura",
    y = "Frecuencia"
  ) +
  theme_minimal()

#Ejercicio 8

library(dslabs)
library(ggplot2)
data(murders)

# Crear gráfico de densidad de la población (convertida a millones para legibilidad)
ggplot(murders, aes(x = population / 1e6)) +
  geom_density(fill = "skyblue", alpha = 0.5) +
  geom_vline(xintercept = 10, linetype = "dashed", color = "red", size = 1) +
  labs(
    title = "Densidad de población por estado en EE. UU.",
    x = "Población (millones)",
    y = "Densidad"
  ) +
  annotate("text", x = 11, y = 0.02, label = "10 millones", color = "red", angle = 90, vjust = -0.5) +
  theme_minimal()

           