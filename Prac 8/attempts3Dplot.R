library(scatterplot3d)
x <-c(0,0,8,8)
y <- c(0, 0, 8, 8)
z <-  c(0, 4, 4, 0)
s3d <- scatterplot3d(x, y,z, highlight.3d=TRUE,  col.axis="black", xlab="X", ylab="y",zlab="z", axis=TRUE, type="p",box=FALSE, angle=60, xlim=c(-5,5),ylim=c(-5,5),zlim=c(-5,5), bg="blue",type="n") 

s3d$plane3d(0,1,0, col="blue", lty = 1)

