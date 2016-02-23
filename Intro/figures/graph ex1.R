setwd("C://Users//cornioley_t//Dropbox//Psch//course material pop ecol 2014")
library(ggplot2)
library(grDevices)


x1 <- function(x) {x+1}
#question1
ggplot(data.frame(x=c(0, 5)), aes(x)) + stat_function(fun=x1) + xlim(0, 5) + ylim(0,5) + coord_fixed(ratio = 1)
#answer1

ggplot(data.frame(x=c(0, 5)), aes(x)) + stat_function(fun=x1) + xlim(0, 5) + ylim(0,5) + coord_fixed(ratio = 1) + geom_segment(aes(x=1,xend=2,y=2,yend=2)) + geom_segment(aes(x=2,xend=2,y=2,yend=3)) + annotate('text', x = 1.5, y = 1.7,                                                                                                                                                                                                          label = "delta~x~is~2-1==1 ", parse = TRUE, size=2) + annotate('text', x = 2.7, y = 2.5,                                                                                                                                                                                                          label = "delta~y~is~3-2==1 ", parse = TRUE, size=2) + annotate('text', y = 1.8, x = 4,                                                                                                                                                                                                          label = "Thus~we~have~a~slope~of~1 ", parse = TRUE, size=2) 

#question2
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=exp) 
#answer2
x<-seq(0,5,0.01)
y<-exp(x)
col<-as.integer(exp(x)>0) ## This just has to be the derivative of the function. In the case of exp(x) it is also exp(x)
bla<-data.frame(x=x,y=y,col=col)
ggplot(bla,aes(x=x,y=y,colour=col)) + geom_line() + theme(legend.position="none")


#question3
x2 <- function(x) {x^2}
ggplot(data.frame(x=c(-3, 3)), aes(x)) + coord_fixed(ratio = 1) + stat_function(fun=x2) 
#Answer3
data2.labels <- data.frame(
  x = c(-2.5, 0, 2.5), 
  y = c(3.6, -0.4, 3.6), 
  label = c("(-2,4) ", "(0,0) ", "(2,4) ")
)

ggplot(data.frame(x=c(-3, 3)), aes(x)) + coord_fixed(ratio = 1) + stat_function(fun=x2) + geom_point(x=0, y=0, size=1, color="red")+  geom_segment(aes(x=-1.5,xend=-2.5,y=2,yend=6, color="red"))+ geom_point(x=-2, y=4, size=1, color="red")+  geom_segment(aes(x=1.5,xend=2.5,y=2,yend=6, color="red"))+ geom_point(x=2, y=4, size=1, color="red")+theme(legend.position="none") + geom_text(data = data2.labels, aes(x=x, y=y, label = label, size=1))

#question4
x3 <- function(x) {sin(x)}
ggplot(data.frame(x=c(-3.5, 3.5)), aes(x)) + stat_function(fun=x3)+ xlim(-3, 3) + ylim(-3,3) + coord_fixed(ratio = 1) 
#Answer4
data3.labels <- data.frame(
  x = c(-1.5707, 1.3, 1.5707), 
  y = c(-1.3, -0.2, 1.3), 
  label = c("derivative is zero ", "derivative is 1 ", "derivative is zero ")
)
ggplot(data.frame(x=c(-3.5, 3.5)), aes(x)) + stat_function(fun=x3)+ xlim(-3, 3) + ylim(-3,3) + coord_fixed(ratio = 1)+ geom_segment(aes(x=-0.5, xend=0.5, y=-0.5, yend=0.5, color="red")) + geom_point(x=0, y=0, size=1, color="red", size=1) + geom_segment(aes(x=-2, xend=-1, y=-1, yend=-1, color="red")) + geom_point(x=-1.5707, y=-1, color="red", size=1) + geom_segment(aes(x=2, xend=1, y=1, yend=1, color="red")) + geom_point(x=1.5707, y=1, color="red", size=1) +theme(legend.position="none")+ geom_text(data = data3.labels, aes(x=x, y=y, label = label, size=1))

