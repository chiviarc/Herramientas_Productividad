library(ggplot2)
#Barra resaltada en histograma
set.seed(123)
#crear una distribución normal de 100 números aleatorios
datos <-rnorm(100)
#crear histograma
histograma <- hist(data, plot=FALSE)
histograma
hist(datos)
histograma$breaks[-1]
#identificar barras a resaltar
valor_objetivo<-0
indice_rojo <- which(valor_objetivo>=histograma$breaks[-length(histograma$breaks)]&
                       valor_objetivo < histograma$breaks[-1])
#crea un vector que repite el color tantas veces como barras se tengan
colores <- rep("gray", length(histograma$counts))
colores[indice_rojo]<-"red"
#graficar la seguda barra
colores[2]<-"pink"
colores[indice_rojo+1] <-"blue"
#graficar el histograma
plot(histograma, col=colores, main="Histograma con una barra resaltada", 
     xlab="Valor", ylab="Frecuencia")

#inicia clase
#ejercicio1
library(dslabs)
data("mtcars")
mtcars
ggplot(mtcars, aes(x=factor(cyl), y=mpg, fill=factor(cyl)))+
  geom_boxplot()+
  labs(title="boxplot de millas por galón en mtcars",
       x="número de cilindros",
       y="millas por galón")+
  scale_fill_manual(values=c("4"="skyblue", "6" = "salmon", "8"="lightgreen"))+
theme_minimal()

#Ejercicio 2 modelo y cilindros

ggplot(mtcars, aes(x=factor(cyl), fill=factor(cyl)))+
  geom_bar()+
  labs(title="barra de cilindros en mtcars",
       x="número de cilindros",
       y="cantidad de modelos por cilindros")+
  scale_fill_manual(values=c("4"="red", "6" = "blue", "8"="orange"))+
  theme_minimal()+
  geom_text(stat="count", aes(label = ..count.. ), vjust=10)

#ejercicio 3
Nile
plot(Nile)
class (Nile)
nile_df <-data.frame(time=time(Nile), valor=as.numeric(Nile))
ggplot(nile_df, aes(x=time, y=valor))+
  geom_line()+
  labs(title="Niveles anuales del río Nilo de 1871-1970",
       x="año",
       y="nivel del rio")+
  theme_gray()

#Ejercicio 4

library(dslabs)
data(mtcars)
library(ggplot2)

ggplot(mtcars, aes(x=hp, y=mpg))+
  geom_point(color="blue", size= 3)+
  geom_smooth(method="lm",se=TRUE, color="red", size=1)+
  labs(title="gráfico de dispersión con línea de tendencia",
       x="Potencia del motor",
       y="eficiencia del combustible (mpg)")+
  theme_light()

#Ejercicio 5
library(dplyr)
data(economics)
#psavert (ingreso ) y uempmed(personas desempleadas)
economics %>%
ggplot(aes(x=date))+ 
geom_area(aes(y=psavert, fill="ingreso"), alpha=0.5)+
  geom_area(aes(y=uempmed, fill="gasto", ), alpha=0.5)+
  scale_fill_manual(values=c("ingreso"="blue","gasto"= "red"))+
  labs(title="Evolución del ingreso y gasto trimestral",
       x="fecha",
       y="Ingreso/gasto")+
  theme_minimal()+
  theme(axis.text.x=element_text(angle=45, hjust=1))

#Ejercicio final tenemos 59,000 anuales y vamos a ganar 65,000
valores <- c(59000, 65000-59000)
etiquetas <- c("valor original", "aumento")
#calcular porcentajes 
porcentajes <- round(valores/sum(valores)*100,1)
etiqueta_porcentaje <- paste(etiquetas,"-", porcentajes, "%")

#crear gráfico de pastel
pie(valores, 
    labels = etiqueta_porcentaje,
    col=c("skyblue", "orange"),
    main="distribución de nuevo valor de computadora")

#con ggplot
data <-data.frame(
  categoria=c("valor original", "aumento"),
  valor=c(59000, 65000-59000)
)
data
ggplot(data, aes(x="", y=valor, fill=categoria))+
  geom_bar(stat="identity", width=1)+
  coord_polar("y")+
  labs(title="Distribución de nuevo valor de computadora")+
  theme_void()
)