cps1985 <- read.csv("CPS1985.csv",header=T)
dim(cps1985)
names(cps1985)
summary(cps1985)

hist(cps1985$wage)

attach(cps1985) #Fijar Dataset
p<- hist(wage)
text(p$mids,p$counts,labels=p$counts,adj=c(0.5,-0.5),cex=.5) #Agregar elementos al Histograma

hist(wage,
     breaks=20,
     main="Distribucion del salario(Dólares por hora)",
     xlab="Salario",
     ylab="Número de personas"
)

hist(wage,
     breaks=20,
     main="Distribucion del salario(Dólares por hora)",
     xlab="Salario",
     ylab="Número de personas",
     xlim=c(0,50),
     col="white",
     border="black",
     )

hist(wage,
     breaks=20,
     main="Distribucion del salario(Dólares por hora)",
     freq = FALSE,
     xlab="Salario",
     ylab="Número de personas",
     xlim=c(0,50),
     ylim = c(0,0.15),
     col="brown",
     border="yellow",
)
 lines(density(wage),col="yellow",lwd=3)
 lines(density(wage,adjust=2),col="red",lwd=3,lty=2) 
 abline(v=mean(wage),col="darkblue",lwd=2,lty=2)
 
 hist(log(wage),
      breaks=20,
      main="Distribucion del salario(Dólares por hora)",
      freq = FALSE,
      xlab="Salario",
      ylab="Número de personas",
      xlim=c(0,4),
      ylim = c(0,0.80),
      col="gray",
      border="black",
 )
 lines(density(log(wage)),col="gold",lwd=3)
 lines(density(log(wage),adjust=2),col="red",lwd=3,lty=2) 
 abline(v=mean(log(wage)),col="darkblue",lwd=2,lty=2)
 
 












     