#Question5
ggplot(data.frame(x=c(-5, 5)), aes(x)) + stat_function(fun=sign) + xlim(-5, 5) + ylim(-5,5) + coord_fixed(ratio = 1)
#Answer5
data4.labels <- data.frame(
  x = c(-2.5,3), 
  y = c(-1.5,1.5), 
  label = c("derivative is zero ", "derivative is zero ")
)
ggplot(data.frame(x=c(-5, 5)), aes(x)) + stat_function(fun=sign) + xlim(-5, 5) + ylim(-5,5) + coord_fixed(ratio = 1) + geom_segment(aes(x=-5, xend=-4, y=-1, yend=-1, color="red")) + geom_point(x=-5, y=-1, color="red", size=1) + geom_segment(aes(x=2.5, xend=3.5, y=1, yend=1, color="red")) + geom_point(x=3, y=1, color="red", size=1) +theme(legend.position="none")+ geom_text(data = data4.labels, aes(x=x, y=y, label = label, size=1))

#Question6
x4 <- function(x) {sin(x^2)}
ggplot(data.frame(x=c(-3.5, 3.5)), aes(x)) + stat_function(fun=x4)+ xlim(-3, 3) + ylim(-3,3) + coord_fixed(ratio = 1) 
#Answer6
daf <- data.frame(
  x = c(0,sqrt(pi/2),-sqrt(pi/2),sqrt(3*pi/2),-sqrt(3*pi/2), sqrt(5*pi/2), -sqrt(5*pi/2)), 
  y = c(0,1,1,-1,-1,1,1),
  label("zero", "zero","zero" ,"zero" ,"zero" ,"zero" ,"zero")
 )
x<-seq(-3.5,3.5,0.01)
y<-sin(x^2)
col<-as.integer(2*x*cos(x^2)>0) ## This just has to be the derivative of the function. In this case this is 2*x*cos(x^2)
bla<-data.frame(x=x,y=y,col=col)
ggplot(bla,aes(x=x,y=y,colour=col)) + geom_line() + xlim(-3, 3) + ylim(-3,3) + coord_fixed(ratio = 1) + geom_point(data = daf, color="red")+ geom_segment(aes(x=-0.9, xend=-1.6, y=1, yend=1),color="red")+ geom_segment(aes(x=-1.8, xend=-2.5, y=-1, yend=-1),color="red")+ geom_segment(aes(x=-2.5, xend=-3, y=1, yend=1),color="red")+ geom_segment(aes(x=-0.3, xend=0.3, y=0, yend=0),color="red")+ geom_segment(aes(x=0.9, xend=1.6, y=1, yend=1),color="red")+ geom_segment(aes(x=1.8, xend=2.5, y=-1, yend=-1),color="red")+ geom_segment(aes(x=2.5, xend=3, y=1, yend=1),color="red")+theme(legend.position="none")

#graph for theory on derivatives
x5 <- function(x) ifelse(x>=-1 & x<=1.9, (sin(x)+x^2+cos(x^3)), NA)
x6<- function(x) ifelse(x>=-1 & x<=1.9, (-3*(x^2)*sin(x^3)+2*x+cos(x)), NA)
g1<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, color="blue")+  theme_bw() + theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
  , axis.text = element_blank()
  ,axis.title = element_blank()
) 
g1

pdf("der_graph1.pdf")
g11<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, , color="blue")+ xlim(-1.1, 2) + geom_abline(intercept=(0.65), slope=((-3)*(-.5^2)*sin(-.5^3)+cos(-0.5)+2*(-.5)), color="red") +  theme_bw() +  geom_point(x=-0.5, y=sin(-0.5)+(-0.5)^2+cos(-0.5^3), color="green", size=3)+
  annotate("text", x = -0.5, y = 1, label = "A", size=8)+
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text = element_blank()
    ,axis.title = element_blank()
    
  ) 
g11
print(g11)
dev.off()




g2<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, , color="blue")+ xlim(-1.1, 2) + geom_abline(intercept=(2.35), slope=1.65, color="red") +  theme_bw() + geom_segment(aes(x=-1,xend=-0.95,y=0.74,yend=0.74), x=-Inf) + geom_segment(aes(x=-0.95,xend=-0.95,y=0,yend=sin(-0.95)+(-0.95)^2+cos(-0.95^3)), y=-Inf) +                                                                                                                                                                                                                                                 geom_segment(aes(x=-1,xend=1.85,y=sin(1.85)+1.85^2+cos(1.85^3),yend=sin(1.85)+1.85^2+cos(1.85^3)), x=-Inf) + geom_segment(aes(x=1.85,xend=1.85,y=0,yend=sin(1.85)+1.85^2+cos(1.85^3)), y=-Inf) + 
  scale_x_continuous(breaks=c(-0.95, 1.85),        labels=c("x", "x+dx"))+  
  scale_y_continuous(breaks=c(sin(-0.95)+(-0.95)^2+cos(-0.95^3), sin(1.85)+1.85^2+cos(1.85^3)),                                      labels=c("y", "y+dy")) +
theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
   ,axis.title = element_blank()

) 
g2


g3<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, , color="blue")+ xlim(-1.1, 2) + geom_abline(intercept=(2.35), slope=1.65, color="red") +  theme_bw() + geom_segment(aes(x=-1,xend=-0.95,y=0.74,yend=0.74), x=-Inf) + geom_segment(aes(x=-0.95,xend=-0.95,y=0,yend=sin(-0.95)+(-0.95)^2+cos(-0.95^3)), y=-Inf) +                                                                                                                                                                                                                                                 geom_segment(aes(x=-1,xend=1.85,y=sin(1.85)+1.85^2+cos(1.85^3),yend=sin(1.85)+1.85^2+cos(1.85^3)), x=-Inf) + geom_segment(aes(x=1.85,xend=1.85,y=0,yend=sin(1.85)+1.85^2+cos(1.85^3)), y=-Inf) + 
  scale_x_continuous(breaks=c(-0.95, 1.85),        labels=c("x", "x+dx"))+  
  scale_y_continuous(breaks=c(sin(-0.95)+(-0.95)^2+cos(-0.95^3), sin(1.85)+1.85^2+cos(1.85^3)),                                      labels=c("y", "y+dy")) +
  geom_point(x=0.5, y=sin(0.5)+0.5^2+cos(0.5^3), color="green", size=3) + geom_point(x=-0.5, y=sin(-0.5)+(-0.5)^2+cos(-0.5^3), color="green", size=3) +
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    ,axis.title = element_blank()
    
  )
g3

g4<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, , color="blue")+ xlim(-1.1, 2) + geom_segment(aes(x=-0.5, xend=0.5, y=sin(-0.5)+(-0.5)^2+cos(-0.5^3), yend=sin(0.5)+0.5^2+cos(0.5^3)), color="red") +  theme_bw() + geom_segment(aes(x=-1,xend=-0.95,y=0.74,yend=0.74), x=-Inf) + geom_segment(aes(x=-0.95,xend=-0.95,y=0,yend=sin(-0.95)+(-0.95)^2+cos(-0.95^3)), y=-Inf) +                                                                                                                                                                                                                                                 geom_segment(aes(x=-1,xend=1.85,y=sin(1.85)+1.85^2+cos(1.85^3),yend=sin(1.85)+1.85^2+cos(1.85^3)), x=-Inf) + geom_segment(aes(x=1.85,xend=1.85,y=0,yend=sin(1.85)+1.85^2+cos(1.85^3)), y=-Inf) + 
  scale_x_continuous(breaks=c(-0.95, 1.85),        labels=c("x", "x+dx"))+  
  scale_y_continuous(breaks=c(sin(-0.95)+(-0.95)^2+cos(-0.95^3), sin(1.85)+1.85^2+cos(1.85^3)),                                      labels=c("y", "y+dy")) +
  geom_point(x=0.5, y=sin(0.5)+0.5^2+cos(0.5^3), color="green", size=3) + geom_point(x=-0.5, y=sin(-0.5)+(-0.5)^2+cos(-0.5^3), color="green", size=3) +
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    ,axis.title = element_blank()
    
  )
g4

