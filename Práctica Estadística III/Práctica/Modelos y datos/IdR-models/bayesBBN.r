## Binary Bayesian Network, 17-11-15

#
source("idr-prj.r")
p0<-0.3
p1<-0.7
bayes1x2bbn = list( 

  A0 = node( Type = "CHANCE", Name = "A0", Values = c("-A0","+A0"), Preds = c(), 
Pots=matrix( data = c(
1-p0, p0),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  A1 = node( Type = "CHANCE", Name = "A1", Values=c("-A1","+A1"), Preds=c("A0"), 
Pots=matrix( data = c(
0.0, 1.0,
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL))
  
)

cat( "Bayesian network  --  bayes1x2bbn: P(A0,A1)=P(A0)P(A1|A0).\n")
marnod.eval(bayes1x2bbn)

#
source("idr-prj.r")
p0<-0.1
p1<-0.2
p2<-0.7
bayes1x3bbn = list( 

  A0 = node( Type = "CHANCE", Name = "A0", Values = c("-A0","+A0"), Preds = c(), 
Pots=matrix( data = c(
1-p0, p0),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  A1 = node( Type = "CHANCE", Name = "A1", Values=c("-A1","+A1"), Preds=c("A0"), 
Pots=matrix( data = c(
p2/(p1+p2), p1/(p1+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  A2 = node( Type = "CHANCE", Name = "A2", Values=c("-A2","+A2"), Preds=c("A0"), 
Pots=matrix( data = c(
p1/(p1+p2), p2/(p1+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL))

  )

cat( "Bayesian network  --  bayes1x3bbn: P(A0,A1,A2)=P(A0)P(A1|A0)P(A2|A0).\n")
marnod.eval(bayes1x3bbn)

#
source("idr-prj.r")
p0<-0.1
p1<-0.2
p2<-0.7
bayes1x3bbn = list( 

  A0 = node( Type = "CHANCE", Name = "A0", Values = c("-A0","+A0"), Preds = c(), 
Pots=matrix( data = c(
1-p0, p0),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  A1 = node( Type = "CHANCE", Name = "A1", Values=c("-A1","+A1"), Preds=c("A0"), 
Pots=matrix( data = c(
p2/(p1+p2), p1/(p1+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  A2 = node( Type = "CHANCE", Name = "A2", Values=c("-A2","+A2"), Preds=c("A1"), 
Pots=matrix( data = c(
p0/(p0+p2), p2/(p0+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL))

  )

cat( "Bayesian network  --  bayes1x3bbn: P(A0,A1,A2)=P(A0)P(A1|A0)P(A2|A1).\n")
marnod.eval(bayes1x3bbn)

#
source("idr-prj.r")
p0<-0.1
p1<-0.2
p2<-0.7
bayes1x3bbn = list( 

  A0 = node( Type = "CHANCE", Name = "A0", Values = c("-A0","+A0"), Preds = c(), 
Pots=matrix( data = c(
1-p0, p0),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  A1 = node( Type = "CHANCE", Name = "A1", Values=c("-A1","+A1"), Preds=c("A0"), 
Pots=matrix( data = c(
p2/(p1+p2), p1/(p1+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  A2 = node( Type = "CHANCE", Name = "A2", Values=c("-A2","+A2"), Preds=c("A0","A1"), 
Pots=matrix( data = c(
0.0, 1.0,
1.0, 0.0,
1.0, 0.0,
2.0, -1.0),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL))

  )

cat( "Bayesian network  --  bayes1x3bbn: P(A0,A1,A2)=P(A0)P(A1|A0)P(A2|A0,A1).\n")
marnod.eval(bayes1x3bbn)

#
source("idr-prj.r")
p0<-0.1
p1<-0.2
p2<-0.3
p3<-0.4
bayes1x4bbn = list( 

  A0 = node( Type = "CHANCE", Name = "A0", Values = c("-A0","+A0"), Preds = c(), 
Pots=matrix( data = c(
1-p0, p0),
  nrow=1,ncol=2,byrow=TRUE,dimnames=NULL)), 

  A1 = node( Type = "CHANCE", Name = "A1", Values=c("-A1","+A1"), Preds=c("A0"), 
Pots=matrix( data = c(
p2/(p1+p2), p1/(p1+p2),
1.0, 0.0),
  nrow = 2, ncol = 2, byrow = TRUE, dimnames = NULL)),

  A2 = node( Type = "CHANCE", Name = "A2", Values=c("-A2","+A2"), Preds=c("A0","A1"), 
Pots=matrix( data = c(
0.0, 1.0,
1.0, 0.0,
1.0, 0.0,
2.0, -1.0),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL)),

  A3 = node( Type = "CHANCE", Name = "A3", Values=c("-A3","+A3"), Preds=c("A1","A2"), 
Pots=matrix( data = c(
0.0, 1.0,
1.0, 0.0,
1.0, 0.0,
2.0, -1.0),
  nrow = 4, ncol = 2, byrow = TRUE, dimnames = NULL))

  )

cat( "Bayesian network  --  bayes1x3bbn: P(A0,A1,A2,A3)=P(A0)P(A1|A0)P(A2|A0,A1)P(A3|A0,A1).\n")
marnod.eval(bayes1x4bbn)













