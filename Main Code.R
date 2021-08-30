library(readr)
cme_csv_cleandata <- read_csv("cme_csv_cleandata.csv")
View(cme_csv_cleandata)
cme_1min_data<- cme_csv_cleandata[,2:26]
savehistory("C:/Users/Casper/Desktop/Dosyalar/Doktora/Research Method 2/article ile ilgili/CME BTC Prediction/History.Rhistory")
View(cme_1min_data)
dim(cme_1min_data)
summary(cme_1min_data)
View(cme_1min_data)
cme_5min_data<-cme_1min_data[FALSE,]
View(cme_5min_data)
substr(cme_1min_data$Timestamp,16,16)=="5"
subset(cme_1min_data,substr(cme_1min_data$Timestamp,16,16)=="0"| substr(cme_1min_data$Timestamp,16,16)=="5")
cme_5min_data<- subset(cme_1min_data,substr(cme_1min_data$Timestamp,16,16)=="0"| substr(cme_1min_data$Timestamp,16,16)=="5")
View(cme_5min_data)
cme_1hour_data<- subset(cme_1min_data,substr(cme_1min_data$Timestamp,15,16)=="00")
View(cme_1hour_data)

paste("0",cme_5min_data$Timestamp[1718])
paste("0",cme_5min_data$Timestamp[1718],sep = "")
cme_5min_data$Timestamp[1718]<- paste("0",cme_5min_data$Timestamp[1718],sep = "")

temp_data<-temp_1min_data[,2:26]
for (a in 1:nrow(temp_data)) {
if(substr(temp_data$Timestamp[a],2,2)=="."){
temp_data$Timestamp[a]<- paste("0",temp_data$Timestamp[a],sep="")
}
}

cme_5min_data<-subset(temp_data,(substr(temp_data$Timestamp,2,2)!= "."&(substr(temp_data$Timestamp,16,16)=="0"| substr(temp_data$Timestamp,16,16)=="5"))| (substr(temp_data$Timestamp,2,2)== "."&(substr(temp_data$Timestamp,15,15)=="0"| substr(temp_data$Timestamp,15,15)=="5")))
View(cme_5min_data)
rm(cme_5min_data)
cme_5min_data<-subset(temp_data,substr(temp_data$Timestamp,16,16)=="0"| substr(temp_data$Timestamp,16,16)=="5")

temp_new_data<-temp_data[-c(52002,52003,53369,53370,54736,54737,57468,57469,58835,58836,60202,60203,61569,61570,61571,67031,84326),]

NA_Time<-temp_data[substr(temp_data$Timestamp,12,16)=="00:01",]


temp_part1<-temp_data[1:62949,]
temp_part2<-temp_data[62950:86635,]
temp_part1[62950,]<- temp_data[62949,]
temp_new_data<- rbind(temp_part1,temp_part2)


temp_1min_data <- read_csv("temp_1min_data.csv")
View(temp_1min_data)
rm(temp_data)
temp_data<-temp_1min_data[,2:26]
View(temp_data)

cme_5min_data<-subset(temp_data,substr(temp_data$Timestamp,16,16)=="0"| substr(temp_data$Timestamp,16,16)=="5")
View(cme_5min_data)
i=2
j=2
k=6
for (i in seq(2,86636,by=5)) {
cme_5min_data$BTCVolume[j]<-sum(temp_data$BTCVolume[i:k])
k = k + 5
j= j + 1
}
write.csv(cme_5min_data,"temp_5min_data.csv")
