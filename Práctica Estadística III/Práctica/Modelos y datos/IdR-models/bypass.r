## Influence Diagram 03-09-08

bypass = list( 

  PAIN = node( Type = "CHANCE", Name = "PAIN", Values = c("ABSENT","PRESENT"), Preds = c("HEARTDISEASE"), 
Pots = matrix( data = c(
0.80, 0.20,
0.70, 0.30),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  ANGIOGRAM = node( Type = "CHANCE", Name = "ANGIOGRAM", Values = c("NEGATIVE","POSITIVE"), Preds = c("HEARTDISEASE"), 
Pots = matrix( data = c(
0.95, 0.05,
0.15, 0.85),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  HEARTSURGERY = node( Type = "DECISION", Name = "HEARTSURGERY", Values = c("NO","YES"), Preds=c("PAIN","ANGIOGRAM"), 
Pots = matrix( data = c(1.0), dimnames = list("phase","HEARTSURGERY"))), 

  HEARTDISEASE = node(Type="CHANCE", Name = "HEARTDISEASE", Values=c("ABSENT","PRESENT"), Preds = c(), 
Pots = matrix( data = c(
0.85, 0.15),
  nrow = 1,ncol = 2,byrow = TRUE,dimnames = NULL)), 

  LIFEQ = node(Type="CHANCE", Name = "LIFEQ", Values = c("DEAD","LIVE2ALQ","LIVE2AHQ"), Preds = c("HEARTDISEASE","HEARTSURGERY"), 
Pots = matrix( data = c(
0.02, 0.08, 0.90,
0.09, 0.29, 0.62,
0.15, 0.30, 0.55,
0.17, 0.23, 0.60),
  nrow = 4, ncol = 3, byrow = TRUE, dimnames = NULL)), 

  ECONOMICALC = node(Type="CHANCE", Name = "ECONOMICALC", Values = c("LOW","MEDIUM","HIGH"), Preds = c("HEARTSURGERY"), 
Pots = matrix( data = c(
0.70, 0.25, 0.05,
0.05, 0.35, 0.60),
  nrow=2,ncol=3,byrow=TRUE,dimnames=NULL)), 

  UTILITY = node(Type="UTILITY", Name = "UTILITY", Values = c(0.0,1.0), Preds =c("LIFEQ","ECONOMICALC"), 
Pots = matrix( data = c(
1.0, 0.90, 0.70, 0.80, 0.50, 0.10, 1.40, 1.50, 1.80),
  nrow = 9,ncol = 1,byrow = TRUE,dimnames = list( NULL, c("UTILITY"))))

)

cat( "Influence Diagram -- bypass: ", names(bypass),"\n")
