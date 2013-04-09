\name{betai}
\alias{betai}
\title{Estimation of \eqn{\beta} per population}
\description{Estimates \eqn{\beta} (Fst) per population}
\usage{betai(gendata)}
\arguments{
\item{gendata}{A data frame containing the population of origin in the first column and the genotypes in the following ones}
}

\value{
\item{betai}{ \eqn{\beta_i} are from (7) of WH2002}
\item{betaio}{\eqn{\beta_{io}} are population estimates over loci 1-(sum of nums)/(sum of dens)}
\item{betaw}{\eqn{\beta_w} are average over populations using (9) of WH2002}
\item{betaii'}{\eqn{\beta_{ii'}} can be extracted with betas[1,,] etc...}
}
\references{Weir and Hill (2002) ESTIMATING F-STATISTICS. Annual review of Genetics. 36:721}
\author{Jerome Goudet \email{jerome.goudet@unil.ch}}

%\seealso{\code{\link{}}.}
\examples{
data(gtrunchier)
betai(gtrunchier[,-2])
}
\keyword{univar}
