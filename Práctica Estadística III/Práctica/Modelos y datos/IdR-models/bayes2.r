## Bayesian Network, 03-09-10
#

bayes2 = list( 

  A = node( Type = "CHANCE", Name = "A", Values = c("ABSENT","PRESENT"), Preds = c(), 
Pots=matrix( data = c(
0.85, 0.15),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  B = node( Type = "CHANCE", Name = "B", Values=c("NEGATIVE","POSITIVE"), Preds=c("A"), 
Pots=matrix( data = c(
0.95, 0.05,
0.15, 0.85),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL))
)

cat( "Bayesian network  --  bayes2: P(A,B)=P(A)P(B|A).\n")

