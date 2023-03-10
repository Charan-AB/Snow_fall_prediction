library(viridis)
library(arules)
library(TSP)
library(data.table)
library(dplyr)
library(devtools)
library(purrr)
library(tidyr)
library(arulesViz)

## YOUR working dir goes here...
setwd("/Users/charan/Documents")

conditions <- read.transactions("transactions.csv",
                           rm.duplicates = FALSE, 
                           format = "basket",  ##if you use "single" also use cols=c(1,2)
                           sep=",",  ## csv file
                           cols=NULL) ## The dataset has no row numbers
inspect(conditions)

rules <- arules::apriori(conditions, parameter = list(support = 0.25, confidence = 0.2, minlen = 2))
inspect(rules)

SortRules_Conf <- sort(rules, by = 'confidence', decreasing = TRUE)
inspect(SortRules_Conf[1:15])

SortRules_Lift <- sort(rules, by = 'lift', decreasing = TRUE)
inspect(SortRules_Lift[1:15])

SortRules_Sup <- sort(rules, by = 'support', decreasing = TRUE)
inspect(SortRules_Sup[1:15])

library(arulesViz)
plot(SortRules_Conf, method="graph", engine="htmlwidget", limit = 15)

plot(SortRules_Lift, method="graph", engine="htmlwidget", limit = 15)

plot(SortRules_Sup, method="graph", engine="htmlwidget", limit = 15)
