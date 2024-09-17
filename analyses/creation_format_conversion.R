# création du match entre format embarquement et format sacrois ----
#
#  création dossier sherpa pour les données brutes SHERPA
# dir.create("data/sherpa")
#
# Load des fichiers nécessaires ----
#
df_obsDeb <-read.csv2('data/sacrois/SACROIS_obsDeb_Sars_2018_2022_GSA07.csv',encoding="UTF-8")
df_effDeb <-read.csv2('data/sacrois/SACROIS_obsDeb_effort_Sars_2018_2022_GSA07.csv',encoding="UTF-8")

# données SIH
#df_sihcaptpmcb <- read.csv2("data/sherpa/1-Donnees captures anonymisees.csv")

# données embarquement
df_obsEmb <- read.csv2("data/sherpa/EMBQ_Donnees_PNPC.csv")
# fichier converti en utf8 puis réenregistré ds notepad en format utf-8

header_sherpa <- names(df_obsEmb)
headereffDeb <- names(df_obsDeb)
#
# Création des champs ----
# suppression des colonnes non utilisées dans les données Embarquements
df_obsEmb=df_obsEmb[c("Date","Type.engin","Cible.pêche","Métier",
                      "Espèce","Biomasse.rejets","Année")]

# Header pour établir la correspondance des fichiers
header_obsEmb <- names(df_obsEmb)
header_effDeb <-names(df_effDeb)
#corresp <- data.frame(header_captpmcb)
#corresp$sih_field <- rep(0, dim(corresp)[[1]])
#
# Définition du code métier en trois lettres -----
# requiert fichier de référence pour passer en fonction
# requiert rajouter un match entre libellé métier et code métier
code_met <- data.frame(metlib = unique(df_obsEmb$Métier))
code = c("GTR","GTR","GNS","LLS","LLS","GTR","GTR","GNS","GTR","GTR","GTR","LHP","LLS","GTR","GNS","GNS","GTR","GTR","GTR","GNS","GTR","GTR","LHP","GTR")
code_met$code <- code
#
# Sélection espèces de type "Dorades" ----
# requiert fichier de référence des codes FAO pour passer en fonction
# requiert rajouter un match entre libellé espèce et code espèce
liste_dorades =c("Sparus aurata","Pagellus acarne","Pagellus bogaraveo","Pagrus pagrus","Pagellus erythrinus")
df_obsEmb=df_obsEmb[df_obsEmb$`Espèce` %in% liste_dorades,]
# corresp code FAO (fait main)
code_esp = data.frame(esp=liste_dorades,code = c("SBG","SBA","TBN","PAG","PAX"))
# rajout code métier
df_obsEmb$MET <- code_met$code[match(df_obsEmb$Métier,code_met$metlib)]
df_obsEmb$ANNEE <- df_obsEmb$Année
df_obsEmb$ESP_LIB_FAO <- rep('Dorades',nrow(df_obsEmb))
#
# Création du fichier ANNEE_TEMPS ds dossier data/sherpa
create_annee_temps_sherpa("data/sherpa/EMBQ_Donnees_PNPC.csv")
#
df_obsEmb_sacrois <- data.frame()
names(df_obsEmb_sacrois) = names(df_obsDeb)
# créer le fichier sacrois-like obsDeb
write.csv2(df, SHERPA_obsDeb_Dorades_2015_2023.csv,row.names=F)