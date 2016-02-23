rot<-read.csv("rdata.csv", sep=",", header=T)
rot<-rot[,c(-3,-11)]
rot2<-subset(rot,Day==2)
rot3<-subset(rot,Day==3)
refr<-read.csv("BIO311_with_rates.csv",sep=",",header=T)
refr<-refr[,c(-1,-3,-6,-7,-8,-9,-10)]
rot23<-merge(rot2,rot3,by=c("Population","Copper","Replicate"))
rot23<-merge(rot23,refr,by=c("Population","Copper","Replicate"))

rot23$NPj<-NA
rot23$NPa<-NA
rot23$NF<-NA

### DATA BIJMAKEN VOOR 1 casus
rot23$Alive_Adult.x[29]<-1

for(i in 1:length(rot23$Population)){
	j1<-rot23$Alive_Juv.x[i]
	j2<-rot23$Alive_Juv.y[i]
	a1<-rot23$Alive_Adult.x[i]
	a2<-rot23$Alive_Adult.y[i]
	da<-rot23$Dead_Adult.y[i]
	dj<-rot23$Dead_Juv.y[i]
	
	if(j1+a1>=da+a2){
    if((a1-da)>=a2){
      rot23$NPa[i]<-a2/a1
      rot23$NPj[i]<-0
      rot23$NF[i]<-j2/a1
    }else{
      rot23$NPa[i]<-(a1-da)/a1
      rot23$NPj[i]<-(a2-a1+da)/j1
      rot23$NF[i]<-j2/a1  
    }
		
	}else{
	  rot23$NPa[i]<-(a1-da)/a1
	  rot23$NPj[i]<-(j1-dj)/j1
	  rot23$NF[i]<-(j2+a2+da-j1-a1)/a1  
    
	}
	
	if(j1==0){
	  rot23$NPj[i]<-NA
	}
	
}

rot23$check=(abs(rot23$Pj-rot23$NPj)<0.1 & abs(rot23$Pa-rot23$NPa)<0.1 & abs(rot23$F-rot23$NF)<0.1)
rot23[c(6,7,8,11,25,26,31,36,53,57,61),c(1,2,3,4,19,20,21)]