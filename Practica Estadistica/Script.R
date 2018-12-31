#We load data-set
getwd()
setwd("C:/Users/Abel/Dropbox/Abel y Germán/Practica Estadistica")
library("car")
library("corpcor")
library("ellipse")
library("FactoMiner")
install.packages("gvlma")
library("gvlma", lib.loc="~/R/win-library/3.2")
library("lmtest", lib.loc="~/R/win-library/3.2")

data8=read.table("data8.DAT")
colnames(data8)=c("country","100m(s)","200m(s)","400m(s)","800m(s)",
                  "1500m(s)","5000m(s)","10000m(s)","Marat(m)")
head(data8)
summary(data8)
#MATRIZ DE COVARIANZAS (S)
#data8.cov=cov(data8[,-1])#Tambien se puede utilizar para obtener la matriz de covarianza
matrizCovarianzas=cov(data8[,-1])
cov(data8[,-1])


#MATRIZ DE CORRELACIONES (R)
#data8.r=cor(data8[,-1]) #Tambien se puede utilizar para obtener la matriz de correlaciones.
matrizCorrelaciones=cor(data8[,-1])
cor(data8[,-1]) 
#Se puede, adem?s, dibujar la matriz de correlaciones. Se necesita la funci?n "plotcorr" del paquete "ellipse"
plotcorr(matrizCorrelaciones) 

#MATRIZ DE CORRELACIONES PARCIALES
matrizCorrelacionesParciales=cor2pcor(cor(data8[,-1]))
cor2pcor(cor(data8[,-1]))

panel.cor <- function(x, y, digits=2, prefix="", cex.cor)
{
  usr <- par("usr"); on.exit(par(usr))
  par(usr = c(0, 1, 0, 1))
  r = (cor(x, y))
  txt <- format(c(r, 0.123456789), digits=digits)[1]
  txt <- paste(prefix, txt, sep="")
  if(missing(cex.cor)) cex <- 0.8/strwidth(txt)
  text(0.5, 0.5, txt, cex = cex * abs(r))
}

pairs(data8, lower.panel=panel.smooth, upper.panel=panel.cor)

#Analisis univariante variable 5000m(s)
shapiro.test(data8$`5000m(s)`)
qqPlot(data8$`5000m(s)`, dist="norm")
anscombe.test(data8[,7])
boxcox(data8[,7]~1)
powerTransform(data8[,7])
normalizadoDato7=bcPower(data8[,7],-11.33124)
shapiro.test(normalizadoDato7)
qqPlot(normalizadoDato7, dist="norm")
#Outlier
data8[,7]
Boxplot(data8[,7], id.method="y")
Boxplot(data8[,7], id.method="identify")

#Analisis univariante variable 10000m(s)
shapiro.test(data8$`10000m(s)`)
qqPlot(data8$`10000m(s)`, dist="norm")

anscombe.test(data8[,8])

boxcox(data8[,8]~1)
powerTransform(data8[,8])
normalizadoDato8=bcPower(data8[,8],-8.868982)
shapiro.test(normalizadoDato8)
qqPlot(normalizadoDato7, dist="norm")

#Outlier
data8[,8]
Boxplot(data8[,8], id.method="y")
Boxplot(data8[,8], id.method="identify")

#Analisis Bivariante
cor(data8[,7:8])
cov(data8[,7:8])
colMeans(data8[,7:8])
plot(ellipse(0.95,centre=c(13.61759,28.53519)),type='l',col=2)
points(data8[,7],data8[,8])
identify(data8[,7],data8[,8])

mardiaTest(data8[,7:8],qqplot=T)
powerTransform(data8[,7])
powerTransform(data8[,8])

summary(powerTransform(data8[,7]))
summary(powerTransform(data8[,8]))
transformacion=bcPower(data8[,7:8], c(-11.3312,-8.869))
mardiaTest(transformacion,qqplot=T)

#No se que muestra el grafico.
scatterplotMatrix(data8[2:9])

