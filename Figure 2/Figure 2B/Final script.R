library(ggplot2)
library(ggpubr)
library(dplyr)
library(readxl)
library(RColorBrewer)
library(readr)
library(directlabels)

display.brewer.all(colorblindFriendly = TRUE)


rm(p)
#to load in the data file with the correct column features
plotdatasepOL6 <- read_csv("plotdatasepOL6.csv", 
                           col_types = cols(Cluster_Number = col_number(), 
                                            Fold_Enrichment = col_number(), Rank = col_skip(), 
                                            Sigscore = col_number(), Stage = col_number(), 
                                            pvalue = col_number()))
View(plotdatasepOL6)



#Wparameters used for constructing plot
p2 <- ggplot(plotdatasepOL6, aes(Stage, Fold_Enrichment, group=Pathways, 
                                 color=Pathways), plotdatasepOL6$Cluster <- factor(plotdatasepOL6$Cluster, levels=c("qNSCI","qNSCII","pNSC", "aNSC", "TAP", "OPC", "MOL"))) +
  geom_line(aes(size = 1)) +
  geom_point(aes(size = Sigscore)) +
  facet_wrap(~Cluster_Number, scales = "free", ncol=4) +
  guides(color = "legend", linetype ="none") # doesnt work

#theme
p2 + theme(legend.position = "right", legend.box = "vertical", plot.title=element_text(size=6, 
                                                                                       face="bold", 
                                                                                       family="Arial",
                                                                                       color="black",
                                                                                       hjust=0.5,                                                                        lineheight=1.2),  # title
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
           panel.grid.major = element_line(colour = "white", size=.5),
           panel.grid.minor = element_line(colour = "white", 
                                           size=.25, 
                                           linetype = "dashed"),
           panel.border = element_blank(),
           axis.line.x = element_line(colour = "black", 
                                      size=1.5, 
                                      lineend = "butt"),
           axis.line.y = element_line(colour = "black", 
                                      size=1.5),
           axis.ticks = element_line(size = 1, colour = "black"),
           axis.ticks.length = unit(.2, "cm")) 

print(p2)

ggsave("Panther3.tiff", units="in", width=15, height=9, dpi=600, compression = 'lzw')

#Having the axis in, was tricky for the different cell clusters in order. It worked intially but not later. Plot was adapted/touched up futher in photoshop for homogenising with other figures. 