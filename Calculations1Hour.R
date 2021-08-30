############## Calculations 1 Hour################
temp_1hour_cal<- temp_cme_1Hour[,1:5]
temp_1hour_cal[,"BTCReturn"]<-log(temp_1hour_cal$BTCClose)- log(temp_1hour_cal$BTCOpen)
temp_1hour_cal[,"BTCRVol"]<- (log(temp_1hour_cal$BTCClose)- log(temp_1hour_cal$BTCOpen))^2
temp_1hour_cal[,"BTCAmihud"]<- abs(temp_1hour_cal$BTCReturn)/temp_1hour_cal$BTCVolume
temp_1hour_cal[,"EURReturn"]<-log(temp_1hour_cal$EURClose)- log(temp_1hour_cal$EUROpen)
temp_1hour_cal[,"SPCReturn"]<-log(temp_1hour_cal$SPCClose)- log(temp_1hour_cal$SPCOpen)
temp_1hour_cal[,"NASCReturn"]<-log(temp_1hour_cal$NASCClose)- log(temp_1hour_cal$NASCOpen)
temp_1hour_cal[,"SPCVReturn"]<-log(temp_1hour_cal$SPCVClose)- log(temp_1hour_cal$SPCVOpen)
temp_1hour_cal[,"NASCVReturn"]<-log(temp_1hour_cal$NASCVClose)- log(temp_1hour_cal$NASCVOpen)


temp_1hour_cal[,"BTCVolLag1"]=0
temp_1hour_cal[,"BTCVolLag2"]=0
temp_1hour_cal[,"BTCVolLag3"]=0
temp_1hour_cal[,"BTCRtnLag1"]=0
temp_1hour_cal[,"BTCRtnLag2"]=0
temp_1hour_cal[,"BTCRtnLag3"]=0
temp_1hour_cal[,"BTCRVolLag1"]=0
temp_1hour_cal[,"BTCRVolLag2"]=0
temp_1hour_cal[,"BTCRVolLag3"]=0
temp_1hour_cal[,"BTCAmhLag1"]=0
temp_1hour_cal[,"BTCAmhLag2"]=0
temp_1hour_cal[,"BTCAmhLag3"]=0
temp_1hour_cal[,"EURRtnLag1"]=0
temp_1hour_cal[,"EURRtnLag2"]=0
temp_1hour_cal[,"EURRtnLag3"]=0
temp_1hour_cal[,"SPCRtnLag1"]=0
temp_1hour_cal[,"SPCRtnLag2"]=0
temp_1hour_cal[,"SPCRtnLag3"]=0
temp_1hour_cal[,"NASCRtnLag1"]=0
temp_1hour_cal[,"NASCRtnLag2"]=0
temp_1hour_cal[,"NASCRtnLag3"]=0
temp_1hour_cal[,"SPCVRtnLag1"]=0
temp_1hour_cal[,"SPCVRtnLag2"]=0
temp_1hour_cal[,"SPCVRtnLag3"]=0
temp_1hour_cal[,"NASCVRtnLag1"]=0
temp_1hour_cal[,"NASCVRtnLag2"]=0
temp_1hour_cal[,"NASCVRtnLag3"]=0


for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$SPCVRtnLag1[i+1]<-temp_1hour_cal$SPCVReturn[i]
  
}
for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$SPCVRtnLag2[i+1]<-temp_1hour_cal$SPCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$SPCVRtnLag3[i+1]<-temp_1hour_cal$SPCVRtnLag2[i]
  
}

for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$NASCVRtnLag1[i+1]<-temp_1hour_cal$NASCVReturn[i]
  
}
for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$NASCVRtnLag2[i+1]<-temp_1hour_cal$NASCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_1hour_cal)){
  temp_1hour_cal$NASCVRtnLag3[i+1]<-temp_1hour_cal$NASCVRtnLag2[i]
  
}

temp_1hour_cal<-cbind(temp_1hour_cal,temp_cme_1Hour[,22:25])