g4<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, color="blue")+ xlim(-1.1, 2)   + geom_segment(aes(x=-1,xend=1,y=0.7,yend=sin(1)+1^2+cos(1^3), color="red")) + geom_segment(aes(x=1,xend=1.85,y=sin(1)+1^2+cos(1^3),yend=sin(1.85)+1.85^2+cos(1.85^3), color="red")) +  theme_bw() + geom_segment(aes(x=-1,xend=-0.95,y=0.74,yend=0.74), x=-Inf) + geom_segment(aes(x=-0.95,xend=-0.95,y=0,yend=sin(-0.95)+(-0.95)^2+cos(-0.95^3)), y=-Inf) +                                                                                                                                                                                                                                                 geom_segment(aes(x=-1,xend=1.85,y=sin(1.85)+1.85^2+cos(1.85^3),yend=sin(1.85)+1.85^2+cos(1.85^3)), x=-Inf) + geom_segment(aes(x=1.85,xend=1.85,y=0,yend=sin(1.85)+1.85^2+cos(1.85^3)), y=-Inf) +                                                                                                                                                                                                                                                 geom_segment(aes(x=-1,xend=1,y=sin(1)+1^2+cos(1^3),yend=sin(1)+1^2+cos(1^3)), x=-Inf) + geom_segment(aes(x=1,xend=1,y=0,yend=sin(1)+1^2+cos(1^3)), y=-Inf) 
+  
  scale_x_continuous(breaks=c(-0.95, 1, 1.85),        labels=c("x","x+dx1" "x+dx"))
+ 
  scale_y_continuous(breaks=c(sin(-0.95)+(-0.95)^2+cos(-0.95^3), sin(1)+1^2+cos(1^3), sin(1.85)+1.85^2+cos(1.85^3)),                                      labels=c("y", "y+yd", "y+dy")) +
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    ,axis.title = element_blank()
    
  ) 
g4


#graph for theory on derivatives

ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5)+ xlim(-1,1.9) +  theme_bw() + theme(
 
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
  , axis.text = element_blank()
  ,axis.title = element_blank()
) 


library(ggplot2)
library(grDevices)

x5 <- function(x) return(sin(x)+x^2+cos(x^3))
dx5<- function(x) return(cos(x)+2*x-3*x^2*sin(x^3))

pdf("der_graph2.pdf")
draw_tang<-function(pl,interc,slope,loc,lab){
  dist<-0.25
  pl<- pl+geom_segment(x=loc-dist,xend=loc+dist,y=(interc+slope*(loc-dist)),yend=(interc+slope*(loc+dist)),color="red", size=1) + annotate("text", x = loc, y = interc+slope*loc+0.25, label = lab, size=8) + geom_point(x=loc, y=interc+slope*loc, color="green", size=3)
  return(pl)
}


x<-seq(-1,1.9,0.01)

g12<-ggplot(data.frame(x=x,y=x5(x)), aes(x,y)) + geom_line(color="blue", size=1) + xlim(-1.1, 2) +  theme_bw() +  theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
  , axis.text = element_blank()
  ,axis.title = element_blank()
  
) 


locs<-c(-0.6,0.5,1.001832) # x coordinate where the tangent is drawn
labels<-c("A","B", "C") # Labels of these coordinates
for(i in 1:length(locs)){
  loc<-locs[i]
  g12<-draw_tang(g12,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}


print(g12)
dev.off()
g12

uniroot(dx5, c(-1,1.1))

x5 <- function(x) return(sin(x)+x^2+cos(x^3))
dx5<- function(x) return(cos(x)+2*x-3*x^2*sin(x^3))
pdf("der_graph1.pdf")
draw_tang<-function(pl,interc,slope,loc,lab){
  dist<-0.25
  pl<- pl+geom_segment(x=loc-dist,xend=loc+dist,y=(interc+slope*(loc-dist)),yend=(interc+slope*(loc+dist)),color="red", size=1) + annotate("text", x = loc, y = interc+slope*loc+0.25, label = lab, size=8) + geom_point(x=loc, y=interc+slope*loc, color="green", size=3)
  return(pl)
}


x<-seq(-1,1.9,0.01)

g13<-ggplot(data.frame(x=x,y=x5(x)), aes(x,y)) + geom_line(color="blue", size=1) + xlim(-1.1, 2) +  theme_bw() +  theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
  , axis.text = element_blank()
  ,axis.title = element_blank()
  
) 


