# ------------------------------------------------------------------------------
# name: A2_Long 3.R
# author: Yu Xia
# description: try to plot a graph of LOng question of A2 in R
# last updated: Sep 30, 2022
# ------------------------------------------------------------------------------

library(ggthemes)
library(ggplot2)
ggplot() +
  xlim(0, 10)+
  ylim(-5, 15)+
  geom_function(fun = function(x) 25/x)+
  geom_function(fun = function(x) 10-x, xlim=c(0, 7.5))+
  geom_segment(aes(x = 7.5, y = 0, xend = 7.5, yend = 2.5), linetype="dashed")+
  geom_segment(aes(x = 5, y = 0, xend = 5, yend = 5), linetype="dashed")+
  geom_segment(aes(x = 0, y = 5, xend = 5, yend = 5), linetype="dashed")+
  geom_segment(aes(x = 0, y = 2.5, xend = 7.5, yend = 2.5), linetype="dashed")+
  geom_vline(xintercept = 0)+
  geom_hline(yintercept = 0)+
  geom_function(fun = function(x) sqrt(20)*sqrt(10-x)-5)+
  theme_minimal() +
  scale_fill_economist()
