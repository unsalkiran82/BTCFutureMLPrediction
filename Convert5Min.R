#########BTC#######
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
    cme_5min_data$BTCVolume[j]<-sum(temp_data$BTCVolume[i:k])
    k = k + 5
    j= j + 1 
   }

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$BTCCount[j]<-sum(temp_data$BTCCount[i:k])
  k = k + 5
  j= j + 1 
}
#####################EUR###############
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$EURVolume[j]<-sum(temp_data$EURVolume[i:k])
  k = k + 5
  j= j + 1 
}

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$EURCount[j]<-sum(temp_data$EURCount[i:k])
  k = k + 5
  j= j + 1 
}
################### SPC & NASC ##############
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$SPCVolume[j]<-sum(temp_data$SPCVolume[i:k])
  k = k + 5
  j= j + 1 
}

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$SPCCount[j]<-sum(temp_data$SPCCount[i:k])
  k = k + 5
  j= j + 1 
}
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$NASCVolume[j]<-sum(temp_data$NASCVolume[i:k])
  k = k + 5
  j= j + 1 
}

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$NASCCount[j]<-sum(temp_data$NASCCount[i:k])
  k = k + 5
  j= j + 1 
}

###############SPCV & NASCV ############
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$SPCVVolume[j]<-sum(temp_data$SPCVVolume[i:k])
  k = k + 5
  j= j + 1 
}

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$SPCVCount[j]<-sum(temp_data$SPCVCount[i:k])
  k = k + 5
  j= j + 1 
}
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$NASCVVolume[j]<-sum(temp_data$NASCVVolume[i:k])
  k = k + 5
  j= j + 1 
}

i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
  temp_cme_5min$NASCVCount[j]<-sum(temp_data$NASCVCount[i:k])
  k = k + 5
  j= j + 1 
}