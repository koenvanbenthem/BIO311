library(ggplot2)
library(grDevices)

x5 <- function(x) return(sin(x)+x^2+cos(x^3))
dx5<- function(x) return(cos(x)+2*x-3*x^2*sin(x^3))

draw_tang<-function(pl,interc,slope,loc,lab){
	dist<-0.25
 pl<- pl+geom_segment(x=loc-dist,xend=loc+dist,y=(interc+slope*(loc-dist)),yend=(interc+slope*(loc+dist)),color="red") + annotate("text", x = loc, y = interc+slope*loc+0.2, label = lab) + geom_point(x=loc, y=interc+slope*loc, color="green", size=1)
	return(pl)
}


x<-seq(-1,1.9,0.01)

g12<-ggplot(data.frame(x=x,y=x5(x)), aes(x,y)) + geom_line(color="blue") + xlim(-1.1, 2) +  theme_bw() +  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text = element_blank()
    ,axis.title = element_blank()
    
  ) 
  
  
locs<-c(1.3,0.5) # x coordinate where the tangent is drawn
labels<-c("A","B") # Labels of these coordinates
for(i in 1:length(locs)){
	loc<-locs[i]
	g12<-draw_tang(g12,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}
pdf('a.pdf')

print(g12)
dev.off()

pdf('b.pdf')
N<-c(2,5,10,2000)
size<-(max(x)-min(x))/N
for(i in 1:length(size)){
xs<-seq(min(x)-0.5*size[i],max(x)+0.5*size[i],size[i])
ys<-x5(xs)
g14<-ggplot(data.frame(x=xs,y=ys), aes(x=x,y=y,width=size[i])) + geom_histogram(stat="identity",colour = "red", fill = "red",alpha=0.5) + stat_function(fun = function(x) x5(x) ,colour = "blue") + scale_x_continuous(limits = c(-1, 1.9)) +  theme_bw() +  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text = element_blank()
    ,axis.title = element_blank()
    
  ) 
  
print(g14)
}
dev.off()

g15<-ggplot(data.frame(x=x,y=x5(x)),aes(x=x,y=y)) + geom_area(colour="blue",fill="blue",alpha=0.5)
print(g15)