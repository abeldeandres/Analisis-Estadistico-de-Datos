## Influence Diagram

helicopter = list( 

  Resultados = node( Type = "CHANCE", Name = "Resultados", Values = c("Apto","No.Apto","Nada"), Preds = c("Prueba","Estado"),
Pots = matrix( data = c(
0.90, 0.10, 0.0,
0.65, 0.35, 0.0,
0.15, 0.85, 0.0,
0.0, 0.0, 1.0,
0.0, 0.0, 1.0,
0.0, 0.0, 1.0),
  nrow = 6, ncol = 3, byrow = TRUE, dimnames = NULL)), 

  Estado = node(Type="CHANCE", Name="Estado", Values = c("Muy.maniobrable","Media.maniobrabilidad","Poco.maniobrable"), Preds = c(),
Pots=matrix( data = c(
0.30,0.40,0.30),
  nrow=1,ncol=3,byrow=TRUE,dimnames=NULL)), 

  Prueba = node(Type="DECISION", Name="Prueba", Values = c("Probar","No.Probar"), Preds = c(),
Pots = matrix( data = c(1.0), dimnames = list("phase","Prueba"))), 

  Compra = node(Type="DECISION", Name="Compra", Values = c("Comprar","No.Comprar"), Preds = c("Prueba","Resultados"), 
Pots = matrix( data = c(2.0),dimnames=list("phase","Compra"))), 

  UTILITY = node(Type="UTILITY", Name = "UTILITY", Values=c(0.0,1.0), Preds = c("Compra","Estado","Prueba"), 
Pots = matrix( data = c(
0.85,0.43,0.0,0.25,0.25,0.25,0.86,0.44,0.01,0.26,0.26,0.26),
  nrow=12,ncol=1,byrow=TRUE,dimnames=list( NULL, c("UTILITY"))))

)

cat("Influence Diagram -- helicopter: ", names(helicopter),"\n")

