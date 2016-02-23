setwd("C:\\Users\\cornioley_t\\Dropbox\\Psch\\course material pop ecol 2014\\Prac 8")
rot<-read.csv("rdata.csv", sep=",", header=T)

head(rot)
rot1<-rot[order(rot$Population, rot$Copper, rot$Replicate, rot$Day) , ]

head(rot1)
str(rot1)

rot2<- rot1[rot1$Day>1,]
head(rot2)

library(reshape)
rotD1<-subset(rot2, rot2$Day=="2")

rotD2<-subset(rot2, rot2$Day=="3")
rot3<-merge(rotD1, rotD2,by=c("Population","Species", "Copper", "Replicate"))
head(rot3)
attach(rot3)

e<-0.9
d<-seq(0.99,1.01,0.001)
for (c in d){

cat(c,"\t")
Pj2<-(Alive_Adult.y-((Alive_Juv.y*Alive_Adult.x)/(Alive_Juv.x+(c*Alive_Adult.x))))*(1/((c*Alive_Juv.x)+((c^2)*Alive_Adult.x)))
Pj2
PJ<-sqrt(Pj2)
PJ

cat(sum(is.na(PJ)),"\t",sum(PJ>1,na.rm=T),"\t")
PA<-c*PJ
cat(sum(PA>1,na.rm=T),"\t",sum(PA<0,na.rm=T),"\n")
PA
}

c=1
Pj2<-(Alive_Adult.y-((Alive_Juv.y*Alive_Adult.x)/(Alive_Juv.x+(c*Alive_Adult.x))))*(1/((c*Alive_Juv.x)+((c^2)*Alive_Adult.x)))
Pj2
PJ<-sqrt(Pj2)
PJ

PA<-c*PJ

PA

rot3[Pj2<0,]

for(i in 1:length(rot2)){
  rot$Alive_Juv3[i]<-rot$Alive_Juv[rot$Day==3]
}