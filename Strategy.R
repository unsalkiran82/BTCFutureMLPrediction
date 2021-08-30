####################### CSV tablosunda isim değiştirme###########

colnames(EURUSD60)[1]<- "Date"
colnames(EURUSD60)[2]<- "Open"
colnames(EURUSD60)[3]<- "High"
colnames(EURUSD60)[4]<- "Low"
colnames(EURUSD60)[5]<- "Close"
colnames(EURUSD60)[6]<- "Volume"

############################# Variable Definitions####################
df<- EURUSD60
df_tail<- tail(df,100)



############Plotting Candlestick#################################

library(plotly)
library(quantmod)


fig <- df_tail %>% plot_ly(x = ~Date, type="candlestick",
                      open = ~Open, close = ~Close,
                      high = ~High, low = ~Low) 
fig <- fig %>% layout(title = "Basic Candlestick Chart")

fig

################### Creating Bollinger Band##########

bbands60 <- BBands(df[,c("High","Low","Close")],n=20,sd=2)



fig <- fig %>% add_lines(x = ~Date, y = ~bbands[,"up"] , name = "B Bands",
                         line = list(color = '#ccc', width = 0.5),
                         legendgroup = "Bollinger Bands",
                         hoverinfo = "none", inherit = F) 
fig <- fig %>% add_lines(x = ~Date, y = ~bbands[,"dn"], name = "B Bands",
                         line = list(color = '#ccc', width = 0.5),
                         legendgroup = "Bollinger Bands", inherit = F,
                         showlegend = FALSE, hoverinfo = "none") 
fig <- fig %>% add_lines(x = ~Date, y = ~bbands[,"mavg"], name = "Mv Avg",
                         line = list(color = '#E377C2', width = 0.5),
                         hoverinfo = "none", inherit = F) 
fig <- fig %>% layout(yaxis = list(title = "Price"))

fig

######################MACD calculatin and Add Chart #############
macd60<-MACD(df$Close, nFast = 12, nSlow = 26, nSig = 9, maType = "EMA", percent = FALSE)

###################### RSI Calculation and Add Chart ############

rsi60<-RSI(df$Close,n=14,maType = "EMA")

####################### Data Processing###########################
df_bind <- cbind(df,bbands60)
df_bind <- cbind(df_bind,macd60)
df_bind <- cbind(df_bind,rsi60)

df_data <- df_bind[34:50000,]

#PDirection
df_data[,"PDirection"] = 0

for(i in 1:49966){
  if(df_data$Close[i]>df_data$Close[i+1]){
    df_data$PDirection[i+1]=0
  }else {
    df_data$PDirection[i+1]=1
  }
}

df_data$PDirection <- as.factor(df_data$PDirection) 

#MACD variables
df_data[,"macddif"]= df_data$macd - df_data$signal
df_data[,"macdsig"]=0
df_data$macdsig <- as.numeric(df_data$macdsig) 
for(i in 1:49966){
  if(df_data$macddif[i]>df_data$macddif[i+1]){
    df_data$macdsig[i+1]=0
  }else {
    df_data$macdsig[i+1]=1
  }
}

#MAVG variables

df_data[,"mavgsig"]=0
for(i in 1:49966){
  if(df_data$mavg[i]>df_data$mavg[i+1]){
    df_data$mavgsig[i+1]=0
  }else {
    df_data$mavgsig[i+1]=1
  }
}


#PDirection +1 
PDirectionNext<- df_data$PDirection[2:49967]
df_data[1:49967,"PDirectionNext"]=PDirectionNext
##################### Profit Loss ###################

#MACD signal
profit=0.0000
rate=1.3341
i=0
for(j in 2:50000){
  
  if(df_data$macdsig[j]!= df_data$macdsig[j+1]){
    if(df_data$macdsig[j]==1){
      
      profit=profit + (df_data$Close[j+1]-rate)
      rate=df_data$Close[j+1]
    }
    if(df_data$macdsig[j]==0){
      profit=profit + (rate - df_data$Close[j+1])
      rate=df_data$Close[j+1]
    }
    i=i+1
   }
}

#MAVG Signal

profit=0.0000
rate=1.3341
i=0
for(j in 2:50000){
  
  if(df_data$mavgsig[j]!= df_data$mavgsig[j+1]){
    if(df_data$mavgsig[j]==1){
      
      profit=profit +(df_data$Close[j+1] - rate)
      rate=df_data$Close[j+1]
    }
    if(df_data$mavgsig[j]==0){
      profit=profit + (rate - df_data$Close[j+1])
      rate=df_data$Close[j+1]
    }
    i=i+1
  }
}

######################API ile Json data çekme############333
library(httr)
library(jsonlite)


##res= GET("https://fcsapi.com/api-v3/forex/history?symbol=EUR/USD&period=1h&access_key=L8vFJkmeUx9FPS2731WvD")
##res

##rawToChar(res$content)

##res_text<- content(res,"text")
##res_json<- fromJSON(res_text,flatten = TRUE)
##res_df<- as.data.frame(res_json)




data = fromJSON(rawToChar(res$content),flatten = TRUE)
names(data)
data$result_history

dt<- as.data.frame(data[4][4])

