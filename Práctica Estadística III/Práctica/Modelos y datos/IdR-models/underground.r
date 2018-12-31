## Influence Diagram

#h.diag <- influence.diagram( 
#  c(node.Accidentes,node.Trafico,node.Muertos,node.Quejas,node.PasoSubterraneo,node.Utility),
#  c("Accidentes",   "Trafico",   "Muertos",   "Quejas",   "PasoSubterraneo",   "Utility"))

underground = list( 

  Accidentes = node( Type = "CHANCE", Name = "Accidentes", Values = c("POCOS","MUCHOS"), Preds = c("Trafico"), 
Pots = matrix( data = c(
0.44, 0.56,
0.25, 0.75),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  Trafico = node( Type = "CHANCE", Name = "Trafico", Values = c("FLUIDO","DENSO"), Preds = c(), 
Pots = matrix( data = c(
0.364, 0.636),
  nrow = 1, ncol = 2, byrow = TRUE, dimnames = NULL)), 

  Muertos = node(Type="CHANCE", Name="Muertos", Values = c("MODERADO","ELEVADO"), Preds = c("Accidentes"), 
Pots = matrix( data = c(
0.60, 0.40,
0.10, 0.90),
  nrow=2, ncol=2, byrow=TRUE, dimnames=NULL)), 

  Quejas = node(Type="CHANCE", Name="Quejas", Values = c("POCAS","MUCHAS"), Preds = c("Trafico"), 
Pots = matrix( data = c(
0.80, 0.20, 
0.25, 0.75),
  nrow=2, ncol=2, byrow=TRUE, dimnames=NULL)), 

  PasoSubterraneo = node( Type = "DECISION", Name = "PasoSubterraneo", Values = c("NO","YES"), Preds = c("Muertos","Quejas"), 
Pots = matrix( data = c(1.0), dimnames = list("phase","PasoSubterraneo"))), 

  Utility = node(Type="UTILITY", Name = "Utility", Values = c(0.0,1.0), Preds = c("PasoSubterraneo","Accidentes"), 
Pots = matrix( data = c(
100.0, -5.0, 110.0, -8.0),
  nrow=4, ncol=1 ,byrow=TRUE, dimnames=list( NULL, c("utility"))))

)

underground <- influence.diagram( underground)
cat("Influence Diagram: Underground passage\n")