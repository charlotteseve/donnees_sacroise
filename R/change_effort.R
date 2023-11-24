#' Cleaning dataframe
#' 
#' @description This function
#' This function 
#' - modify the encoding code from UTF-8 to LATIN1
#' - changes the class of variables (temporal variables to integers and 
#'   port variables to factors)
#' - joins dataframe with annee to add TEMP variable
#'
#' @param dataframe the dataframe to clean (effort)
#'
#' @return 
#' 
#' 
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
