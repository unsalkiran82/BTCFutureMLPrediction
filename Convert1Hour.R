sum_temp=0
j=1
i=1
for (i in 1:17328) {
  if(substr(temp_cme_5min$Timestamp[i],15,16)!="00"){
    sum_temp<-sum_temp+temp_cme_5min$NASCVCount[i]
  }else{
      temp_cme_1Hour$NASCVCount[j]=sum_temp+temp_cme_5min$NASCVCount[i]
      sum_temp=0
      j<-j+1
    }
}

