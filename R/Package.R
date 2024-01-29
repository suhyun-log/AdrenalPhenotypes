list.of.packages <- c("SqlRender", "DatabaseConnector", "ParallelLogger", "stringr", "SqlRender", "DatabaseConnector", "dplyr", "MatchIt", "moonBook", "survminer", "survival")
new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
if(length(new.packages)) install.packages(new.packages)
library(SqlRender)
library(DatabaseConnector)
library(ParallelLogger)
library(stringr)
library(SqlRender)
library(dplyr)
library(MatchIt)
library(moonBook)
library(survminer)
library(survival)

