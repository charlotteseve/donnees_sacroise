change_encoding <- function(dataframe){
  
  dataframe[,2:13] <- as.data.frame (apply(dataframe[,2:13], 2, function(colonne){
    colonne <- iconv(colonne, from = "UTF-8", to = "LATIN1")
    return(colonne)}) )
  
  
}