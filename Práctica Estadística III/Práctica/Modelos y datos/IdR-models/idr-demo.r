####
idr.demo <- function( ) {

cat("DEMO IdR.\nModels: bayes2, asia, bypass, helicopter.\nPress enter....\n\n")

cat("\n****************\n")
cat("IdR demo PGM   ---   MEMORY:\n")
cat("memory.size()   ", memory.size(), "\n")
cat("memory.size(TRUE)  ", memory.size(TRUE), "\n")
cat("memory.limit()  ", memory.limit(), "\n")
cat("memory.limit(TRUE)  ", memory.limit(TRUE), "\n")
cat("****************\n")

#rm(list=ls(all=TRUE))#####################################################################################################################

readline( "BAYES2")
data(bayes2)
bayes2 <- bayesian.network.( bayes2)

barprob( bayes2, filename="bayes2")
barprob( bayes2, filename="bayes2-1", node=1)
barprob( bayes2, filename="bayes2-2", node=2)
netMap( bayes2, filename="bayes2")
dump.netG( bayes2, filename="bayes2") 
dump.netR( bayes2, filename="bayes2") 

#rm(list=ls(all=TRUE))#####################################################################################################################

readline( "ASIA")
data(asia)
asia <- bayesian.network.( asia)

barprob( asia, filename="asia")
netMap( asia, filename="asia")
dump.netG( asia, filename="asia") 
dump.netR( asia, filename="asia") 

t1<-proc.time()
asia. <- marnod.eval( asia, name="asia", Calc=TRUE, marg="network", simple="NONE", trz.evaluation=TRUE)
t2<-proc.time()
cat("TIME \n")
print( t2-t1)

barprob( asia., filename="asia-")
netMap( asia., "asia-")
dump.netG( asia., filename="asia-") 
dump.netR( asia., filename="asia-") 

#rm(list=ls(all=TRUE))#######################################################################################################################

readline( "BYPASS")
data(bypass)
bypass <- influence.diagram( bypass)

eval <- remarc.eval( bypass, DUMP=TRUE)
print( eval)

#bp <- guided.remarc.eval( bypass, eval$node.seq) 
#print(bp)

diag.inst <-  evid.inst( bypass, c())
print( diag.inst)
nodelist0 <- remarc.eval( diag.inst)
print( nodelist0)

diag.inst <- evid.inst( bypass, c("HEARTDISEASE","ABSENT"))
print( diag.inst)
nodelist1 <- remarc.eval( diag.inst)
print( nodelist1)

diag.inst <- evid.inst( bypass, c("HEARTDISEASE","PRESENT"))
print( diag.inst)
nodelist2 <- remarc.eval( diag.inst)
print( nodelist2)

diag.inst <- evid.inst( bypass, c("PAIN","ABSENT"))
print( diag.inst)
nodelist3 <- remarc.eval( diag.inst)
print( nodelist3)

#rm(list=ls(all=TRUE))#####################################################################################################################

readline( "HELICOPTER")
data(helicopter)
helicopter <- influence.diagram( helicopter)

eval0 <- remarc.eval( helicopter, DUMP=FALSE)
print( eval0)

print("DEMO IdR ok")
}#

