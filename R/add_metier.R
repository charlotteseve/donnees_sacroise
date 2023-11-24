add_metier <- function(data_clean){
  
  # Studied metiers
  vect_met <- c("GNC", "GNS", "GTN", "GTR", "LLS", "LN", "OTB", "OTT")
  
  # Creating met from METIER_DCF column, keeping only the 3 first letters
  data_clean$met <- substr(data_clean$METIER_DCF_5_COD, start = 1, stop = 3)
  
  # Joining data_clean with vect_met
  for(i in 1:nrow(data_clean)){
    if(is.na(data_clean$met[i])){
      data_clean$met[i] <- "NA"
    }
    else{}
    }
      
  # renaming met in data_clean
  data_clean$met <- ifelse(data_clean$met %in% vect_met, data$met, "Autre") 
  
}
