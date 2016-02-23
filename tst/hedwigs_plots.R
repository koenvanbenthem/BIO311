###################### For the students ##########################
# To always have your Copper data ordered from low to high
# And to always have your populations chronologically ordered
# (Ordered in the plot)
rot<-read.csv("rotifer_data.csv", sep=",", header=T)
RData<-rot
RData$Copper=factor(RData$Copper,levels=c('low','medium','high'),ordered=T)
RData$Population=factor(RData$Population, levels=c('Commercial','Postpollution','Recovery','Pollution'), ordered=T)
RData<-RData[order(RData$Population,RData$Day,RData$Copper),]

# Quickly have some overview over your data in numbers on your console
RData$Total_all<-RData$Alive_Juv + RData$Alive_Adult
aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, mean)

#Perhaps exercise for students to change the order in the data frame?

# These numbers can be a bit overwhelming, so let's inspect them visually
# See the total population size changes over the days
# Because we have three days, we want the three graphs below each other
Tot_mean<-data.frame(aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, mean))

par(mfrow=c(3,1))
temp<-subset(Tot_mean,RData.Copper=='low')
plot(0,0, 
     type="n", xlab="Day",ylab="Total population size",xlim=c(1,3),ylim=c(0,25),axes=FALSE)
axis(side=1,at=c(1,2,3))
lev<-levels(temp[,2])
cols<-rainbow(length(lev))
syms<-1:4
for(i in 1:length(lev)){
  lines(temp$RData.Day[temp$RData.Population==lev[i]],temp$RData.Total_all[temp$RData.Population==lev[i]],col=cols[i],"b",pch=syms[i])
  arrows(c(1,2,3),(temp$RData.Total_all[temp$RData.Population==lev[i]]-c(1,2,12)),c(1,2,3),(temp$RData.Total_all[temp$RData.Population==lev[i]]+c(2,4,2)),code=3,angle=90,col=cols[i],length=0.1)
}

