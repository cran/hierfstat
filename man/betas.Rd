% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/betas.R
\name{betas}
\alias{betas}
\title{Estimates \eqn{\beta}s per population and a bootstrap confidence interval}
\usage{
betas(dat,nboot=0,lim=c(0.025,0.975),diploid=TRUE,betaijT=FALSE)
}
\arguments{
\item{dat}{data frame with genetic data and pop identifier}

\item{nboot}{number of bootstrap samples.}

\item{lim}{width of the bootstrap confidence interfal}

\item{diploid}{whether the data comes from a diploid organism}

\item{betaijT}{whether to estimate individual coancestries}
}
\value{
Hi Within population gene diversities (complement to 1 of matching probabilities)

Hb Between populations gene diversities

betaiovl Average \eqn{\beta_i} over loci (Population specific FSTs)

betaW Average of the betaiovl (overall population FST)

ci The bootstrap confidence interval of population specific FSTs
(only if more than 100 bootsraps requested and if more than 10 loci are present)

if betaijT=TRUE, return the matrix of pairwise coancestries only.
}
\description{
Estimate populations (Population specific FST) or individual coancestries 
and a bootstrap confidence interval, assuming random mating
}
\details{
If betaijT=TRUE, and the first column contains a unique identifier for 
each individual, the function returns the matrix of individual coancestries/kinships.  
Individual inbreeding coefficients can be obtained by multiplying by 2 the diagonal 
and substracting 1.
}
\examples{
\dontrun{
#3 different population sizes lead to 3 different betais
dat<-sim.genot(size=40,N=c(50,200,1000),nbloc=50,nbal=10)
betas(dat,nboot=100)
 
#individual coancestries from the smallest population are large
ind.coan<-betas(cbind(1:120,dat[,-1]),betaij=T)
graphics::image(1:120,1:120,ind.coan,xlab="Inds",ylab="Inds")

#extracting individual inbreeding coefficients
dat<-sim.genot(size=20,nbloc=100,nbal=20,mig=0.01,f=c(0,0.3,0.7))
ind.coan<-betas(cbind(1:60,dat[,-1]),betaijT=TRUE)
ind.inb<-(diag(ind.coan)*2-1)
graphics::boxplot(ind.inb~dat[,1], main="Individual inbreeding coefficients")
graphics::points(1:3,c(0,0.3,0.7),pch=16,col="red",cex=2)

}

}
\references{
\href{http://biorxiv.org/content/early/2016/11/17/088260}{Weir and Goudet } A unified characterization of population structure and relatedness.
}
\author{
Jerome Goudet \email{jerome.goudet@unil.ch}
}
