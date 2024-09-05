#------------------------------------------------------------------------------
# BI1339 - Willow
# Lovisa Hansson
# 2024-09-05
#---- Set up ------------------------------------------------------------------

setwd("~/R/BI1339/BI1339")

install.packages('tidyverse')
install.packages('ggpubr')
install.packages('patchwork')
install.packages('cowplot')
install.packages('viridis')
install.packages('usethis')
install.packages('gitcreds')
#install.packages('PerformaceAnalytics')
#install.packages('lme4')

library('tidyverse')
library('ggpubr')
library('patchwork')
library('cowplot')
library('viridis')
library('usethis')
library('gitcreds')
#library('PerformanceAnalytics')
#library('lme4')

#------------------------------------------------------------------------------

willow <- read.csv("salix_20240903.csv", header=T, sep=",") %>%
  mutate_at(c('plot', 'sample'), as.factor)

willow <- subset(willow, select=c(plot, plant_id, sample, diameter))
willow_04 <- subset(willow, willow$plot=="4")
willow_27 <- subset(willow, willow$plot=="27")
willow_33 <- subset(willow, willow$plot=="33")

#-----------------------------------------------------------------------------

ggqqplot(willow_04$diameter)
hist(willow_04$diameter)
shapiro.test(willow_04$diameter)

ggqqplot(willow_27$diameter)
hist(willow_27$diameter)
shapiro.test(willow_27$diameter)

ggqqplot(willow_33$diameter)
hist(willow_33$diameter)
shapiro.test(willow_33$diameter)

#-----------------------------------------------------------------------------

#Grouped boxplot
ggplot(willow, aes(x=plant_id, y=diameter, fill=plot)) + 
  geom_boxplot() +
  facet_wrap(~plot, scale="free") +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=6))

#Standard boxplot
ggplot(data=willow, aes(x=plot, y=diameter)) + 
  geom_boxplot() +
  geom_point(aes(color=plot), size=2, alpha=0.6) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=10))

#One boxplot per plot
ggplot(data=willow_04, aes(x=plant_id, y=diameter)) + 
  geom_boxplot() +
  geom_point(size=2, alpha=0.6) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=10))

ggplot(data=willow_27, aes(x=plant_id, y=diameter)) + 
  geom_boxplot() +
  geom_point(size=2, alpha=0.6) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=10))

ggplot(data=willow_33, aes(x=plant_id, y=diameter)) + 
  geom_boxplot() +
  geom_point(size=2, alpha=0.6) +
  theme_bw() +
  theme(axis.text.x=element_text(angle=45, hjust=1, size=10))


