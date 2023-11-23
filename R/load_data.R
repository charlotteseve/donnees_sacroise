load_data <- function(){
  
  df_obsDeb <-read.csv2('data/sacrois/SACROIS_obsDeb_Sars_2018_2022_GSA07.csv')
  
  df_effDeb <-read.csv2('data/sacrois/SACROIS_obsDeb_effort_Sars_2018_2022_GSA07.csv')
  
  df_ANNEE_TEMP <-read.csv2('data/sacrois/ANNEE_TRIM_TEMPS.csv')
  
  ports_long <-read.csv2('data/sacrois/ports_long.csv')
  
  return(c("data/sacrois/SACROIS_obsDeb_Sars_2018_2022_GSA07.csv",
           'data/sacrois/SACROIS_obsDeb_effort_Sars_2018_2022_GSA07.csv',
           'data/sacrois/ANNEE_TRIM_TEMPS.csv',
           'data/sacrois/ports_long.csv'))
  
  
}