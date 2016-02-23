#code for function to extract matrices from the dataset#
get_matrix<-function(roti,pop,cop){
  if(!pop %in% c(levels(roti$Population),"mean")){
    warning("Something went wrong, give the instructors 
            a cookie and they may help you out:
            \n------------------------\n ",pop,
            " is not a valid entry\n------------------------\n")
    
    return()
  }
  
  if(!cop %in% c(levels(roti$Copper),"mean")){
    warning("Something went wrong, give the instructors 
            a cookie and they may help you out:
            \n------------------------\n ",cop," 
            is not a valid entry\n------------------------\n")
    
    return()
  }
  
  if(pop=="mean" & cop=="mean"){
    i<-1:length(roti$Copper)
  }else if(pop=="mean"){
    i<-which(roti$Copper==cop)
  }else if(cop=="mean"){
    i<-which(roti$Population==pop)
  }else{
    i<-which(roti$Population==pop & roti$Copper==cop)  
  }
  
  A<-matrix(c(0, mean(roti$Pj[i]), 
              mean(roti$F[i]), mean(roti$Pa[i])), nrow=2, ncol=2)
  return(A)
}
#end of the function#