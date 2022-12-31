library(here)
library(stats)
library(kableExtra)
library(rlang)
library(ggthemes)
library(tidyverse)
library(janitor)
library(magrittr)
library(glue)
library(lubridate)
library(haven)
library(snakecase)
library(sandwich)
library(scales)
library(lmtest)
library(gganimate)
library(gapminder)
library(stargazer)
library(snakecase)
library(dplyr)
library(ggplot2)

RealGDP<-read_csv("D:/Xia Yu/夏宇的文档/读书/textbook/Econ/Macro/Assignment/GDPC1.csv") 

reg1<-lm(GDPC1~DATE, data=RealGDP)
res<-residuals(reg1)
RealGDP$GDP<-RealGDP$GDPC1
RealGDP$resdev<-residuals(reg1)/RealGDP$GDP
RealGDP$percdev<-percent(RealGDP$resdev)

RealGDP %>% 
  ggplot(aes(DATE, resdev)) +
         geom_line(color="blue")+
         labs(x="Year", y="Percentage Deviation From The Trend",
              title="Percentage Deviations from Trend in Real Consumption and Real GDP")+
  scale_y_continuous(labels = scales::percent)+
  geom_hline(yintercept=0)+
  theme_minimal() +
  scale_fill_economist()

reg2<-filter(RealGDP, DATE>='1955-01-01')%>%
  lm(GDPC1~DATE, data=.)
RealGDP$resdev2<-residuals(reg2)/RealGDP$GDP
RealGDP$percdev2<-percent(RealGDP$resdev2)

RealGDP %>% 
  filter(DATE>='1955-01-01')%>%
  ggplot(aes(DATE, resdev2)) +
  geom_line(color="blue")+
  labs(x="Year", y="Percentage Deviation From The Trend")+
  scale_y_continuous(labels = scales::percent)+
  geom_hline(yintercept=0)+
  theme_minimal() +
  scale_fill_economist()
  
ggsave("D:/Xia Yu/夏宇的文档/读书/textbook/Econ/Macro/Assignment/Percdev.png", width=2338, height=900, units="px")
