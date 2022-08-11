#install.packages("ggrepel")
library(ggplot2)
library(ggrepel)
library(tidyr)
library(lubridate)

load("/Users/martiewisenbaugh/Downloads/house_prices.rda")
#A
ggplot(data= house_prices, aes(x=date, y=house_price_index))+geom_line()+
  facet_wrap(~state)+scale_x_continuous(breaks=ymd(c('1980-01-01', '2000-01-01', '2020-01-01')), label=c("'80", "'00", "'20"))

#B
house_reshaped = house_prices%>%gather(measure, value =value, -date, -state, -house_price_perc )

#C
ggplot(data= house_reshaped, aes(x=date, y=value))+geom_line(aes(color=measure))+
  facet_wrap(~state)+scale_x_continuous(breaks=ymd(c('1980-01-01', '2000-01-01', '2020-01-01')), label=c("'80", "'00", "'20"))
#I would say that this is not a good group of graphs to represent the data. Not only is the data, 
#measured differently for the variables, it is also very hard to interpret what the graphs
#are showing, even with zooming in. Most of the graphs also don't show their x-axis ticks
#which could lead to different interpretations of the data depending on what person is looking
#at them. 