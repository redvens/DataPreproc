data1<- read.csv("data9013.csv", header = TRUE); #nuskaitomi failai
data2<- read.csv("data6089.csv", header = TRUE; 
data <- merge(data1,data2, by = colnames(data1), all=TRUE); #turimi failai, kurių kintamieji vienodi, sudedami į vieną
datapol<-read.csv("datapol.csv", header = TRUE);#nuskaitomas failas datapol.csv
data_pol <- merge(data, datapol, by = c('year','country')); #data ir datapol sujungiami pagal metus ir šalį
data_pol %>% arrange(year, country); #sujungti duomenys surūšiuojami pagal metus ir šalį
#Šalinami stebiniai su  50 procentų ir daugiau tuščių reikšmių:
miss <- c(); 
for(i in 1:nrow(data_pol)) 
  {
     if(length(which(is.na(data_pol[i,]))) > 0.5*ncol(data_pol)) miss <- append(miss,i) 
  }
 data_pol <- data_pol[-miss,];
