###################################################
#'
#' Estimates pairwise FSTs according to Nei (1987)
#'
#' Estimate pairwise FSTs according to Nei (1987)
#' 
#' FST are calculated using Nei (87) equations for FST', as described in the note 
#' section of  \link{basic.stats}
#' 
#' 
#' @usage pairwise.neifst(dat,diploid=TRUE)
#' 
#' @param dat A data frame containing population of origin as the first column and 
#' multi-locus genotypes in following columns
#' @param diploid whether the data is from a diploid (default) or haploid organism
#' 
#' @return A matrix of pairwise FSTs
#' 
#' @references Nei, M. (1987) Molecular Evolutionary Genetics. Columbia University Press
#' 
#'           
#' @author Jerome Goudet \email{jerome.goudet@@unil.ch}
#' 
#' @seealso \link{pairwise.WCfst} \link{genet.dist} \link{basic.stats}
#' 
#' 
#' @examples
#' 
#' data(gtrunchier)
#' pairwise.neifst(gtrunchier[,-2],diploid=TRUE)
#' 
#' @export
#' 
#########################################################################

pairwise.neifst <- function(dat,diploid=TRUE){
  if (is.genind(dat)) dat<-genind2hierfstat(dat)
  dat<-dat[order(dat[,1]),]
  pops<-unique(dat[,1])
  npop<-length(pops)
  fstmat <- matrix(nrow=npop,ncol=npop,dimnames=list(pops,pops))
  if (is.factor(dat[,1])) {
    dat[,1]<-as.numeric(dat[,1])
    pops<-as.numeric(pops)
  }
  for(a in 2:npop){
    for(b in 1:(a-1)){
      subdat <- dat[dat[,1] == pops[a] | dat[,1]==pops[b],]
      fstmat[a,b]<-fstmat[b,a]<- basic.stats(subdat,diploid=diploid)$overall[8]
    }
    
  }
fstmat
}


####################################################################
###################################################
#'
#' Estimates pairwise FSTs according to Weir and Cockerham (1984)
#'
#' Estimates pairwise FSTs according to Weir and Cockerham (1984)
#' 
#' @usage pairwise.WCfst(dat,diploid=TRUE)
#' 
#' @param dat A data frame containing population of origin as the first column 
#' and multi-locus genotypes in following columns
#' @param diploid whether the data is from a diploid (default) or haploid organism
#' 
#' @return A matrix of pairwise FSTs
#' 
#' @details FST are calculated using Weir & Cockerham (1984) equations for FST', as described in the note section of  \link{wc}
#' 
#' @references 
#' Weir, B.S. (1996) Genetic Data Analysis II. Sinauer Associates.
#' 
#' \href{https://onlinelibrary.wiley.com/doi/10.1111/j.1558-5646.1984.tb05657.x}{Weir B.S. and Cockerham C.C. (1984)} Estimating F-Statistics for the Analysis of Population Structure. Evolution 38:1358
#' 
#'           
#' @author Jerome Goudet \email{jerome.goudet@@unil.ch}
#' 
#' @seealso \link{pairwise.neifst} \link{genet.dist}
#' 
#' 
#' @examples
#' 
#' data(gtrunchier)
#' pairwise.WCfst(gtrunchier[,-2],diploid=TRUE)
#' 
#' @export
#' 
#########################################################################

pairwise.WCfst <- function(dat,diploid=TRUE){
  if (is.genind(dat)) dat<-genind2hierfstat(dat)
  dat<-dat[order(dat[,1]),]
  pops<-unique(dat[,1])
  npop<-length(pops)
  fstmat <- matrix(nrow=npop,ncol=npop,dimnames=list(pops,pops))
  if (is.factor(dat[,1])) {
    dat[,1]<-as.numeric(dat[,1])
    pops<-as.numeric(pops)
  }
  for(a in 2:npop){
    for(b in 1:(a-1)){
      subdat <- dat[dat[,1] == pops[a] | dat[,1]==pops[b],]
      fstmat[a,b]<-fstmat[b,a]<- wc(subdat,diploid=diploid)$FST
    }
    
  }
  fstmat
}


####################################################################
#' Estimates pairwise betas according to Weir and Goudet (2017)
#' 
#' Estimates pairwise betas according to Weir and Goudet (2017)
#' 
#' @usage pairwise.betas(dat,diploid=TRUE)
#' 
#' @param dat A data frame containing population of origin as the first column 
#' and multi-locus genotypes in following columns
#' @param diploid whether the data is from a diploid (default) or haploid organism
#' 
#' @return a matrix of pairwise betas
#' 
#' @author Jerome Goudet \email{jerome.goudet@@unil.ch}
#' 
#' \href{https://academic.oup.com/genetics/article/206/4/2085/6072590}{Weir, BS and Goudet J. 2017} A Unified Characterization 
#' of Population Structure and Relatedness. Genetics (2017) 206:2085 

#' @examples
#' 
#' data(gtrunchier)
#' pairwise.betas(gtrunchier[,-2],diploid=TRUE)
#' 
#' @export
#' 
pairwise.betas<-function(dat,diploid=TRUE){
  if (is.genind(dat)) dat<-genind2hierfstat(dat)
  dat<-dat[order(dat[,1]),]
  pops<-unique(dat[,1])
  npop<-length(pops)
  fstmat <- matrix(nrow=npop,ncol=npop,dimnames=list(pops,pops))
  if (is.factor(dat[,1])) {
    dat[,1]<-as.numeric(dat[,1])
    pops<-as.numeric(pops)
  }
  for(a in 2:npop){
    for(b in 1:(a-1)){
      subdat <- dat[dat[,1] == pops[a] | dat[,1]==pops[b],]
      fstmat[a,b]<-fstmat[b,a]<- betas(subdat,diploid=diploid)$betaW
    }
    
  }
  fstmat
}

  

