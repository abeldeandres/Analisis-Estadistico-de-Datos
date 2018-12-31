getwd()
setwd("C:/Users/abelillo/Dropbox/Abel y Germán/Practica Estadistica II")
library(readxl)
library(forecast)
library(astsa)
library(tseries)
require(forecast)
Datos_g8 <- read_excel('Datos_g8.xlsx')
data.ts=ts(Datos_g8$`Tasa paro`, start=c(1987,6), end=c(2013,9), frequency=4)
plot(data.ts, ylab="TasaParo", xlab="Tiempo")

#Vamos a explorar la tendencia
#### Decomposition of time series, signals extraction, additive decomposition
decomp1=decompose(data.ts)
plot(decomp1)
### Decomposition of time series, multiplicative decomposition
decomp1prim=decompose(data.ts,type="multiplicative")
plot(decomp1prim)

##Medias Moviles
#Media movil de orden 3
mva3.ts=filter(data.ts,filter=1/3*c(1,1,1))
mva4.ts=filter(data.ts,filter=1/4*c(0.5,rep(1,3),0.5))
mva7.ts=filter(data.ts,filter=1/7*c(1,1,1))
temptotal.ts=cbind(data.ts,mva3.ts,mva4.ts,mva7.ts)
plot(temptotal.ts)


#DE MOMENTO NO SIRVE!
## Method stl() and forecast
stl1=stl(data.ts, s.window="periodic", robust=TRUE)
plot(stl1)
## In method for forecasting, we can choose c("naive", "ets", "arima", "rwdrift"). This is a model for the random ## part: ets=exponential smoothing, rwdrift=random walk with drift. In this particular example the results are ## almost the same.
fcst=forecast(stl1, method="naive")
plot(fcst)
fcst1=forecast(stl1, method="arima")
plot(fcst1)
fcst2=forecast(stl1, method="rwdrift")
plot(fcst2)
fcst2$mean

## in the original scale
fcst4=stlf(data.ts,method="arima",lambda=BoxCox.lambda(data.ts))
plot(fcst4)

## package forecast, fancy representation
tsdisplay(data.ts, plot.type="partial")
tsdisplay(data.ts, plot.type="scatter")
tsdisplay(data.ts, plot.type="spectrum")


#Vamos a explorar la periodicidad
### Exploring seasonality (declared frequency must be >1), seasonplot in package forecast
monthplot(data.ts)
seasonplot(data.ts)

#Vamos a explorar los ciclos
# Spectrum of the series, package astsa: it shows the lowest frequency having the highest contribution to the variation of the process.
# It may help us in determining the period of the series, if any.
mvspec(data.ts)
# it shows clearly the maximum at 1, as we have declared the frequency=12, the period is 1/1=1 year.
## other data set, annual data

mvspec(data.ts)
## the maximum is at 0.1, the period is 1/0.1=10 years (frequency=1 declared in the command ts)

## If I want to extract the remainder part for, say stl1:
remainder=stl1$time.series[,3]
plot(remainder)
acf2(remainder)



#TECNICAS DE PREDICCION
#### Exponential Smoothing
## Simple exponential smoothing is used with series without trend and seasonality
## declare data set NAO as a ts
alisim1=HoltWinters(data.ts,gamma=FALSE,beta=FALSE)
alisim1
forecast=predict(alisim1, n.ahead=4, prediction.interval=TRUE, level=0.95)
plot(alisim1, forecast)

## Holt smoothing is used with series withd trend and no seasonal component
alisim2=HoltWinters(data.ts,gamma=FALSE)
alisim2
forecast2=predict(alisim2, n.ahead=12, prediction.interval=TRUE, level=0.95)
plot(alisim2, forecast2)

## Holt-Winters smoothing with series with linear trend and seasonal variation
alisim3=HoltWinters(data.ts)
forecast3=predict(alisim3, n.ahead=6, prediction.interval=TRUE, level=0.95)
plot(alisim3, forecast3)

## Holt-Winters with multipicative structure: if the variability of each cycle increases with time
alisim3prim=HoltWinters(data.ts, seasonal="mult")
forecast3prim=predict(alisim3prim, n.ahead=6, prediction.interval=TRUE, level=0.95)
plot(alisim3prim,forecast3prim)

#### 
## Exploring the autocorrelation structure of time series
## clear nonstationarity probably due to seasonality (among other causes)
par(mfrow=c(3,1))
plot(log(data.ts))
acf(log(data.ts))
pacf(log(data.ts))

###SEGUNDA PARTE!!
## package TSA, forecast, astsa, tseries
### With series data.ts----------------------------
## First, log transforming the series, is very IMPORTANT!!
tsdisplay(data.ts, plot.type="scatter")
tsdisplay(log(data.ts), plot.type="scatter")
plot(data.ts)
plot(log(data.ts))
#with the standard deviation of the series and its differenciations, we find d=1, D=1
#sd(log(data.ts))
#sd(diff(log(data.ts))) #d=1
#sd(diff(diff(log(data.ts),10))) #D=1
sd(data.ts)
tsdisplay(diff(data.ts))
plot(diff(data.ts))
sd(diff(data.ts))
acf2(diff(data.ts))

#serie=diff(diff(log(data.ts)))
#plot(serie) ##Transformamos para hacerla estacionaria
#acf2(serie)
#tsdisplay(serie, plot.type="scatter")
adf.test(diff(data.ts)) #it is stationary
acf2(serie, max.lag=30) #we decide to include only a seasonal structure MA(1)

data.ts.1=Arima(data.ts,order=c(1,1,0),include.mean=1,seasonal=list(order=c(0,0,0), period=4))
tsdiag(data.ts.1)
# We decide to include a regular structure
acf2(data.ts.1$residuals)
tsdiag(data.ts.1) # we can include an MA(1) or an AR(1) in the regular part. We decide an AR(1)

data.ts.2=Arima(data.ts,order=c(1,1,0),include.mean=1,seasonal=list(order=c(1,0,0), period=4))
acf2(data.ts.2$residuals)
tsdiag(data.ts.2)


data.ts.4=Arima(data.ts,order=c(1,1,1),include.mean=1,seasonal=list(order=c(1,0,0), period=4))
acf2(data.ts.4$residuals)
tsdiag(data.ts.4)

data.ts.5=Arima(data.ts,order=c(1,1,1),include.mean=1,seasonal=list(order=c(1,0,1), period=4))
acf2(data.ts.5$residuals)
tsdiag(data.ts.5)
data.ts.5

## It doesn't improve either. Compare AIC's of these models
AIC(data.ts.1)
AIC(data.ts.3)
AIC(data.ts.4)
AIC(data.ts.5)


##Using auto arima
auto.arima(data.ts)
## full form of auto.arima function
## auto.arima(log(lynx), max.d=1, max.D=1, max.p=1,max.q=1,max.P=1, max.Q=1,trace=TRUE, stepwise=TRUE, test="adf", seasonal.test="ocsb")
##We get ARIMA(2,0,1), no seasonal part, AIC=184.55
## But we have already got a better one in terms of AIC, lynx.3
#correlations between model coefficients
cov2cor(data.ts.5$var.coef)
#testing independence of the residuals
LB.test(data.ts.5)
#or 
LB.test(data.ts.5, lag=20)
#normality of the residuals
jarque.bera.test(residuals(data.ts.5))

## Forecasting with the model lynx.3
predict(data.ts.5,n.ahead=20)
plot.Arima(data.ts.5) #TSA package

