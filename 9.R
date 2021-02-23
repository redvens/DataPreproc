data1<- read.csv("data9013.csv", header = TRUE);
data2<- read.csv("data6089.csv", header = TRUE);
data <- merge(data1,data2, by = colnames(data1), all=TRUE);
datapol<-read.csv("datapol.csv", header = TRUE);
data_pol <- merge(data, datapol, by = c('year','country'));
data_pol %>% arrange(year, country);
miss <- c();
for(i in 1:nrow(data_pol)) 
  {
     if(length(which(is.na(data_pol[i,]))) > 0.5*ncol(data_pol)) miss <- append(miss,i) 
  }
 data_pol <- data_pol[-miss,];