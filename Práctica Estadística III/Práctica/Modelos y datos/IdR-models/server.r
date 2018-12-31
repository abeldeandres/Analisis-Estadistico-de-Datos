server = list(
Incidencias = node( Type = "CHANCE", Name = "Incidencias",
Values = c("pocos","muchos"), Preds = c("Productividad"),
Pots = matrix( data = c(
0.60, 0.40,
0.15, 0.85),
nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),
Productividad = node( Type = "CHANCE", Name = "Productividad",
Values = c("media","alta"), Preds = c(),
Pots = matrix( data = c(
0.20, 0.80),
nrow = 1, ncol = 2, byrow = TRUE, dimnames = NULL)),Averias = node(Type="CHANCE", Name="Averias",
Values = c("raras","frecuentes"), Preds = c("Incidencias"),
Pots = matrix( data = c(
0.90, 0.10,
0.30, 0.70),
nrow=2, ncol=2, byrow=TRUE, dimnames=NULL)),
Satisfaccion = node(Type="CHANCE", Name="Satisfaccion",
Values = c("baja","alta"), Preds = c("Productividad"),
Pots = matrix( data = c(
0.80, 0.20,
0.65, 0.35),
nrow=2, ncol=2, byrow=TRUE, dimnames=NULL)),
NuevoServidor = node( Type = "DECISION", Name = "NuevoServidor",
Values = c("no","si"), Preds = c("Averias","Satisfaccion"),
Pots = matrix( data = c(1.0), dimnames = list("phase","NuevoServidor"))),
NuevoSoftware = node( Type = "DECISION", Name = "NuevoSoftware",
Values = c("no","si"), Preds = c("NuevoServidor"),
Pots = matrix( data = c(2.0), dimnames = list("phase","NuevoSoftware"))),
Utility = node(Type="UTILITY", Name = "Utility",
Values = c(0.0,1.0), Preds = c("NuevoServidor","NuevoSoftware","Incidencias"),
Pots = matrix( data = c(
## no,no,pocos, no,no,muchos, no,si,pocos, no,si,muchos, si,no,pocos, si,no,muchos, si,si,pocos, si,si,muchos
80.0, -5.0, 110.0, -8.0, 100.0, -4.0, 50.0, -2.0),
nrow=8, ncol=1 ,byrow=TRUE, dimnames=list( NULL, c("utility"))))
)
server = influence.diagram( server)

cat("Influence Diagram -- server: ", names(server),"\n")

server.media <- evid.inst(server, c("Productividad","media"))
server.alta <- evid.inst(server, c("Productividad","alta"))