# But now we want to add the standard errors
SE<-function(x)sqrt(var(x)/length(x))
SE(temp$RData.Total_all[(temp$RData.Population=='Commercial' && temp$RData.Day==2)])
Tot_mean<-data.frame(aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, SE))
colnames(Tot_mean)[4]<-"SE"
# A faster way to do this is using lineplot.CI from the package {sciplot}
# Think about what the warning messages mean
library(sciplot)
lineplot.CI(RData$Day[RData$Copper=='low'],RData$Total_all[RData$Copper=='low'],
            group=RData$Population[RData$Copper=='low'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size")
text(1,24, "low copper")
lineplot.CI(RData$Day[RData$Copper=='medium'],RData$Total_all[RData$Copper=='medium'],
            group=RData$Population[RData$Copper=='medium'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size")
text(1,24, "medium copper")
lineplot.CI(RData$Day[RData$Copper=='high'],RData$Total_all[RData$Copper=='high'],
            group=RData$Population[RData$Copper=='high'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size")
text(1,24, "high copper")

#######################################################################################
#######################################################################################

###################### For the students ##########################
# To always have your Copper data ordered from low to high
# And to always have your populations chronologically ordered
RData$Copper=factor(RData$Copper,levels=c('low','medium','high'),ordered=T)
RData$Population=factor(RData$Population, levels=c('Commercial','Postpollution','Recovery','Pollution'), ordered=T)

# Quickly have some overview over your data in numbers on your console
RData$Total_all<-RData$Alive_Juv + RData$Alive_Adult
aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, mean)

#Perhaps exercise for students to change the order in the data frame?

# These numbers can be a bit overwhelming, so let's inspect them visually
# See the total population size changes over the days
# Because we have three days, we want the three graphs below each other
Tot_mean<-data.frame(aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, mean))

# But also want to add the standard errors
# So calculate them first
SE<-function(x)sqrt(var(x)/length(x))
Tot_SE<-data.frame(aggregate(RData$Total_all ~ RData$Day+ RData$Population + RData$Copper, data=RData, SE))
colnames(Tot_SE)[4]<-"SE"
together<-merge(Tot_mean,Tot_SE)

#And now the graphs
par(mfrow=c(3,1))
for(j in levels(together$RData.Copper)){
  temp<-subset(together,together$RData.Copper==j)
  plot(0,0,type="n", xlab="Day",ylab="Total population size",xlim=c(1,3),ylim=c(0,26),axes=FALSE, main=paste(j,"copper treatment"))
  axis(side=1,at=c(1,2,3))
  axis(side=2, at=c(0,5,10,15,20,25,30))
  lev<-levels(temp[,2])
  cols<-rainbow(length(lev))
  syms<-1:4
  
  for(i in 1:length(lev)){
    lines(temp$RData.Day[temp$RData.Population==lev[i]],temp$RData.Total_all[temp$RData.Population==lev[i]],col=cols[i],"b",pch=syms[i])
    arrows(c(1,2,3),(temp$RData.Total_all[temp$RData.Population==lev[i]]-c(temp$SE[temp$RData.Population==lev[i]])),
           c(1,2,3),(temp$RData.Total_all[temp$RData.Population==lev[i]]+c(temp$SE[temp$RData.Population==lev[i]])),code=3,angle=90,col=cols[i],length=0.1)
  }
  legend(1, 24, col=cols,legend=lev, lty=1, pch=syms)
}


temp1<-subset(together,together$RData.Copper=='medium')
plot(0,0, 
     type="n", xlab="Day",ylab="Total population size",xlim=c(1,3),ylim=c(0,26),axes=FALSE, main="Medium copper treatment")
axis(side=1,at=c(1,2,3))
axis(side=2, at=c(0,5,10,15,20,25,30))
lev<-levels(temp[,2])
cols<-rainbow(length(lev))
syms<-1:4
for(i in 1:length(lev)){
  lines(temp1$RData.Day[temp1$RData.Population==lev[i]],temp1$RData.Total_all[temp1$RData.Population==lev[i]],col=cols[i],"b",pch=syms[i])
  arrows(c(1,2,3),(temp1$RData.Total_all[temp1$RData.Population==lev[i]]-c(temp1$SE[temp$RData.Population==lev[i]])),
         c(1,2,3),(temp1$RData.Total_all[temp1$RData.Population==lev[i]]+c(temp1$SE[temp$RData.Population==lev[i]])),code=3,angle=90,col=cols[i],length=0.1)
}
legend(1, 24, col=cols,legend=lev, lty=1, pch=syms)

temp2<-subset(together,together$RData.Copper=='high')
plot(0,0, 
     type="n", xlab="Day",ylab="Total population size",xlim=c(1,3),ylim=c(0,26),axes=FALSE, main="High copper treatment")
axis(side=1,at=c(1,2,3))
axis(side=2, at=c(0,5,10,15,20,25,30))
lev<-levels(temp[,2])
cols<-rainbow(length(lev))
syms<-1:4
for(i in 1:length(lev)){
  lines(temp2$RData.Day[temp2$RData.Population==lev[i]],temp2$RData.Total_all[temp2$RData.Population==lev[i]],col=cols[i],"b",pch=syms[i])
  arrows(c(1,2,3),(temp2$RData.Total_all[temp2$RData.Population==lev[i]]-c(temp2$SE[temp$RData.Population==lev[i]])),
         c(1,2,3),(temp2$RData.Total_all[temp2$RData.Population==lev[i]]+c(temp2$SE[temp$RData.Population==lev[i]])),code=3,angle=90,col=cols[i],length=0.1)
}
legend(1, 24, col=cols,legend=lev, lty=1, pch=syms)


# A faster way to do this is using lineplot.CI from the package {sciplot}
# Think about what the warning messages mean
library(sciplot)
lineplot.CI(RData$Day[RData$Copper=='low'],RData$Total_all[RData$Copper=='low'],
            group=RData$Population[RData$Copper=='low'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size", main="Low copper treatment")
lineplot.CI(RData$Day[RData$Copper=='medium'],RData$Total_all[RData$Copper=='medium'],
            group=RData$Population[RData$Copper=='medium'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size", main="Medium copper treatment")
lineplot.CI(RData$Day[RData$Copper=='high'],RData$Total_all[RData$Copper=='high'],
            group=RData$Population[RData$Copper=='high'],fixed=T, ylim=c(0,26),
            xlab="Day",ylab="Total population size", main="High copper treatment")