#COEFICIENTE DE DEPENDENCIA EFECTIVA
#Para los datos de data8, sin la primera variable (8 variables)
1-det(cor(data8[,-1]))^{1/8}

#COEFICIENTE DE CORRELACION MULTIPLE (R^2)
r2multv<-function(x){
  r2s=1-1/(diag(solve(cov(x)))*diag(cov(x)))
  r2s
}
# What is the variable "more linearly explained" by the others
coeficienteCorrelacionMultiple=r2multv(data8[,-1])
r2multv(data8[,-1])

det(cor(data8[,-1]))

#y el de S tambi?n
det(cov(data8[,-1]))
#En todo analisis estadistico, |S|=0 significa que las medidas en una o varias variables del estudio pueden ser eliminadas
#Una o varias variables son combinaciones lineales de las otras y, por tanto, redundantes en cuanto a la informacion
#proporcionada.

data8.out=pcout(data8[,-1])
which(data8.out$wfinal01==0)
plot(data8[,7],data8[,8],pch=16,col=data8.out$wfinal01+2)


#Autovalores y Autovectores
#Para buscar la combinaci?n lineal que da lugar a ese determinante tan pr?ximo a 0, saco los autovalores y autovectores de S.
eigenvalue=eigen(cov(data8[,-1]))$values
eigenVector=eigen(cov(data8[,-1]))$vectors
eigenvalue
eigenVector
#El autovector asociado al autovalor m?s peque?o (0.00753) me dice que las variables involucradas en esa dependencia lineal son la X11, X17 y X18.
#De hecho, aunque sus correlaciones lineales (directas) no son muy fuertes.
##cor(hbat[,c(11,17,18)])

#Si lo son los R2 multiples
##r2multv(hbat[,c(11,17,18)])

#PRINCIPAL ANALISIS DE COMPONENTES (PCA). Little book...

standarisedconcentrations <- as.data.frame(scale(data8[2:9]))
data8.pca <- prcomp(standarisedconcentrations)
summary(data8.pca)

data8.pca$sdev

#La varianza total expicada por los componentes es la suma de las varianzas de los componentes:
sum((data8.pca$sdev))

screeplot(data8.pca,type="lines")

#Utilizaremos el criterio de Kaiser para elegir cuantos componentes principales tendremos.
#El criterio de Kaiser consiste en conservar aquellos factores cuyo autovalor asociado sea 
#mayor que 1.
data8.pca$sdev^2

#Otra forma para saber cuantos componentes tener en cuenta es mantener el numero de componentes
#necesarios para explicar al menos un porcentaje del total de la varianza. Por ejemplo,
#es importante explicar al menos un 80% de la varianza. En nuestro caso, podriamos mantener con
#el primer componente (proportion of variance (PC1)) que es del 0,83 -->83%. Se obtiene del summary

#Obtener Loadings del PCA
#Vamos a almacenar los loadings del PCA en un elemento llamado rotation. Este contiene una matriz con 
#los loadings de cada componente principal, donde la primera columna de la matriz contiene el loading del primero,
#la segunda columna del segundo, etc.
data8.pca$rotation[,1]

#Esto significa que la primera componente principal es una combinacion lineal de las variables:
#-0.3323877*Z2-0.3460511*z3-0.3391240*z4-0.3530134*z5-0.3659849*z6-0.3698204*z7-0.3659489*z8-0.3542779*z9
#Donde Z2,z3,z4...z9 son las versiones estandarizadas de las variables V2,V3,V4...V14. 

#Como curiosidad, se puede destacar que la suma de todos los loading al cuadrado da uno. 
sum((data8.pca$rotation[,1]^2))

#Para calcular los valores del primer componente principal, definimos nuestra propia funcion
#para calcular el componente principal a partir del loading y de los valores de entrada.