locs<-c(-0.6) # x coordinate where the tangent is drawn
labels<-c("A") # Labels of these coordinates
for(i in 1:length(locs)){
  loc<-locs[i]
  g13<-draw_tang(g13,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}
g13
dev.off()

pdf("der_graph3.pdf")
g14<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5 , color="blue", size=1)+ xlim(-1.1, 2)  +  theme_bw() + geom_segment(x=-.6, xend=0.5, y=sin(-.6)+(-.6)^2+cos(-.6^3), yend=sin(0.5)+(0.5)^2+cos(0.5^3), color="coral4", size=1)+ geom_segment(x=-.6, xend=-.6, y=sin(-.6)+(-.6)^2+cos(-.6^3), yend=0, linetype = 2, size=1)+ geom_segment(x=-.6, xend=-2, y=sin(-.6)+(-.6)^2+cos(-.6^3), yend=sin(-.6)+(-.6)^2+cos(-.6^3), linetype = 2, size=1)+ geom_segment(x=0.5, xend=0.5, y=sin(0.5)+(0.5)^2+cos(0.5^3), yend=0, linetype = 2, size=1)+ geom_segment(x=0.5, xend=-2, y=sin(0.5)+(0.5)^2+cos(0.5^3), yend=sin(0.5)+(0.5)^2+cos(0.5^3), linetype = 2, size=1)+  geom_point(x=0.5, y=sin(0.5)+(0.5)^2+cos(0.5^3), color="green", size=3)+
  scale_x_continuous(breaks=c(-0.6, 0.5),        labels=c("x","x+dx"))+ 
  scale_y_continuous(breaks=c((sin(-0.6)+(-0.6)^2+cos(-0.6^3)), (sin(0.5)+0.5^2+cos(0.5^3))),labels=c("f(x)", "f(x+dx)")) +
                                                                                                                                                                                                                                                                                                                                                                                   annotate("text", x = 0.5, y = 2, label = "A'", size=8)+
                                                                                                                                                                                                                                                                                                                                                                                   theme(
                                                                                                                                                                                                                                                                                                                                                                                     plot.background = element_blank()
                                                                                                                                                                                                                                                                                                                                                                                     ,panel.grid.major = element_blank()
                                                                                                                                                                                                                                                                                                                                                                                     ,panel.grid.minor = element_blank()
                                                                                                                                                                                                                                                                                                                                                                                     ,panel.border = element_blank()
                                                                                                                                                                                                                                                                                                                                                                                     , axis.line = element_line()
                                                                                                                                                                                                                                                                                                                                                                                     , axis.text.x = element_text( size=15) 
                                                                                                                                                                                                                                                                                                                                                                                     , axis.text.y = element_text( size=15) 
                                                                                                                                                                                                                                                                                                                                                                                     ,axis.title = element_blank()
                                                                                                                                                                                                                                                                                                                                                                                     
                                                                                                                                                                                                                                                                                                                                                                                   ) 


locs<-c(-0.6) # x coordinate where the tangent is drawn
labels<-c("A") # Labels of these coordinates
for(i in 1:length(locs)){
  loc<-locs[i]
  g14<-draw_tang(g14,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}

g14
dev.off()

pdf("der_graph4.pdf")
g15<-ggplot(data.frame(x=c(-1, 1.9)), aes(x)) + stat_function(fun=x5, , color="blue", size=1)+ xlim(-1.1, 2)  +  theme_bw() + geom_segment(x=-.6, xend=0.2, y=sin(-.6)+(-.6)^2+cos(-.6^3), yend=sin(0.2)+(0.2)^2+cos(0.2^3), color="coral4", size=1)+ geom_segment(x=-.1, xend=-.6, y=sin(-.1)+(-.1)^2+cos(-.1^3), yend=sin(-.6)+(-.6)^2+cos(-.6^3), color="coral4", size=1) + geom_segment(x=0.5, xend=-.6, y=sin(0.5)+(0.5)^2+cos(0.5^3), yend=sin(-.6)+(-.6)^2+cos(-.6^3), color="coral4", size=1) +  geom_point(x=0.2, y=sin(0.2)+(0.2)^2+cos(0.2^3), color="green", size=3)+  geom_point(x=-.1, y=sin(-.1)+(-.1)^2+cos(-.1^3), color="green", size=3)+ geom_point(x=0.5, y=sin(0.5)+(0.5)^2+cos(0.5^3), color="green", size=3)+geom_segment(x=-.6, xend=-.6, y=sin(-.6)+(-.6)^2+cos(-.6^3), yend=0, linetype = 2, size=1)+
  geom_segment(x=0.5, xend=0.5, y=sin(0.5)+(0.5)^2+cos(0.5^3), yend=0, linetype = 2, size=1)+
  geom_segment(x=-.1, xend=-.1, y=sin(-.1)+(-.1)^2+cos(-.1^3), yend=0, linetype = 2, size=1)+
  geom_segment(x=0.2, xend=0.2, y=sin(0.2)+(0.2)^2+cos(0.2^3), yend=0, linetype = 2, size=1)+  geom_point(x=0.2, y=sin(0.2)+(0.2)^2+cos(0.2^3), color="green", size=3)+  geom_point(x=-.1, y=sin(-.1)+(-.1)^2+cos(-.1^3), color="green", size=3)+ geom_point(x=0.5, y=sin(0.5)+(0.5)^2+cos(0.5^3), color="green", size=3)+ 
  annotate("text", x = 0.15, y = 1.65, label = "A''", size=8)+
  annotate("text", x = -.09, y = 1.4, label = "A'''", size=8)+
  annotate("text", x = 0.5, y = 2, label = "A'", size=8)+
  scale_x_continuous(breaks=c(-0.6,0.2,-.1, 0.5),        labels=c("x","x+dx''", "x+dx'''", "x+dx'"))+
  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(angle = 45, hjust = 1, size=15)
    ,axis.text.y=element_blank()
    ,axis.title = element_blank()
    
  ) 


