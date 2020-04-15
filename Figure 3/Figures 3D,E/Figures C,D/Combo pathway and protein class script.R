library(ggplot2)
library(ggpubr)
library(dplyr)
library(readxl)
library(RColorBrewer)

# Both signaling pathways and protein class were made individually. Because these were large, it was difficult for ggarrange to have them together. 

############################################################################################
###########################################################################################

#signaling pathways 

#I took the top 10 from each of the group and combined them together. Some/many are overlapping. 
#Pathway terms were shorted to fit and made consistend as possible with previous figures. The word "pathway was omitted alltoger from all terms. 
#csv files were imported into the environment with the readr function. Pathways, clusters columns with text in them were brought in as character format. Anything else, with stats, ranking, etc, using numeric format. The 3 different analysis were loaded individually. 

#the remaining touch ups were finalised in photoshop. Fold enrichment and Sig score (i.e. pvalues) scale is essentially the same for all groups. With the early group of genes, obtaining FDR values were an issue due to the fewer number of genes. 
#best to export them out all at the same time and adjusing the size of the plots in photoshopso they all look the same. 
#in photoshop i added in the correct significance scales and arranged the fold enrichment for all. 


#library(readxl)
library(readxl)
plotdatasigpath <- read_excel("plotdatasigpath.xlsx", col_types = c("text", 
                                                             "numeric", "numeric", "numeric", "numeric", 
                                                             "text", "text", "numeric", "numeric", 
                                                             "blank", "numeric", "blank"))
View(plotdata)

rm()
rm()

############################################################################################
###### signaling pathways

ggpathways <- ggplot(plotdatasigpath) + 
  geom_point(aes(x = xxLabels, y =reorder(Pathways, Fold_Enrichment_Score), size = Fold_Enrichment_Score, color=Sigscore)) + labs(title="", y="") + scale_color_gradient2(low="blue", mid="grey", high="red") 

ggpathways + theme(legend.position = "left", plot.title=element_text(size=10, 
                                                                     face="bold", 
                                                                     family="Arial",
                                                                     color="black",
                                                                     hjust=0.5,
                                                                     lineheight=1.2),  # title
                   plot.subtitle=element_text(size=15, 
                                              family="Arial",
                                              face="bold",
                                              hjust=0.5),  # subtitle
                   plot.caption=element_text(size=8),  # caption
                   
                   axis.title.x=element_text(vjust=10,  
                                             size=1),  # X axis title
                   axis.title.y=element_text(size=15),  # Y axis title
                   axis.text.x=element_text(size=10, 
                                            angle = 90,
                                            vjust=.5,
                                            face="bold"),  # X axis text
                   axis.text.y=element_text(size=10, face="bold"),
                   panel.background = element_rect(fill = 'white'),
                   panel.grid.major = element_line(colour = "grey", size=.5),
                   panel.grid.minor = element_line(colour = "grey", 
                                                   size=.25, 
                                                   linetype = "dashed"),
                   panel.border = element_blank(),
                   axis.line.x = element_line(colour = "black", 
                                              size=1.5, 
                                              lineend = "butt"),
                   axis.line.y = element_line(colour = "black", 
                                              size=1.5),
                   axis.ticks = element_line(size = 1, colour = "black"),
                   axis.ticks.length = unit(.2, "cm"))   # Y axis text

ggsave("ggpathways.tiff", units="in", width=7.5, height=7.5, dpi=300)
#size for pathways and protein class had to be altered so that the output tiff, plot thickness and text to ticks and spaces between different ticks are the same for both. 


#############################################################################################
#############################################################################################
#############################################################################################
#############################################################################################

############################################################################################
###########################################################################################

#protein class

#I took the top 10 from each of the group and combined them together. Some/many are overlapping as expected. 
# transcription factors converted to "TF" to remain consistent with the text
#csv files were imported into the environment with the readr function. Pathways, clusters columns with text in them were brought in as character format. Anything else, with stats, ranking, etc, using numeric format. The 3 different analysis were loaded individually. 

#the remaining touch ups were finalised in photoshop. Fold enrichment and Sig score (i.e. pvalues) scale is essentially the same for all groups. With the early group of genes, obtaining FDR values were an issue due to the fewer number of genes. 
#best to export them out all at the same time and adjusing the size of the plots in photoshopso they all look the same. 
#in photoshop i added in the correct significance scales and arranged the fold enrichment for all. 

#library(readxl)
library(readxl)
plotdataproclass <- read_excel("plotdataproclass.xlsx", 
                               col_types = c("text", "numeric", "numeric", 
                                             "numeric", "numeric", "text", "text", 
                                             "numeric", "numeric", "blank", "numeric", 
                                             "blank"))
View(plotdataproclass)

rm()
rm()

#############################################################################
###### Protein class

ggproclass <- ggplot(plotdataproclass) + 
  geom_point(aes(x = xxLabels, y =reorder(Protein_Class, Fold_Enrichment_Score), size = Fold_Enrichment_Score, color=Sigscore)) + labs(title="", y="") + scale_color_gradient2(low="blue", mid="grey", high="red") 

ggproclass + theme(legend.position = "left", plot.title=element_text(size=10, 
                                                                     face="bold", 
                                                                     family="Arial",
                                                                     color="black",
                                                                     hjust=0.5,
                                                                     lineheight=1.2),  # title
                   plot.subtitle=element_text(size=15, 
                                              family="Arial",
                                              face="bold",
                                              hjust=0.5),  # subtitle
                   plot.caption=element_text(size=8),  # caption
                   
                   axis.title.x=element_text(vjust=10,  
                                             size=1),  # X axis title
                   axis.title.y=element_text(size=15),  # Y axis title
                   axis.text.x=element_text(size=10, 
                                            angle = 90,
                                            vjust=.5,
                                            face="bold"),  # X axis text
                   axis.text.y=element_text(size=10, face="bold"),
                   panel.background = element_rect(fill = 'white'),
                   panel.grid.major = element_line(colour = "grey", size=.5),
                   panel.grid.minor = element_line(colour = "grey", 
                                                   size=.25, 
                                                   linetype = "dashed"),
                   panel.border = element_blank(),
                   axis.line.x = element_line(colour = "black", 
                                              size=1.5, 
                                              lineend = "butt"),
                   axis.line.y = element_line(colour = "black", 
                                              size=1.5),
                   axis.ticks = element_line(size = 1, colour = "black"),
                   axis.ticks.length = unit(.2, "cm")) # Y axis text

ggsave("ggproclass3.tiff", units="in", width=6.125, height=5.25, dpi=300)
#size for pathways and protein class had to be altered so that the output tiff, plot thickness and text to ticks and spaces between different ticks are the same for both.

#########################################################################################

