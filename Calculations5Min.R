############## Calculations 5 Minute################
temp_5min_cal<- temp_cme_5min[,1:5]
temp_5min_cal[,"BTCReturn"]<-log(temp_5min_cal$BTCClose)- log(temp_5min_cal$BTCOpen)
temp_5min_cal[,"BTCRVol"]<- (log(temp_5min_cal$BTCClose)- log(temp_5min_cal$BTCOpen))^2
temp_5min_cal[,"BTCAmihud"]<- abs(temp_5min_cal$BTCReturn)/temp_5min_cal$BTCVolume
temp_5min_cal[,"EURReturn"]<-log(temp_5min_cal$EURClose)- log(temp_5min_cal$EUROpen)
temp_5min_cal[,"SPCReturn"]<-log(temp_5min_cal$SPCClose)- log(temp_5min_cal$SPCOpen)
temp_5min_cal[,"NASCReturn"]<-log(temp_5min_cal$NASCClose)- log(temp_5min_cal$NASCOpen)
temp_5min_cal[,"SPCVReturn"]<-log(temp_5min_cal$SPCVClose)- log(temp_5min_cal$SPCVOpen)
temp_5min_cal[,"NASCVReturn"]<-log(temp_5min_cal$NASCVClose)- log(temp_5min_cal$NASCVOpen)


temp_5min_cal[,"BTCVolLag1"]=0
temp_5min_cal[,"BTCVolLag2"]=0
temp_5min_cal[,"BTCVolLag3"]=0
temp_5min_cal[,"BTCRtnLag1"]=0
temp_5min_cal[,"BTCRtnLag2"]=0
temp_5min_cal[,"BTCRtnLag3"]=0
temp_5min_cal[,"BTCRVolLag1"]=0
temp_5min_cal[,"BTCRVolLag2"]=0
temp_5min_cal[,"BTCRVolLag3"]=0
temp_5min_cal[,"BTCAmhLag1"]=0
temp_5min_cal[,"BTCAmhLag2"]=0
temp_5min_cal[,"BTCAmhLag3"]=0
temp_5min_cal[,"EURRtnLag1"]=0
temp_5min_cal[,"EURRtnLag2"]=0
temp_5min_cal[,"EURRtnLag3"]=0
temp_5min_cal[,"SPCRtnLag1"]=0
temp_5min_cal[,"SPCRtnLag2"]=0
temp_5min_cal[,"SPCRtnLag3"]=0
temp_5min_cal[,"NASCRtnLag1"]=0
temp_5min_cal[,"NASCRtnLag2"]=0
temp_5min_cal[,"NASCRtnLag3"]=0
temp_5min_cal[,"SPCVRtnLag1"]=0
temp_5min_cal[,"SPCVRtnLag2"]=0
temp_5min_cal[,"SPCVRtnLag3"]=0
temp_5min_cal[,"NASCVRtnLag1"]=0
temp_5min_cal[,"NASCVRtnLag2"]=0
temp_5min_cal[,"NASCVRtnLag3"]=0


for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$SPCVRtnLag1[i+1]<-temp_5min_cal$SPCVReturn[i]
  
}
for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$SPCVRtnLag2[i+1]<-temp_5min_cal$SPCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$SPCVRtnLag3[i+1]<-temp_5min_cal$SPCVRtnLag2[i]
  
}

for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$NASCVRtnLag1[i+1]<-temp_5min_cal$NASCVReturn[i]
  
}
for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$NASCVRtnLag2[i+1]<-temp_5min_cal$NASCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_5min_cal)){
  temp_5min_cal$NASCVRtnLag3[i+1]<-temp_5min_cal$NASCVRtnLag2[i]
  
}

temp_5min_cal<-cbind(temp_5min_cal,temp_cme_5min[,22:25])