locs<-c(-0.6) # x coordinate where the tangent is drawn
labels<-c("A") # Labels of these coordinates
for(i in 1:length(locs)){
  loc<-locs[i]
  g15<-draw_tang(g15,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}

g15
dev.off()

x7<-function(x) return(x^2)
x<-seq(-2,2,0.01)
quad<-ggplot(data.frame(x=x,y=x7(x)), aes(x,y)) + geom_line(color="blue") + xlim(-2, 2)
quad

#graph for theory on intergarls 
x5 <- function(x) ifelse(x>=-1 & x<=1.9, (sin(x)+x^2+cos(x^3)), NA)
x6<- function(x) ifelse(x>=-1 & x<=1.9, (-3*(x^2)*sin(x^3)+2*x+cos(x)), NA)

x<-seq(-1,1.9,0.01)

i1<-ggplot(data.frame(x=x,y=x5(x)),aes(x=x,y=y)) + geom_area(colour="blue",fill="blue",alpha=0.3)+  theme_bw()+
theme(
  plot.background = element_blank()
  ,panel.grid.major = element_blank()
  ,panel.grid.minor = element_blank()
  ,panel.border = element_blank()
  , axis.line = element_line()
 , axis.text.y=element_blank()
 , axis.text.x=element_text(size=15)
  ,axis.title = element_blank()
  
) + scale_x_continuous(breaks=c(-1, 1.9),        labels=c("a","b"))
print(i1)

#graphs with bins


x<-seq(-1,1.9,0.01)

i2<-ggplot(data.frame(x=x,y=x5(x)), aes(x,y)) + geom_line(color="blue") + xlim(-1.1, 2) +  theme_bw() +  theme(
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
  i2<-draw_tang(i2,(-loc*dx5(loc)+x5(loc)),dx5(loc),loc,labels[i])
}
pdf('a.pdf')

print(i2)
dev.off()


pdf('int_graph2.pdf')
N<-c(5)
size<-(max(x)-min(x))/N
xleft<-3*size+(-1)
xleft
xright<-4*size+(-1)


for(i in 1:length(size)){
  xs<-seq(min(x)-0.5*size[i],max(x)+0.5*size[i],size[i])
  ys<-x5(xs)
  i2<-ggplot(data.frame(x=xs,y=ys), aes(x=x,y=y,width=size[i])) + geom_histogram(stat="identity",colour = "midnightblue", fill="blue",alpha=0.3) + stat_function(fun = function(x) x5(x) ,colour = "blue")+ geom_segment(x=0.74, xend=0.74, y=x5(0.74), yend=-1, linetype = 2) + geom_segment(x=xright, xend=xright, y=x5(xright), yend=-1, linetype = 2) + geom_segment(x=-2, xend=xleft+(size/2), y=x5(xleft+(size/2)), yend=x5(xleft+(size/2)), linetype = 2) + scale_x_continuous(breaks=c(-1,xleft,xright,1.9),        labels=c("a",expression("x"[4]),expression(x[4]~"+dx", "b"))) + scale_y_continuous(breaks=c(x5(xleft+(size/2))),        labels=c("y")) + annotate("text", x = xleft+(size/2), y = 1.3, label ="A[4]", parse=T, color="midnightblue") + annotate("text", x = (-0.15), y = 0.5, label = "<-dx->") + theme_bw() +  theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(size=15)
    ,axis.text.y=element_text(size=15)
    ,axis.title = element_blank()
    
  ) 
  
  print(i2)
}
dev.off()
i2