calcpc <- function(variables,loadings)
{
  # find the number of samples in the data set
  as.data.frame(variables)
  numsamples <- nrow(variables)
  # make a vector to store the component
  pc <- numeric(numsamples)
  # find the number of variables
  numvariables <- length(variables)
  # calculate the value of the component for each sample
  for (i in 1:numsamples)
  {
    valuei <- 0
    for (j in 1:numvariables)
    {
      valueij <- variables[i,j]
      loadingj <- loadings[j]
      valuei <- valuei + (valueij * loadingj)
    }
    pc[i] <- valuei
  }
  return(pc)
}

calcpc(standarisedconcentrations,data8.pca$rotation[,1])
data8.pca$x[,-1]
data8.pca$rotation[,2]
data8.pca$rotation[,1]

plot(data8.pca$x[,1],data8.pca$x[,2]) # make a scatterplot
text(data8.pca$x[,1],data8.pca$x[,2], data8$`100m(s)`, cex=0.7, pos=4, col="red") # add labels



rownames(data8)=abbreviate(data8$country)
data8_pca_r=PCA(data8[,-1],scale.unit=TRUE, graph=FALSE)
data8_pca_r
data8_pca_r$eig
data8_pca_r$var$coord
summary(data8_pca_r)
plot(data8_pca_r)
plot(data8_pca_r, cex=0.7)
plot(data8_pca_r, choix="var")




#________________________________________________________________________________________________
#Regresion MULTIPLE
Full=lm(data8$`5000m(s)`~., data=data8[,-1])
Base=lm(data8$`5000m(s)`~1, data=data8[,-1])
summary(Base)
ls()
Step.for=step(Base, scope=list(upper=Full, lower=~1), direction="forward",trace=F)
Step.for
summary(Step.for)
plot(Step.for)


bptest(Step.for)
boxplot(Step.for$residuals, outline=T)
dwtest(Step.for, alternative="two.sided")
gvlma(Step.for)

slp(Step.for)
avPlots(Step.for)
crPlots(Step.for)
#Residual Analysis
boxplot(Step.for$residuals, outline=T)
# package "nortest" and "tseries"
cvm.test(Step.for$residuals)
jarque.bera.test(Step.for$residuals)
# Lilliefors test
lillie.test(Step.for$residuals)
#kurtosis and skewness for residuals
anscombe.test(lm.1$residuals)
agostino.test(hbat[,6])
#It doesn't seem lack of normality is a problem


#predictions 
#first, we create new data frame with three new data points (made up "on the fly")
datos.lm=lm(formula = data8$`5000m(s)` ~ `10000m(s)` + `1500m(s)`, data = data8[,-1])
datos.lm
newdata = data.frame(c(10),c(5))
colnames(newdata)=c("10000m(s)","1500m(s)")
newdata
# prediction with model lm.1
# confidence interval of the mean response (robust to non normality of the errors)
predict(datos.lm, newdata, interval="confidence")
#prediction intervals for new observations (much less robust to non normality of errors)
predict(datos.lm, newdata, interval="prediction")



#________________________________________________________________________________________________


#Creamos una nueva columna agrupando a los paises por continentes
data8$Continente<-c(0,2,1,1,0,0,0,0,2,0,2,0,1,1,0,1,1,1,1,1,0,1,2,2,1,2,1,2,3,2,2,1,2,3,0,2,1,2,1,3,2,1,1,1,2,2,2,1,1,1,2,2,1,0)             

#head(data8$"100m(s)")
#head(data8)


paisesEuropeos <- data8[data8$Continente=="1",]
paisesAmericanos <- data8[data8$Continente=="0",]
paisesAsiaticos <- data8[data8$Continente=="2",]
paisesAfricanos <- data8[data8$Continente=="3",]


summary(paisesEuropeos)
summary(paisesAmericanos)
summary(paisesAsiaticos)
summary(paisesAfricanos)


europa=mean(paisesEuropeos[["100m(s)"]])
america=mean(paisesAmericanos[["100m(s)"]])
asia=mean(paisesAsiaticos[["100m(s)"]])
africa=mean(paisesAfricanos[["100m(s)"]])



boxplot(data8$`5000m(s)`~data8$Continente)

