install.packages("survminer")

library(ggplot2)
library(ggpubr)
library(dplyr)
library(readxl)
library(RColorBrewer)
library(cowplot)
library("survminer")
rm(plotdatasep, gg, ggOL)

#####################################################################################
#STARTING POINT#####################################################################################
#plotdatasep for OL or neuro was loaded into reads. Both made separately and exported as files separately. 


#####################################################################################
#####################################################################################

#import data into environment using readr function and specify columns as follows:
#Pathways (character);	Cluster (character);	Cluster_Sec (skip);	Cluster_Ter(skip);	Lineage (character);	Stage (numeric);	Fold_Enrichment (numeric);	pvalue(numeric);	FDR(numeric);
#this is done for both files that contain the same information for neuro and OL subcells. However, for OL, all data related to neuro type was blanked so it comes up as NA...can be deleted out in photoshop. Same done vice versa for neuro subcells. 



# for OLs
ggOL <- ggplot(plotdatasepOL) + 
  geom_point(aes(x = reorder(Cluster,Stage), y =factor(Pathways,levels = rev(levels(factor(Pathways)))), size = Fold_Enrichment, color=pvalue)) + scale_colour_gradient(low="red2", high="lightpink") +
  labs(title="Pathways Enriched in Subpopulations", y="Signaling Pathways Active") 
# for OLs theme
ggOL + theme(legend.position = "bottom", legend.box = "vertical", plot.title=element_text(size=8, 
                                                                                          face="bold", 
                                                                                          family="Arial",
                                                                                          color="black",
                                                                                          hjust=0.5,
                                                                                          lineheight=1.2),  # title
             legend.text = element_text(colour="black", size = 8, face = "bold"),
             legend.title = element_text(colour="black", size=8, face="bold"),
             plot.subtitle=element_text(size=15, 
                                        family="Arial",
                                        face="bold",
                                        hjust=0.5),  # subtitle
             plot.caption=element_text(size=6),  # caption
             
             axis.title.x=element_text(vjust=10,  
                                       size=1),  # X axis title
             axis.title.y=element_text(size=15),  # Y axis title
             axis.text.x=element_text(size=10, 
                                      angle = 90,
                                      vjust=.5),  # X axis text
             axis.text.y=element_text(size=10, hjust = 0.5, face = "bold"),
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

# for neuros
ggNE <- ggplot(plotdatasepNeuro) + 
  geom_point(aes(x = reorder(Cluster,Stage), y =factor(Pathways,levels = rev(levels(factor(Pathways)))), size = Fold_Enrichment, color=pvalue)) + scale_colour_gradient(low="blue", high="lightblue") +
  labs(title="Pathways Enriched in Subpopulations", y="Signaling Pathways Active") 
#for neuro theme
ggNE + theme(legend.position = "bottom", legend.box = "vertical", plot.title=element_text(size=8, 
                                                                                          face="bold", 
                                                                                          family="Arial",
                                                                                          color="black",
                                                                                          hjust=0.5,
                                                                                          lineheight=1.2),  # title
             legend.text = element_text(colour="black", size = 8, face = "bold"),
             legend.title = element_text(colour="black", size=8, face="bold"),
             plot.subtitle=element_text(size=15, 
                                        family="Arial",
                                        face="bold",
                                        hjust=0.5),  # subtitle
             plot.caption=element_text(size=6),  # caption
             
             axis.title.x=element_text(vjust=10,  
                                       size=1),  # X axis title
             axis.title.y=element_text(size=15),  # Y axis title
             axis.text.x=element_text(size=10, 
                                      angle = 90,
                                      vjust=.5),  # X axis text
             axis.text.y=element_text(size=10, hjust = 0.5, face = "bold"),
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



##to save  plots example
ggsave("OL.tiff", plot = ggOL, width=600, height=450, units="mm", dpi=300, compression = "lzw")


# Split in horizontal direction
facet_grid(ggNE, ggOL, cols = vars(Pathways))

plot_grid(ggNE, ggOL, labels = "AUTO", ncol = 2, 
          align = 'h', axis = 'AUTO', legend.position = "bottom", legend.box = "vertical")

##Both OL and Neuro lineages plots were taken into adobe photoshop to touch up, combine both plots with the same y-axis and some labelling


##Optional parameters

plot_grid(ggNE, ggOL)
