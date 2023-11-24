#' Loading SIH Sacrois dataset
#' 
#' @description 
#' This function loads captures (obsDebs) and effort (effDeb) data from
#' SIH > Sacrois datasets. 
#'
#' @param raw_data select the type of data to load. In the data/sacrois/ folder,
#' two datasets are present. One to observe Diplodus sargus captures and effort
#' (sar_med) and one to observe dorate captures and effort (dorade_deb)
#'
#' @return this function returns four dataframes: capture, effort, annee, ports
#' 
#' 
ld_data <- function(raw_data){
  
  #targets::tar_load("raw_data")
  
  # Loading data to study Diplodus spp in the Med sea
  # All further analyses will be done on those data
  if(raw_data == "sar_med"){
    
    df_obsDeb <- read.csv2('data/sacrois/SACROIS_obsDeb_Sars_2018_2022_GSA07.csv') # capture
    df_effDeb <- read.csv2('data/sacrois/SACROIS_obsDeb_effort_Sars_2018_2022_GSA07.csv') # effort
    df_ANNEE_TEMP <- read.csv2('data/sacrois/ANNEE_TRIM_TEMPS.csv') # annee
    ports_long <- read.csv2('data/sacrois/ports_long.csv') # temps
    
    return(list(capture = df_obsDeb, effort = df_effDeb, annee = df_ANNEE_TEMP, ports = ports_long))
    
  } # End sar_med
  
  
  # Loading data to study Dorade spp in the Med sea
  # All further analyses will be done on those data
  if(raw_data=="dorade_med"){
    
    df_obsDeb <-read.csv2('data/sacrois/XXX.csv') # capture
    df_effDeb <-read.csv2('data/sacrois/XXX.csv') # effort
    df_ANNEE_TEMP <-read.csv2('data/sacrois/ANNEE_TRIM_TEMPS.csv') # annee
    ports_long <-read.csv2('data/sacrois/ports_long.csv') # ports
    
    # return data, a list of 4 dataframes
    return(list(capture = ,
                effort =,
                annee =,
                ports =))
    
  } # End Dorade
  
  
}
