## Bayesian Network, 03-09-08

bayes3 = list( 

  A = node( Type = "CHANCE", Name = "A", Values = c("ABSENT","PRESENT"), Preds = c(), 
Pots=matrix( data = c(
0.85, 0.15),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  B = node( Type = "CHANCE", Name = "B", Values=c("NEGATIVE","POSITIVE"), Preds=c("A"), 
Pots=matrix( data = c(
0.95, 0.05,
0.15, 0.85),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  C = node( Type = "CHANCE", Name = "C", Values=c("NEGATIVE","POSITIVE"), Preds=c("A"), 
Pots=matrix( data = c(
0.72, 0.28,
0.72, 0.28),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL))

)

bayes3 <- bayesian.network.( bayes3)
cat( "Bayesian network  --  bayes3: P(A,B,C)=P(A)P(B|A)P(C|A).\n")

