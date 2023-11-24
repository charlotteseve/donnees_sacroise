graph <- function(data_clean_metier){
  
  # Ajout d'undata_clean_metier
  data_clean_metier <-  group_by(TEMPS, ESP_LIB_FAO) %>% 
    summarize(Deb_tonnes = sum(CAPTURES_KG)/1000)
  
  ## Create plot
  ggplot(df_debs_TRIM ,
         aes(x = TEMPS, y= Deb_tonnes)) +
    geom_line(aes(colour=ESP_LIB_FAO))+
    geom_point(aes(colour=ESP_LIB_FAO))+
    #facet_wrap(~MET) +
    ## Labelling
    labs(title="Debarquements par trimestre, taxons", 
         #subtitle="\nTest : Réseau connecté vs. Réseau non-connecté\n",
         y="Debarquements (tonnes)\n", 
         x="Trimestre")+
    theme(axis.text.x = element_text(angle = 45, vjust = 1, hjust=0.99))
  
  
  
}
