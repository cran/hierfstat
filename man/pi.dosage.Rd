% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/div_dosage.R
\name{pi.dosage}
\alias{pi.dosage}
\title{Estimates nucleotide diversity (\eqn{\pi}) from dosage data}
\usage{
pi.dosage(dos,L=NULL)
}
\arguments{
\item{dos}{a ni X nl dosage matrix containing the number of derived/alternate alleles each individual carries
at each SNP}

\item{L}{the length of the sequence}
}
\value{
if \code{L=NULL} (default), returns the sum over SNPs of nucleotide diversity; 
otherwise return the average nucleotide diversity per nucleotide given the length \code{L} of the sequence
}
\description{
Estimates nucleotide diversity \eqn{\pi= \sum_l 2 p_ l(1-p_l) 2n/(2n-1)} from a
dosage matrix
}
