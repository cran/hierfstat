\name{sim.genot}
\alias{sim.genot}
\title{Simulates genotypes in an island model at equilibrium}
\description{Simulates genotypes from several individuals in several populations at several loci in an island model at equilibrium}
\usage{sim.genot(size=20,nbal=4,nbloc=2,nbpop=3,N=1000,mig=0.001,mut=0.001,f=0)}
\arguments{
\item{size}{The number of individuals to sample per populations}
\item{nbal}{The maximum number of alleles present at a locus}
\item{nbloc}{The number of loci to simulate}
\item{nbpop}{The number of populations to simulate}
\item{N}{The population size of an island}
\item{mig}{the proportion of migration among islands}
\item{mut}{The loci mutation rate}
\item{f}{the inbreeding coefficient}
}

\value{
a data frame with nbpop*size lines and nbloc+1 columns. Individuals are in rows and genotypes in columns, the first column being the population identifier}
%\references{}
\author{Jerome Goudet \email{jerome.goudet@unil.ch}}

%\seealso{\code{\link{}}.}
\examples{
dat<-sim.genot(nbpop=10,nbal=20,nbloc=10,mig=0.001,mut=0.0001,f=0.5)
basic.stats(dat)
}
