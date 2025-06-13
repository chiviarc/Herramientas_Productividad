#Silvia Ramos Cabral
library(dslabs)

data(heights)
x <- heights$height[heights$sex == "Male"]
mean(x>69 & x<=72)*100

#Ejercicio 2
library(dslabs)
 
data(heights)
x <- heights$height[heights$sex=="Male"]
avg <- mean(x)
stdev <- sd(x)
set2<- pnorm(72,avg, stdev)
ses9 <-pnorm(69,avg,stdev)
(set2-ses9)*100

#Ejercicio 3
data(heights)

x <- heights$height[heights$sex == "Male"]
avg <- mean(x)
stdev <- sd(x)
proreal <- mean(x > 79 & x <= 81)
approx <- (pnorm(81,avg,stdev)-pnorm(79,avg,stdev))
approx
proreal/approx

#Ejercicio 4
data(heights)
media <- 69
desv<-3
altura <- 7*12
sevenfooter <- pnorm(altura,media,desv)
1-sevenfooter

#Ejercicio 5

data(heights)
media <- 69
desv<-3
altura <- 7*12
sevenfooter <- pnorm(altura,media,desv)
p<-1-sevenfooter
round(p*10^9)

#Ejercicio 6

data(heights)
media <- 69
desv<-3
altura <- 7*12
sevenfooter <- pnorm(altura,media,desv)
p<-1-sevenfooter
N<-round(p*10^9)
(10/N)*100

#Ejercicio 7

data(heights)
media <- 69
desv<-3
altura <- 6*12+8
p<- 1-pnorm(altura,media,desv)
N<-round(p*10^9)
(150/N)*100
