x<-seq(0,1,0.01)
y1<-function(x){x^3+x^(1/4)}
y2<-function(x){x^6+x^(1/8)}

py1<-ggplot(data.frame(x=x,y=y1(x)), aes(x=x,y=y)) + geom_area(colour = "blue", fill="blue",alpha=0.5) + theme_bw() + theme(
    plot.background = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(size=20)
    , axis.text.y=element_text(size=20)
    ,axis.title = element_blank()
    
  ) 
  
  py2<-ggplot(data.frame(x=x,y=y2(x)), aes(x=x,y=y)) + geom_area(colour = "blue", fill="blue",alpha=0.5) + theme_bw() + theme(
    plot.background = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(size=20)
    , axis.text.y=element_text(size=20)
    ,axis.title = element_blank()
    
  ) 
pdf("ex_int.pdf")
print(py1)
print(py2)
dev.off()

pdf("ex_int2.pdf")
x<-seq(0,1,0.001)
x2<-seq(1,0,-0.001)
y1<-function(x){x^2}
y2<-function(x){x^4-0.25*x^5+0.25*x^3}
yy1<-y1(x)
yy2<-y2(x2)
x<-c(x,x2)
y<-c(yy1,yy2)
coli<-c(rep("red",length(x)),rep("blue",length(x)))

  py3<-ggplot(data.frame(x=x,y=y), aes(x=x,y=y)) + geom_polygon(alpha=0.65,fill="darkgreen",colour="darkgreen") + theme_bw() + theme(
    plot.background = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(size=20)
    , axis.text.y=element_text(size=20)
    ,axis.title = element_blank()
    
  )

print(py3)
dev.off()