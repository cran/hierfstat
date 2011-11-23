\name{boot.ppfis}
\alias{boot.ppfis}
\title{Performs bootstrapping over loci of population's Fis}
\description{Performs bootstrapping over loci of population's Fis}
\usage{boot.ppfis(dat=dat,nboot=100,quant=c(0.025,0.975),diploid=TRUE,dig=4,...)}
\arguments{
\item{dat}{a genetic data frame}
\item{nboot}{number of bootstraps}
\item{quant}{quantiles}
\item{diploid}{whether diploid data}
\item{dig}{digits to print}
\item{...}{further arguments to pass to the function}
}

\value{
\item{call}{function call}
\item{fis.ci}{Bootstrap ci of Fis per population}
}
%\references{}
\author{Jerome Goudet \email{jerome.goudet@unil.ch}}

%\seealso{\code{\link{}}.}
\examples{data(gtrunchier)
boot.ppfis(gtrunchier[,-2])}
\keyword{univar}
