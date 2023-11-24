#' Cleaning sacrois dataframe 
#' 
#' @description 
#' This function 
#' - modify the encoding code from UTF-8 to LATIN1
#' - changes the class of variables (temporal variables to integers and 
#'   port variables to factors)
#' - joins dataframe with annee to add TEMP variable
#' For sar_med data, this functions also reorder the levels of factor port
#'
#' @param dataframe the sacrois dataframe loaded
#' @param raw_data this parameters is used to specify particular operations
#' to make according to sar_med and dorade_med.
#' For example, renaming and reordering port is done only for sar_deb
#' @param temps dataframe df_annee_temps
#'
#' @return
#' This function returns a clean dataframe
#' 
#' 
change_capture <- function(dataframe, raw_data, temps){
  
  # Changing encoding
  dataframe[,2:13] <- as.data.frame (apply(dataframe[,2:13], 2, function(colonne){
    colonne <- iconv(colonne, from = "UTF-8", to = "LATIN1")})) 
  
  # Changing temporal variable class to integer
  dataframe$TRIMESTRE <- as.integer(dataframe$TRIMESTRE)
  dataframe$ANNEE <- as.integer(dataframe$ANNEE)
  
  # Changing port variable class to factor 
  dataframe$PORT_EXP_LIB = as.factor(dataframe$PORT_EXP_LIB)
  
  # For sar_med data, reordering port from Ouest to Est
  if(raw_data == "sar_med"){
    # Changind order of levels 
    dataframe$PORT_EXP_LIB <- factor(dataframe$PORT_EXP_LIB, 
                                   levels = c(
                                     "Etang de Bages-Sigean, Peyriac de mer",
                                     "Etang de Salse-Leucate, Port Barcarès",
                                     "Canet-en-Roussillon",
                                     "Saint-Cyprien",
                                     "Port St Ange",
                                     "Etang de Bages-Sigean, Bages",
                                     "Port-la-Nouvelle",
                                     "Port-Leucate",
                                     "Etang de Salse-Leucate,Salse - la Rouquette",
                                     "Grau de Leucate",
                                     "Argelès-sur-Mer, Le Racou",
                                     "Etang de l'Ayrolle",
                                     "Gruissan",
                                     "Port-Vendres",
                                     "Banyuls-sur-Mer",
                                     "Narbonne Plage",
                                     "Hyères, St Pierre sur mer",
                                     "Les Cabanes de Fleury",
                                     "Valras-Plage",
                                     "Grau d'Agde",
                                     "Cap d'Agde",
                                     "Etang de Thau, Marseillan",
                                     "Marseillan-plage",
                                     "Etang de Thau, Pte Courte, Barrou, Zup",
                                     "Etang de Thau, Mèze, le Mourre Blanc",
                                     "Frontignan",
                                     "Etang de Thau, Bouzigues",
                                     "Etang de Thau, Balaruc",
                                     "Sète-Mole et canaux",
                                     "Etangs de Vic, Moures, Arnel, Prévost, P. Blanches",
                                     "Etang d'Ingril, Les Aresquiers",
                                     "Palavas-les-Flots",
                                     "Etang de Mauguio, Cabanes de Pérols,Mauguio",
                                     "Etang de Mauguio, Cabanes de Lunel",
                                     "Carnon-Plage",
                                     "Le-Grau-du-Roi",
                                     "Saintes-Maries-de-la-Mer, Port Cardian",
                                     "Darse de l'Amarrée et port Dromar",
                                     "Cabanes de Beauduc",
                                     "Les Salins de Giraud",
                                     "Port-Saint-Louis-du-Rhône",
                                     "Fos sur Mer, port St Gervais",
                                     "Port-de-Bouc, Anse Aubran",
                                     "Martigues",
                                     "Etang de Berre, Istres -les heures Claires",
                                     "Anse des laurons",
                                     "Carro",
                                     "Etang de Berre, Saint-Chamas",
                                     "Port de Carteau",
                                     "Sausset-les-Pins",
                                     "Etang de Berre, La Mède",
                                     "Etang de Berre, Port de Sagnas",
                                     "Carry-le-Rouet",
                                     "Etang de Berre, Port du Jaï (Marignane)",
                                     "La Redonne, Méjean",
                                     "Etang de Berre, Berre - Port de passet",
                                     "L'Estaque",
                                     "Saumaty",
                                     "Port des Goudes",
                                     "Vallon des Auffes",
                                     "La Madrague de Montredon",
                                     "Vieux Port de Marseille",
                                     "Port de Morgiou",
                                     "Cassis",
                                     "La Ciotat",
                                     "St Cyr sur mer, la Madrague",
                                     "Bandol",
                                     "Le Brusc (Six-Fours-les-Plages)",
                                     "Sanary-sur-Mer",
                                     "Port de la Coudoulière",
                                     "La Seyne-sur-Mer",
                                     "St Elme",
                                     "St Mandrier sur mer",
                                     "Toulon",
                                     "Port St Louis du Mourillon",
                                     "Port des Oursinières",
                                     "Carqueiranne, les salettes",
                                     "Giens, la Madrague",
                                     "Giens, Ports du Niel, de la Tour Fondue",
                                     "Port de l'Ayguade",
                                     "Port de Porquerolles (Ile de)",
                                     "Salins d'Hyères, Pothuau",
                                     "La Londe des Maures, Miramar",
                                     "Port de Bormes les Mimosas, La Favière",
                                     "Le Lavandou",
                                     "Cavalaire sur Mer",
                                     "Les Marines de Cogolin et Port Grimaud",
                                     "Saint-Tropez, vieux port",
                                     "Ste Maxime",
                                     "San Peire, la Garonnette",
                                     "Fréjus",
                                     "Saint-Raphaël, vieux port",
                                     "Drammont, la Poussai",
                                     "Agay",
                                     "La Figueirette",
                                     "Cannes, Nourée Rouge",
                                     "Théoule",
                                     "La Rague",
                                     "Mandelieu-La Napoule",
                                     "La Galère",
                                     "Cannes, vieux port",
                                     "Golfe Juan (Vallauris)",
                                     "Juan les Pins",
                                     "Port de Crouton",
                                     "Port Vauban",
                                     "Antibes, tous les ports",
                                     "Villeneuve Loubet",
                                     "Cros de Cagnes",
                                     "Nice",
                                     "Villefranche-sur-Mer, tous les ports",
                                     "Villefranche, Port de la Santé",
                                     "St Jean Cap Ferrat",
                                     "Baulieu",
                                     "Beaulieu-sur-mer",
                                     "Menton, vieux port, Garavan",
                                     "Sagone"
                                   ))
    
    
    
  } # End sar_med
  
  
  # No treatment for ports with dorade_med data
  if(raw_data == "dorade_med"){
    
  } # End dorade_med
  
  # Joining data with annee (adding TEMP variable)
  dataframe$annee_mois <- paste0(dataframe$ANNEE, "_", dataframe$TRIMESTRE)
  temps$annee_mois <- paste0(temps$ANNEE,"_",temps$TRIMESTRE)
  
  dataframe <- merge(dataframe, temps, by="annee_mois")
  
  return(dataframe)
  
}
