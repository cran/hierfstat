################################################################################
sim.freq<-function(nbal=4,nbloc=2,nbpop=3,N=1000,mig=0.001,mut=0.001,f=0){
genofreq<-function(freq){
if (f==0) {geno.freq<-outer(freq,freq)}
else {geno.freq<-outer(freq,freq)*(1-f)+diag(nbal)*diag(freq)*f}
return(geno.freq)
}
if (nbal>99) stop ("Too many alleles, must be <100. Exiting")
cl<-match.call()
pl<-vector("list",nbloc)
freq<-rdirichlet(nbloc,rep(1,nbal)) #1=uniform
param<-2*N*(mig+mut)*freq #verify this
for (il in 1:nbloc){
x<-matrix(numeric(nbal*nbpop),nrow=nbpop)
for (ip in 1:nbpop) x[ip,]<-rdirichlet(1,param[il,])
pl[[il]]<-x
}
gf<-vector("list",nbloc)
for (il in 1:nbloc) gf[[il]]<-apply(pl[[il]],1,genofreq)
if (nbal<10)
nfun<-function(x,y) x*10+y
else
nfun<-function(x,y) x*100+y
gn<-as.numeric(outer(1:nbal,1:nbal,nfun))
return(list(call=cl,fpl=pl,gf=gf,gn=gn))
}
#########################################################################
sim.genot<-function(size=20,nbal=4,nbloc=2,nbpop=3,N=1000,mig=0.001,mut=0.001,f=0){
a<-sim.freq(nbal,nbloc,nbpop,N,mig,mut,f)
dat<-data.frame(rep(1:nbpop,each=size),matrix(numeric(nbloc*nbpop*size),ncol=nbloc))
names(dat)<-c("Pop",paste("loc",1:nbloc,sep="."))
dumf<-function(x) sample(a$gn,size=size,replace=TRUE,prob=x)
for (il in 1:nbloc) dat[,il+1]<-as.numeric(apply(a$gf[[il]],2,dumf))
return(dat)
}
