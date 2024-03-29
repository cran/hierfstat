% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/pairwise.fst.R
\name{pairwise.neifst}
\alias{pairwise.neifst}
\title{Estimates pairwise FSTs according to Nei (1987)}
\usage{
pairwise.neifst(dat,diploid=TRUE)
}
\arguments{
\item{dat}{A data frame containing population of origin as the first column and 
multi-locus genotypes in following columns}

\item{diploid}{whether the data is from a diploid (default) or haploid organism}
}
\value{
A matrix of pairwise FSTs
}
\description{
Estimate pairwise FSTs according to Nei (1987)
}
\details{
FST are calculated using Nei (87) equations for FST', as described in the note 
section of  \link{basic.stats}
}
\examples{

data(gtrunchier)
pairwise.neifst(gtrunchier[,-2],diploid=TRUE)

}
\references{
Nei, M. (1987) Molecular Evolutionary Genetics. Columbia University Press
}
\seealso{
\link{pairwise.WCfst} \link{genet.dist} \link{basic.stats}
}
\author{
Jerome Goudet \email{jerome.goudet@unil.ch}
}
