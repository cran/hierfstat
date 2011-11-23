\name{wc}
\alias{wc}
\title{Computes Weir and Cockrham estimates of Fstatistics}
\description{Computes Weir and Cockrham estimates of Fstatistics}
\usage{wc(ndat,diploid=TRUE,pol=0.0)}
\arguments{
\item{ndat}{data frame with first column indicating population of origin and following representing loci}
\item{diploid}{Whether data are diploid}
\item{pol}{level of polymorphism reqesuted for inclusion. Note used for now}

}

\value{
\item{sigma}{variance components of allele frequencies for each allele, in the order among populations, among individuals within populations and within individuals}
\item{sigma.loc}{variance components per locus}
\item{per.al}{FST and FIS per allele}
\item{per.loc}{FST and FIS per locus}
\item{FST}{FST overall loci}
\item{FIS}{FIS overall loci}
}
%\references{}
\author{Jerome Goudet \email{jerome.goudet@unil.ch}}

%\seealso{\code{\link{}}.}
\examples{data(gtrunchier)
wc(gtrunchier[,-1])
}
\keyword{univar}
