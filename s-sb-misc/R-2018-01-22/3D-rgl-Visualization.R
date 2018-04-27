install.packages('emdbook')
install.packages('rgl')

library('emdbook')
library('rgl')
sfun <- function(x,y) {
  d <- 3 * sqrt(x^2 + y^2)
  exp(-0.02 * d^2) * sin(d)
}

cc <- curve3d(sfun(x,y),xlim=c(-pi,pi),ylim=c(-pi,pi),n=c(50,50),
              sys3d="rgl")

colvec <- colorRampPalette(c("pink","white","lightblue"))(100)
with(cc,persp3d(x,y,z,col=colvec[cut(z,100)],alpha=0.5))
pts <-   data.frame(x=c(2,2,2), y=c(-2,-2,-2), z=c(.5,0,-.5))
with(pts,spheres3d(x,y,z,col="blue",radius=0.1))
rgl.snapshot("rgltmp1.png")
