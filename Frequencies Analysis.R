####Libraries####
library(easypackages)
libs<-c("ggplot2", "tidyverse", "car", "haven", "readr", "dplyr", "naniar", "tm")
libraries(libs)
####Load in the Data####
dat.orig <- read_sav("~/Desktop/R Programs/Research--Diana/Amerispeak/Wave 4/s7991_UPenn_LongPollW4_FINAL_WEIGHTED_client_7.11.2019.sav")
dat<-dat.orig
####Cleaning####
#Set up values for NA
na.values.2<-c(77, 98, 99)
na.values.3<- c(777, 998, 999)
#Get indices for Therms
therms<-grep("THERM", colnames(dat), fixed=T)
#vector of columns with 2-digit NAs
clean.length2<-colnames(dat[c(-1,-therms)])
#vector of columns with 3-digit NAs
clean.length3<- colnames(dat[therms])
#Remove NAs
dat<- dat %>%
  replace_with_na_at(.vars=clean.length2, condition = ~.x %in% na.values.2)
dat <-dat %>%
  replace_with_na_at(.vars=clean.length3, condition = ~.x %in% na.values.3)
####Media use frequencies####
####Media use frequencies####
string5<-" From which of the following sources have you heard anything about politics?"
for(x in 1:7){
  txt.1<-paste("col.orig<-dat.orig$ME1_", x, "_W4", sep="")
  eval(parse(text=txt.1))
  name<-removePunctuation(str_remove(attributes(col.orig)$label, string5))
  print(name)
  txt.2<-paste("Responses<-dat$ME1_", x, "_W4", sep="")
  eval(parse(text=txt.2))
  print(table(Responses))
  Percentages<-Responses
  print(prop.table(table(Percentages)))
}
#TV 1 Frequencies
string1<- " Which of the following programs do you watch regularly on television or online?"
for(x in 1:22){
  txt.1<-paste("col.orig<-dat.orig$ME2A_", x, "_W4", sep="")
  eval(parse(text=txt.1))
  name<-removePunctuation(str_remove(attributes(col.orig)$label, string1))
  print(name)
  txt.2<-paste("Responses<-dat$ME2A_", x, "_W4", sep="")
  eval(parse(text=txt.2))
  print(table(Responses))
  Percentages<-Responses
  print(prop.table(table(Percentages)))
}
#TV 2 Frequencies
string2<- " Below are some additional television programs. Which of these do you watch regularly on television or online?"
for(x in 1:21){
  txt.1<-paste("col.orig<-dat.orig$ME2B_", x, "_W4", sep="")
  eval(parse(text=txt.1))
  name<-removePunctuation(str_remove(attributes(col.orig)$label, string2))
  print(name)
  txt.2<-paste("Responses<-dat$ME2B_", x, "_W4", sep="")
  eval(parse(text=txt.2))
  print(table(Responses))
  Percentages<-Responses
  print(prop.table(table(Percentages)))
}
#Newspaper frequencies
string3<-" What online or print newspapers do you read regularly?"
for(x in 1:17){
  txt.1<-paste("col.orig<-dat.orig$ME3_", x, "_W4", sep="")
  eval(parse(text=txt.1))
  name<-removePunctuation(str_remove(attributes(col.orig)$label, string3))
  print(name)
  txt.2<-paste("Responses<-dat$ME3_", x, "_W4", sep="")
  eval(parse(text=txt.2))
  print(table(Responses))
  Percentages<-Responses
  print(prop.table(table(Percentages)))
}
#Internet News
string4<-" Which of these internet news sites or blogs do you visit regularly, that is, at least once a month?"
for(x in 1:26){
  txt.1<-paste("col.orig<-dat.orig$M5B_", x, "_W4", sep="")
  eval(parse(text=txt.1))
  name<-removePunctuation(str_remove(attributes(col.orig)$label, string4))
  print(name)
  txt.2<-paste("Responses<-dat$M5B_", x, "_W4", sep="")
  eval(parse(text=txt.2))
  print(table(Responses))
  Percentages<-Responses
  print(prop.table(table(Percentages)))
}





