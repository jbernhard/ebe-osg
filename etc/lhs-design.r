
### Generating a MmLHS design with rows of decreasing distances
### ... a MmLHS with rows reordered according to a Coffeehouse rule 

library(lhs)                     ### for Latin Hypercube stuff



get.ranges <- function(X){       ### returns a 2xD matrix
   apply(X,2,'summary')[c(1,6),]
}
scaleto.mM <- function(X,M=NULL){
                                 ### dim(X)=c(N,D)
   D <- ncol(X)                  ### dim(M)=c(2,D)
   if(is.null(M))   M <- rbind( rep(0,D), rep(1,D) )
   ranges <- get.ranges(X)
   ret <- matrix(NA,nrow(X),D)
   for(d in 1:D){                ### scale to [0,1]
      temp <- (X[,d]-ranges[1,d])/(ranges[2,d]-ranges[1,d])
                                 ### scale to [m,M]
      ret[,d] <- (M[2,d]-M[1,d])*temp + M[1,d]
   }
   return( ret )
}
                                 ### Coffeehouse design
CHD <- function(X.all,N){        ### N.all >= N >= 3
   N.all <- nrow(X.all)
   D     <- ncol(X.all)
   X <- matrix(NA, 2,D)

   dist.mat <- as.matrix( dist(X.all) )
   dist.mat.temp <- dist.mat
   dist.mat.temp[row(dist.mat)>=col(dist.mat)] <- 0
   ind <- as.vector( which(dist.mat.temp==max(dist.mat.temp), 
                           arr.ind=TRUE) )
   X[1:2,] <- X.all[ind,]

   for(n in 3:N){ 
      dist.mat.temp <- dist.mat
      dist.mat.temp[row(dist.mat) == col(dist.mat)] <- Inf
      dist.mat.temp[ind,ind] <- Inf
      ind.compl <- setdiff(1:N.all,ind)
      dist.mat.temp[ind.compl,ind.compl] <- Inf
                      ### minimimum distances to current design, X
      col.mins <- apply(dist.mat.temp,2,'min')   
      col.mins[ind] <- 0  
      ind.temp <- which( col.mins==max(col.mins) )
      X <- rbind( X, X.all[ind.temp,] )
      ind <- c(ind,ind.temp)
   }
   return(X)
}
#D <- 2                          ### to see what 'CHD' does
#N.all <- 1000
#X.all <- matrix( runif(N.all*D), N.all,D )
#X.all[,2] <- X.all[,1]^2 + rnorm(N.all, 0,0.15) 
#X <- CHD(X.all,N=8)
#plot(X.all)  ;  points(X, col=2, pch=19)

####################################

#set.seed(314159)                ### to see what is happening in 2-dim
#D <- 2
#N <- 4*D
#X.scale <- maximinLHS(n=N, k=D)
#M <- matrix( c(1,5, 2,4), nrow=2 )
#X.order <- CHD(X.all=X.scale, N=N)
#X <- scaleto.mM(X=X.order, M=M)
#
#par(mfrow=c(1,3))
#plot(X.scale, pch=as.character(1:9))  
#plot(X.order, pch=as.character(1:9))
#plot(X, pch=as.character(1:9))










########## Glauber IC model
# Fixing the EOS to the default value: 7 (s95p-v0-PCE) # Fixing the decoupling energy (Edec) to the defaul value: 0.502

set.seed(314159)

D <- 5
#N <- 20*D
N <- 256
            ### IC:'FinalFactor', IC:'alpha', tau_0, eta/s, VisBeta
X.scale <- maximinLHS(n=N, k=D)
X.order <- CHD(X.all=X.scale, N=N)
M <- matrix( c(40,70,  0.10,0.16,  
               0.2,1.0,  0.0,0.3,  0.2,1.1),   nrow=2 )
X <- scaleto.mM(X=X.order, M=M)
X <- data.frame(X)
names(X) <- c("IC.FinalFactor","IC.alpha","tau0","eta.s","VisBeta") 
#plot(X)



write.table( x=X, file=paste0('lhs-design-glb-',N,'.dat'), 
             append=FALSE, sep=" ", 
             row.names=FALSE, col.names = TRUE )









########## MC-KLN IC model
#
#

#set.seed(314159)
#
#D <- 5
#N <- 20*D
#            ### IC:'FinalFactor', IC:'lamba', tao_0, eta/s, VisBeta
#X.scaled <- maximinLHS(n=N, k=D)
#X.order <- CHD(X.all=X.scale, N=N)
#M <- matrix( c(5,20,  0.10,0.25,  
#               0.2,1.0,  0.0,0.3,  0.2,1.1),   nrow=2 )
#X <- scaleto.mM(X=X.order, M=M)
#X <- data.frame(X)
#names(X) <- c("IC.FinalFactor","IC.lambda","tau0","eta.s","VisBeta") 
#plot(X)



#write.table( x=X, file="design-MC_KLN-100.txt", 
#             append=FALSE, sep=" ", 
#             row.names=FALSE, col.names = TRUE )






