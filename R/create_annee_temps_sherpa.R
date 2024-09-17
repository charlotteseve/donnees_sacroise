#' Title  Création du fichier ANNEE_TEMPS
#'
#' @param filename 
#'
#' @return
#' @export
#'
#' @examples
create_annee_temps_sherpa <- function(filename){
  df_obsEmb <-read.csv2(filename,encoding="UTF-8")
  Date_Emb <- unique(df_obsEmb$Date)
  df_ANNEE_TEMP <-data.frame(ANNEE=substring(Date_Emb,1,4),
                             TRIMESTRE=as.numeric(substring(Date_Emb,6,7)) %/% 3)
  # enlever les lignes en double
  ANNEE_TEMP <- unique(df_ANNEE_TEMP)
  df_ANNEE_TEMP <- ANNEE_TEMP: rm(ANNEE_TEMP)
  # ordonner année et mois
  toto <- df_ANNEE_TEMP[order(df_ANNEE_TEMP$ANNEE,df_ANNEE_TEMP$TRIMESTRE),]
  df_ANNEE_TEMP <- toto
  df_ANNEE_TEMP$TEMPS <- seq(1:length(df_ANNEE_TEMP$ANNEE))
  write.csv2(df_ANNEE_TEMP,"data/sherpa/ANNEE_TRIM_TEMPS.csv",row.names=F)

  invisible(NULL)  
}
