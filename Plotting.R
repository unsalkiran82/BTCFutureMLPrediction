a <- list(text = "Bitcoin Future Price",
          x = '2021-04-14',
          y = 1.02,
          xref = 'x',
          yref = 'paper',
          xanchor = 'left',
          showarrow = FALSE
)

l <- list(type = line,
          x0 = '2021-04-14',
          x1 = '2021-04-14',
          y0 = 0,
          y1 = 1,
          xref = 'x',
          yref = 'paper',
          line = list(color = 'black',
                      width = 0.5)
)

df<- temp_1hour_cal

fig <- df %>% plot_ly(x = ~df$Timestamp, type="candlestick",
                      open = ~df$BTCOpen, close = ~df$BTCClose,
                      high = ~AAPL.High, low = ~AAPL.Low) 
fig <- fig %>% layout(title = "Apple Stock",
                      annotations = a,
                      shapes = l)
