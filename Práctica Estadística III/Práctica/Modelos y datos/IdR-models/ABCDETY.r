## Influence Diagram

ABCDETY = list( 

  A = node( Type = "CHANCE", Name = "A", Values = c("p","q"), Preds = c("C"), 
Pots = matrix( data = c(
0.25, 0.75,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  C = node( Type = "CHANCE", Name = "C", Values = c("p","q"), Preds = c("D"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  B = node( Type = "CHANCE", Name = "B", Values = c("p","q"), Preds = c("A","D"), 
Pots = matrix( data = c(
0.44, 0.56,
0.44, 0.56,
0.44, 0.56,
0.25, 0.75),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  D = node( Type = "DECISION", Name = "D", Values = c("NO","YES"), Preds = c(), 
Pots = matrix( data = c(1.0), dimnames = list("phase","D"))), 

  E = node( Type = "CHANCE", Name = "E", Values = c("p","q"), Preds = c("C"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  T = node( Type = "DECISION", Name = "T", Values = c("NO","YES"), Preds = c("D","C","E"), 
Pots = matrix( data = c(2.0), dimnames = list("phase","T"))), 

  Y = node( Type = "CHANCE", Name = "Y", Values = c("p","q"), Preds = c("C"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  Utility = node(Type="UTILITY", Name = "Utility", Values = c(0.0,1.0), Preds = c("B","D","C","T","Y"), 
Pots = matrix( data = c(
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0),
  nrow=32, ncol=1 ,byrow=TRUE, dimnames=list( NULL, c("utility"))))

)

ABCDETY <- influence.diagram( ABCDETY)
cat("Influence Diagram: ABCDETY\n")