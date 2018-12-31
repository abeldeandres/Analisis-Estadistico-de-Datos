## Influence Diagram

feb2010 = list( 

  A = node( Type = "CHANCE", Name = "A", Values = c("p","q"), Preds = c(), 
Pots = matrix( data = c(
0.25, 0.75),
  nrow = 1, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  B = node( Type = "CHANCE", Name = "B", Values = c("p","q"), Preds = c("A", "C"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75,
0.44, 0.56,
0.25, 0.75),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  C = node( Type = "DECISION", Name = "C", Values = c("NO","YES"), Preds = c("A"), 
Pots = matrix( data = c(1.0), dimnames = list("phase","C"))), 

  D = node( Type = "CHANCE", Name = "D", Values = c("p","q"), Preds = c("B"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  E = node( Type = "DECISION", Name = "E", Values = c("NO","YES"), Preds = c("D"), 
Pots = matrix( data = c(2.0), dimnames = list("phase","E"))), 

  F = node( Type = "CHANCE", Name = "F", Values = c("p","q"), Preds = c("E"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  Utility = node(Type="UTILITY", Name = "Utility", Values = c(0.0,1.0), Preds = c("C","D","E","F"), 
Pots = matrix( data = c(
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0, 
100.0, -5.0, 110.0, -8.0),
  nrow=16, ncol=1 ,byrow=TRUE, dimnames=list( NULL, c("utility"))))

)

feb2010 <- influence.diagram( feb2010)
cat("Influence Diagram: febrero 2010\n")


