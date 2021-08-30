####################1 min ###################

df_data1m<- temp_1min_cal[,c("BTCOpen","BTCClose","BTCDirection")]
df_data1m_test<- df_data1m[65001:86636,]
df_data1m_test[,"Prediction"]<-boost.pred1m


profit=0.0000
rate=59365
i=0
for(j in 1:14980){
  
  if(df_data1m_test$Prediction[j]!= df_data1m_test$Prediction[j+1]){
    if(df_data1m_test$Prediction[j]=="1"){
      profit=profit + (df_data1m_test$BTCClose[j]-rate)
      rate=df_data1m_test$BTCOpen[j+1]
    }
    if(df_data1m_test$Prediction[j]=="0"){
      profit=profit + (rate - df_data1m_test$BTCClose[j])
      rate=df_data1m_test$BTCOpen[j+1]
    }
    i=i+1
  }
}

###############5 Mİn #############

df_data5m<- temp_5min_cal[,c("BTCOpen","BTCClose","BTCDirection")]
df_data5m_test<- df_data5m[13001:17328,]
df_data5m_test[,"Prediction"]<-bag.probs5m

profit=0.0000
rate=59430
i=0
for(j in 1:2878){
  
  if(df_data5m_test$Prediction[j]!= df_data5m_test$Prediction[j+1]){
    if(df_data5m_test$Prediction[j]=="Up"){
      profit=profit + (df_data5m_test$BTCClose[j]-rate)
      rate=df_data5m_test$BTCOpen[j+1]
    }
    if(df_data5m_test$Prediction[j]=="Down"){
      profit=profit + (rate - df_data5m_test$BTCClose[j])
      rate=df_data5m_test$BTCOpen[j+1]
    }
    i=i+1
  }
}

################1 Hour #######################

df_data1h<- temp_1hour_cal[,c("BTCOpen","BTCClose","BTCDirection")]
df_data1h_test<- df_data1h[1101:1460,]
df_data1h_test[,"Prediction"]<-bag.probs1h

profit=0.0000
rate=59500
i=0
for(j in 1:274){
  
  if(df_data1h_test$Prediction[j]!= df_data1h_test$Prediction[j+1]){
    if(df_data1h_test$Prediction[j]=="Up"){
      profit=profit + (df_data1h_test$BTCClose[j]-rate)
      rate=df_data1h_test$BTCOpen[j+1]
    }
    if(df_data1h_test$Prediction[j]=="Down"){
      profit=profit + (rate - df_data1h_test$BTCClose[j])
      rate=df_data1h_test$BTCOpen[j+1]
    }
    i=i+1
  }
}