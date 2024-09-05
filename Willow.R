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
  mutate_at(c('plot'), as.factor) %>%
  mutate_at(c('shoots'), as.numeric)

willow <- filter(willow[-c(37:177),]) #remove empty rows

