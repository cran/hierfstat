betai <- function(gendata){
# june 21st 2012
# estimates betas from Weir & Hill 2002 Ann Rev Genet
# gendata is a data frame with first column containing pop id and remaining cols containing genotypes
# betai are from (7) of WH2002
# betaio are population estimates over loci 1-(sum of nums)/(sum of dens)
# betaw are average over populations using (9) of WH2002
# betaii' can be extracted with betas[1,,] etc...

nloc <- dim(gendata)[2]-1
npop <- dim(table(gendata[,1]))
ninds <- 2*ind.count(gendata) #BEWARE! allele rather than genotype counts!
p <- pop.freq(gendata)
pb <- pop.freq(cbind(rep(1,dim(gendata)[1]),gendata[,-1]))
n2 <- ninds^2
n2 <- sweep(n2,2,apply(ninds,2,sum),FUN="/")
nic <- ninds-n2 #top of p729, WH2002
snic <- apply(nic,2,sum) #sum over pop
betas <- array(dim=c(npop,npop,nloc))
nums <- array(dim=c(npop,npop,nloc))
lden <- numeric(nloc)
for (il in 1:nloc){
  dum1 <- sweep(sweep(p[[il]],1,pb[[il]],FUN="-")^2,2,ninds[,il],FUN="*")
  dum2 <- sweep(p[[il]]*(1.0-p[[il]]),2,nic[,il],FUN="*")
  sden <- sum(dum1+dum2)
  lden[il] <- sden
  for (ip1 in 1:npop){
    for (ip2 in ip1:npop){
      if (ip1==ip2){
        dum1 <- p[[il]][,ip1]*(1.0-p[[il]][,ip1])
        nums[ip1,ip1,il] <- snic[il]*ninds[ip1,il]/(ninds[ip1,il]-1.0)*sum(dum1)
        betas[ip1,ip1,il] <- 1.0-nums[ip1,ip1,il]/sden
      }
      else{
        dum1 <- p[[il]][,ip1]*(1.0-p[[il]][,ip2])
        dum2 <- p[[il]][,ip2]*(1.0-p[[il]][,ip1])
        nums[ip1,ip2,il] <- snic[il]*sum(dum1+dum2)
        betas[ip1,ip2,il]  <- 1.0-nums[ip1,ip2,il]/2.0/sden
      }
    }
  }
}
betai  <- t(apply(betas,3,diag)) # betai per pop and locus

betaio  <- 1-apply(apply(nums,3,diag),1,sum)/sum(lden) # beta per pop over loci, as sums of numerators divided by sums of denominators

betaw  <- 1-apply(apply(nums,3,diag)*ninds,2,sum)/(apply(ninds,2,sum)*lden) # beta overall per loci, eq 9 p 734 of Weir & Hill 2002,

return(list(betaiip=betas,nic=snic,betai=betai,betaiov=betaio,betaw=betaw))
}