pdf('int_graph3.pdf')
N<-c(5,10,15,20)
size<-(max(x)-min(x))/N


for(i in 1:length(size)){
  xs<-seq(min(x)-0.5*size[i],max(x)+0.5*size[i],size[i])
  ys<-x5(xs)
  i3<-ggplot(data.frame(x=xs,y=ys), aes(x=x,y=y,width=size[i])) + geom_histogram(stat="identity",colour = "midnightblue", fill="blue",alpha=0.3) + stat_function(fun = function(x) x5(x) ,colour = "blue")+ scale_x_continuous(limits = c(-1, 1.9)) + theme_bw() + scale_x_continuous(breaks=c(-1,1.9), labels=c("a", "b"))+ theme(
    plot.background = element_blank()
    ,panel.grid.major = element_blank()
    ,panel.grid.minor = element_blank()
    ,panel.border = element_blank()
    , axis.line = element_line()
    , axis.text.x = element_text(size=40)
    , axis.text.y=element_blank()
    ,axis.title = element_blank()
    
  ) 
  
  print(i3)
}
dev.off()
i3

pdf('int_graph4.pdf')
 x<-seq(0,6,len=4)


 i4<-ggplot(data.frame(x=x,y=x),aes(x=x,y=y)) +  theme_bw()+ geom_line(color="blue")  + geom_polygon(aes(y=c(0,2,2,0), x=c(2,2,5,5)),  alpha=0.6,fill = "blue") + geom_polygon(aes(y=c(2,5,2,2), x=c(2,5,5,2)),  alpha=0.6,fill = "red") + geom_segment(x=2,xend=2, y=2, yend=0, linetype = 2) + geom_segment(x=5,xend=5, y=5, yend=0, linetype = 2) + geom_segment(x=0,xend=5, y=2, yend=2, linetype = 2) + geom_segment(x=0,xend=5, y=5, yend=5, linetype = 2)+ annotate("text", x=3.5, y = 1, label ="A[1]", parse=T, color="midnightblue")+ annotate("text", x=3.5, y = 2.7, label ="A[2]", parse=T, color="red4")+
    theme(
        plot.background = element_blank()
        ,panel.grid.major = element_blank()
        ,panel.grid.minor = element_blank()
        ,panel.border = element_blank()
        ,panel.background= element_blank()
        , axis.line = element_line()
        , axis.text.y=element_text(size=15)
        , axis.text.x=element_text(size=15)
       ,axis.title = element_blank()
       
        ) + scale_x_continuous(breaks=c(2, 5),        labels=c("a","b"))+
  scale_y_continuous(breaks=c(2, 5),        labels=c("f(a)","f(b)"))
 print(i4)
dev.off()

#differential equations
#ln fct
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=log, n=99999)+theme( axis.text.y=element_text(size=15)
                                                                      , axis.text.x=element_text(size=15))


y1<-function(x){exp(0.33*x)}
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=y1, n=99999)+theme( axis.text.y=element_text(size=15)                                                                             , axis.text.x=element_text(size=15))
y2<-function(x){log(exp(0.33*x))}
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=y2, n=99999)+ylab("ln(y)")+theme( axis.text.y=element_text(size=15)                                                                             , axis.text.x=element_text(size=15)                                                                      )

pdf("der_graphquad.pdf")
x2 <- function(x) {x^2}
ggplot(data.frame(x=c(-3, 3)), aes(x)) + coord_fixed(ratio = 1) + stat_function(fun=x2, color="blue") + theme(                                                                                                              plot.background = element_blank()                                                                                                             )
dev.off()

pdf("exponential_plot.pdf")
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=exp) +theme( axis.text.y=element_text(size=15)                                                                             , axis.text.x=element_text(size=15)                                                                      )
options(scipen=10)
dev.off()

pdf("ex_exp_ln_plot.pdf")
x10 <- function(x) {log(exp(0.4*x))}
ggplot(data.frame(x=c(0, 15)), aes(x)) + stat_function(fun=x10) +theme( axis.text.y=element_text(size=15)                                                                             , axis.text.x=element_text(size=15)                                                                      )
options(scipen=10)
dev.off()

