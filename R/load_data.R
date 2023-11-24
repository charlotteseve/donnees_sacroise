ld_data <- function(raw_data){
  
  
  #targets::tar_load("raw_data")
  
  if(raw_data == "sar_med"){
    
    df_obsDeb <- read.csv2('data/sacrois/SACROIS_obsDeb_Sars_2018_2022_GSA07.csv')
    
    df_effDeb <- read.csv2('data/sacrois/SACROIS_obsDeb_effort_Sars_2018_2022_GSA07.csv')
    
    df_ANNEE_TEMP <- read.csv2('data/sacrois/ANNEE_TRIM_TEMPS.csv')
    
    ports_long <- read.csv2('data/sacrois/ports_long.csv')
    
    return(list(capture = df_obsDeb, effort = df_effDeb, annee_trim = df_ANNEE_TEMP, ports = ports_long))
    
  } # End sar_med
  
  
  if(raw_data=="dorade_med"){
    
    df_obsDeb <-read.csv2('data/sacrois/XXX.csv')
    
    df_effDeb <-read.csv2('data/sacrois/XXX.csv')
    
    df_ANNEE_TEMP <-read.csv2('data/sacrois/ANNEE_TRIM_TEMPS.csv')
    
    ports_long <-read.csv2('data/sacrois/ports_long.csv')
    
    return(list(capture = ,
                effort =,
                annee_trim =,
                ports =))
    
  } # End Dorade
  
  
}
