graph <- function(data_clean_metier){
  
  library(tidyverse)
  
  
  chacha_theme <- function() {
    theme_bw() %+replace% # Changer un aspect du theme_bw
      theme(
        #Legend
        legend.position="bottom", legend.box = "vertical",
      )
  }
  
  
  # Ajout d'undata_clean_metier
  df_plot <- data_clean_metier %>% group_by(TEMPS, ESP_LIB_FAO) %>% 
    summarize(Deb_tonnes = sum(as.numeric(CAPTURES_KG))/1000)
  
  ## Create plot
  ggplot(df_plot,
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
