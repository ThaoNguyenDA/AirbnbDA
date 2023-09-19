library(stringr)
##list all file names of data in directory
import_csv <- function(name_dp, file_path){
  name_dp <-read.csv(file_path)
  ##print(paste("import successfully:", name_dp, "; path:",
  ##            file_path))
}
Nameoffile <- list.files(path = "Data/", pattern = ".csv", all.files = TRUE,
                         full.names = TRUE)     

##remove extension of file name to create variable names

Nameofcity_data1 <- Nameoffile %>% str_replace(".csv", "")
Nameofcity_data <- Nameofcity_data1 %>% str_replace("Data/","")

##load data into program
for (i in 1:20){
  do.call("<<-",list(Nameofcity_data[i], read.csv(Nameoffile[i])))
}
