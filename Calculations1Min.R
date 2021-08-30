############## Calculations 1 Minute################
temp_min_cal<- temp_data[,1:5]
temp_1min_cal[,"BTCReturn"]<-log(temp_1min_cal$BTCClose)- log(temp_1min_cal$BTCOpen)
temp_1min_cal[,"BTCRVol"]<- (log(temp_1min_cal$BTCClose)- log(temp_1min_cal$BTCOpen))^2
temp_1min_cal[,"BTCAmihud"]<- abs(temp_1min_cal$BTCReturn)/temp_1min_cal$BTCVolume
temp_1min_cal[,"EURReturn"]<-log(temp_1min_cal$EURClose)- log(temp_1min_cal$EUROpen)
temp_1min_cal[,"SPCReturn"]<-log(temp_1min_cal$SPCClose)- log(temp_1min_cal$SPCOpen)
temp_1min_cal[,"NASCReturn"]<-log(temp_1min_cal$NASCClose)- log(temp_1min_cal$NASCOpen)
temp_1min_cal[,"SPVCReturn"]<-log(temp_1min_cal$SPCVClose)- log(temp_1min_cal$SPCVOpen)
temp_1min_cal[,"NASCVReturn"]<-log(temp_1min_cal$NASCVClose)- log(temp_1min_cal$NASCVOpen)


temp_1min_cal[,"BTCVolLag1"]=0
temp_1min_cal[,"BTCVolLag2"]=0
temp_1min_cal[,"BTCVolLag3"]=0
temp_1min_cal[,"BTCRtnLag1"]=0
temp_1min_cal[,"BTCRtnLag2"]=0
temp_1min_cal[,"BTCRtnLag3"]=0
temp_1min_cal[,"BTCRVolLag1"]=0
temp_1min_cal[,"BTCRVolLag2"]=0
temp_1min_cal[,"BTCRVolLag3"]=0
temp_1min_cal[,"BTCAmhLag1"]=0
temp_1min_cal[,"BTCAmhLag2"]=0
temp_1min_cal[,"BTCAmhLag3"]=0
temp_1min_cal[,"EURRtnLag1"]=0
temp_1min_cal[,"EURRtnLag2"]=0
temp_1min_cal[,"EURRtnLag3"]=0
temp_1min_cal[,"SPCRtnLag1"]=0
temp_1min_cal[,"SPCRtnLag2"]=0
temp_1min_cal[,"SPCRtnLag3"]=0
temp_1min_cal[,"NASCRtnLag1"]=0
temp_1min_cal[,"NASCRtnLag2"]=0
temp_1min_cal[,"NASCRtnLag3"]=0
temp_1min_cal[,"SPCVRtnLag1"]=0
temp_1min_cal[,"SPCVRtnLag2"]=0
temp_1min_cal[,"SPCVRtnLag3"]=0
temp_1min_cal[,"NASCVRtnLag1"]=0
temp_1min_cal[,"NASCVRtnLag2"]=0
temp_1min_cal[,"NASCVRtnLag3"]=0


for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$SPCVRtnLag1[i+1]<-temp_1min_cal$SPVCReturn[i]
  
}
for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$SPCVRtnLag2[i+1]<-temp_1min_cal$SPCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$SPCVRtnLag3[i+1]<-temp_1min_cal$SPCVRtnLag2[i]
  
}

for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$NASCVRtnLag1[i+1]<-temp_1min_cal$NASCVReturn[i]
  
}
for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$NASCVRtnLag2[i+1]<-temp_1min_cal$NASCVRtnLag1[i]
  
}

for(i in 1:nrow(temp_1min_cal)){
  temp_1min_cal$NASCVRtnLag3[i+1]<-temp_1min_cal$NASCVRtnLag2[i]
  
}

temp_1min_cal<-cbind(temp_1min_cal,temp_data[,22:25])
