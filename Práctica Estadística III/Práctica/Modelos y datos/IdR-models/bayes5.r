## Bayesian Network, 03-09-08

bayes5 = list( 

  A = node(Type="CHANCE", Name="A", Values=c("ABSENT","PRESENT"), Preds=c(), 
Pots=matrix( data = c(
0.85, 0.15),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  B = node(Type="CHANCE", Name="B", Values=c("ABSENT","PRESENT"), Preds=c(), 
Pots=matrix( data = c(
0.80, 0.20),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  C = node( Type = "CHANCE", Name = "C", Values=c("NEGATIVE","POSITIVE"), Preds=c("A","B","D","E","F"), 
Pots=matrix( data = c(
sample(1:64)*sample(1:64),
  nrow = 32, ncol = 2, byrow = TRUE, dimnames = NULL))),

  D = node(Type="CHANCE", Name="D", Values=c("ABSENT","PRESENT"), Preds=c(), 
Pots=matrix( data = c(
0.75, 0.25),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)),

  E = node(Type="CHANCE", Name="E", Values=c("ABSENT","PRESENT"), Preds=c(), 
Pots=matrix( data = c(
0.70, 0.30),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)),

  F = node(Type="CHANCE", Name="F", Values=c("ABSENT","PRESENT"), Preds=c(), 
Pots=matrix( data = c(
0.65, 0.35),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL))

)

bayes5 <- bayesian.network.( bayes5)
cat( "Bayesian network  --  bayes5\n")
