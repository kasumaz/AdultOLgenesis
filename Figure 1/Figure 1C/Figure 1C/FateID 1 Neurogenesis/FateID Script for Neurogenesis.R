library(FateID)
library(dplyr)


##################################################################
FMarker <- list(c("Hopx","Ascl1","Hes5"), "Plp1", "Mbp")
xf <- getPart(x,FMarker,fthr=NULL,n=5)
head(xf$part)
tar <- xf$tar
y <- xf$part
##################################################################

#########################################################################################
v <- scex
rc <- reclassify(x, y, tar, clthr=.75, nbfactor=5, use.dist=FALSE, seed=12345, nbtree=NULL, q=0.9)
y  <- rc$part ## this is needed with y in the right way as a vector. fatebias or fb runs when this part runs
x  <- rc$xf
x <- getFeat(x,y,tar,fpv=0.01) # dont know what v is, its related to diff expression

#Ignore probably
####################################################################################
save.image()




##Start from here:
x <- read.csv("x_matrix.csv", header = TRUE, row.names = 1)

x <- read.csv("x_matrix.csv", header = TRUE, row.names = 1)

v <- read.csv("v_matrix.csv", header = TRUE, row.names = 1)


# Load the counts dataset

x <- scex
v <- scex
##worked in this way
y <- x$y



tar <- c(11,13)
tar <- c(11,13)
#it needs 2 targets actually for FB to run

names(y) <- colnames(v) 
# this has to be done according to dominic. 

c(y, v) 
y <- c(y, v) 

fb  <- fateBias(x, y, tar, z=NULL, minnr=5, minnrh=10, adapt=TRUE, confidence=0.75, nbfactor=5, use.dist=FALSE, seed=12345, nbtree=NULL)

dr  <- compdr(x, z=NULL, m=c("tsne","cmd","dm","lle","umap"), k=c(2,3), lle.n=30, dm.sigma="local", dm.distance="euclidean", tsne.perplexity=30, seed=12345)


plotFateMap(y,dr,k=2,m="cmd")
plotFateMap(y,dr,k=3,m="cmd")
plotFateMap(y,dr,k=2,m="cmd",fb=fb,g="t11") #the to represent the final cell cluster

plotFateMap(y,dr,k=2,m="cmd",fb=fb,g="t11", xcol=fcol) #the to represent the final cell cluster

#this part needs that v matrix of the most important top 10 genes of every cluster. It takes the column names to combine onto the numbers
pr <- plotFateMap(y,dr,k=2,m="cmd",trthr=.33,fb=fb,prc=TRUE) 

pr <- plotFateMap(y,dr,k=2,m="cmd",trthr=.2,fb=fb,prc=TRUE, start = 2, tp, col = c("seashell3","seashell3","pink3","pink3","rosybrown3","rosybrown3","indianred2","indianred2","firebrick2","firebrick2","blue3","blue3","red1","red1","red3","red3")) 


pr <-plotFateMap(y, dr, k=2, m="tsne", g=c("Mbp", "Hopx"), n="Defa", x=v) #didnt work - but worked again for me. but works once i change the true to false in the first pr command

E <- plotFateMap(y,dr,k=2,m="cmd",g="E",fb=fb) #didnt work - but worked again for me. but works once i change the true to false in the first pr command.

head(E)


pr  <- prcurve(y,fb,dr,k=3,m="cmd",trthr=0.4,start=3)
pr  <- prcurve(y,fb,dr,k=2,m="cmd",trthr=0.4,start=1) 
# there are warning messages 

n <- pr$trc[["t13"]]

trc <- dptTraj(x,y,fb,trthr=.25,distance="euclidean",sigma=1000)
#error message

fs  <- filterset(v,n=n,minexpr=2,minnumber=1) #v is the top 10 genes of each cluster

s1d <- getsom(fs,nb=1000,alpha=.5)
ps  <- procsom(s1d,corthr=.85,minsom=3)

##All of these worked below. 
set.seed(111111)
fcol <- sample(rainbow(max(y)))  
fcol <-c("seashell3","seashell3","pink3","pink3","rosybrown3","rosybrown3","indianred2","indianred2","firebrick2","firebrick2","blue3","blue3","red1","red1","red3","red3")

plotheatmap(ps$nodes.z, xpart=y[n], xcol=fcol, ypart=unique(ps$nodes), xgrid=FALSE, ygrid=TRUE, xlab=TRUE)

plotheatmap(ps$all.z, xpart=y[n], xcol=fcol, ypart=ps$nodes, xgrid=FALSE, ygrid=TRUE, xlab=FALSE)

plotheatmap(ps$all.e, xpart=y[n], xcol=fcol, ypart=ps$nodes, xgrid=FALSE, ygrid=TRUE, xlab=FALSE)

plotheatmap(ps$all.b, xpart=y[n], xcol=fcol, ypart=ps$nodes, xgrid=FALSE, ygrid=TRUE, xlab=FALSE)

plotheatmap(ps$all.b, xpart=y[n], xcol=fcol, ypart=ps$nodes, xgrid=TRUE, ygrid=TRUE, xlab=TRUE)

##The average pseudo-temporal expression profile of this group can be plotted by the function 
g <- names(ps$nodes)[ps$nodes == 1]
plotexpression(fs, y, g, n, col=fcol, name="Node 1", cluster=FALSE, alpha=.5, types=NULL)
#plotting expression of specific genes in the fs list
plotexpression(fs, y, "Olig2", n, col=fcol, cluster=TRUE, alpha=.5, types=NULL)

plotexpression(fs, y, "Hopx", n, col=fcol, cluster=FALSE, alpha=.5, types=NULL)

plotexpression(fs, y, "Olig1", n, col=fcol, cluster=TRUE, alpha=.5, types=NULL)

plotexpression(fs, y, g, n, col=fcol, name="Node 1", cluster=FALSE, types=sub("\\_\\d+","",n))

#diff expression - didnt work
thr <- .5
a   <- "t13"
b   <- "t12"
cl  <- c(3,4,5)
A <- rownames(fb$probs)[fb$probs[,a] > thr]
A <- A[y[A] %in% cl]
B <- rownames(fb$probs)[fb$probs[,b] > thr]
B <- B[y[B] %in% cl]
de <- diffexpnb(v,A=A,B=B,DESeq=FALSE,norm=FALSE,vfit=NULL,locreg=FALSE)

#plotting fate bias:
gene2gene(x$v,x$y,"Olig2","Plp1")


k <- impGenes(fb,"t13", "t12")
k <- impGenes(fb,"t13") #didnt work
############
sessioninfo::session_info()
