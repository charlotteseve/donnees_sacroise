change_capture <- function(dataframe){
  
  dataframe[,2:13] <- as.data.frame(apply(dataframe[,2:13], 2, function(colonne){
    colonne <- iconv(colonne, from = "UTF-8", to = "LATIN1")
    return(colonne)}
  )
  )
  
  colonne$TRIMESTRE <- as.integer(colonne$TRIMESTRE)
  colonne$ANNEE <- as.integer(colonne$ANNEE)
  
  colonne <- left_join(colonne, df_ANNEE_TEMP)
  
  return(colonne)
  
}
