## Bayesian Network, 31-07-10

asia = list( 

  VisitToAsia = node( Type = "CHANCE", Name = "VisitToAsia", Values = c("NoVisit","Visit"), Preds = c(), 
Pots = matrix( data = c(
0.99, 0.01),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  Smoking = node( Type = "CHANCE", Name = "Smoking", Values = c("NonSmoker","Smoker"), Preds = c(), 
Pots=matrix( data = c(
0.50, 0.50),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)),
 
  Tuberculosis = node( Type = "CHANCE", Name = "Tuberculosis", Values=c("ABSENT","PRESENT"), Preds=c("VisitToAsia"), 
Pots=matrix( data = c(
0.99, 0.01,
0.95, 0.05),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  LungCancer = node( Type = "CHANCE", Name = "LungCancer", Values=c("ABSENT","PRESENT"), Preds=c("Smoking"), 
Pots=matrix( data = c(
0.99, 0.01,
0.90, 0.10),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  Bronchitis = node( Type = "CHANCE", Name = "Bronchitis", Values=c("ABSENT","PRESENT"), Preds=c("Smoking"), 
Pots=matrix( data = c(
0.70, 0.30,
0.40, 0.60),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  TbOrCa = node( Type = "CHANCE", Name = "TbOrCa", Values=c("None","Sick"), Preds=c("Tuberculosis","LungCancer"), 
Pots=matrix( data = c(
1.0, 0.0,
0.0, 1.0,
0.0, 1.0,
0.0, 1.0),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL)),

  XRay = node( Type = "CHANCE", Name = "XRay", Values=c("NORMAL","ABNORMAL"), Preds=c("TbOrCa"), 
Pots=matrix( data = c(
0.95, 0.05,
0.02, 0.98),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  Dyspnea = node( Type = "CHANCE", Name = "Dyspnea", Values=c("ABSENT","PRESENT"), Preds=c("TbOrCa","Bronchitis"), 
Pots=matrix( data = c(
0.90, 0.10,
0.20, 0.80,
0.30, 0.70,
0.10, 0.90),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL))

)

cat( "Bayesian network -- asia: ", names(asia),"\n")

