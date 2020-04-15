
plotdata <- read.csv("plotdata_test.csv", header = TRUE, row.names = 1)

plotdata <- read.csv("plotdata.csv")

#line_t11
library(ggplot2)

OLsNB <- ggplot(plotdata, aes(x = Axis1, y = Axis2)) +
  geom_point(aes(colour = Cluster, size=3)) + 
  scale_color_manual(values=c("red3","blue3","indianred2","rosybrown3","seashell3","pink3","firebrick2","red1", "green1")) + theme_classic() +
  theme(line = element_blank(),
        text = element_blank(),
        title = element_blank()) + geom_line(aes(x = t11V1, y = t11V2),size=1.5, linetype="dotted", colour = "black") + geom_line(aes(x = t12V1, y = t12V2),size=2, linetype="dashed", colour = "black") + geom_line(aes(x = t13V1, y = t13V2),size=2, linetype="solid", colour = "black")
print(OLsNB)
#t13 is MOL trajectory
#t12 is OPC trajectory
#t11 is OPC trajectory

print(OLsNB)

ggsave("OLs+NB.tiff", width = 5, height = 5, dpi=300)


cols = c("blue3",  #NBs - leave
         "red3", #MOL - could be red4 or a bit darker
         "red1", #OPC- could be red2 or a bit darker
         "firebrick2", #OLTAP 
         "grey30", #TAP
         "indianred2", #OLaNSC
         "grey45", #aNSC
         "rosybrown3", #OLpNSC
         "grey60", #pNSC
         "pink3", #OLqNSCII
         "grey75", #qNSCII
         "seashell3",#OLqNSCI
         "grey90" #qNSCI
))


cols = c("blue3",  #NBs - leave
         "red3", #MOL - could be red4 or a bit darker
         "red1", #OPC- could be red2 or a bit darker
         "firebrick2", #OLTAP 
         "grey30", #TAP
         "indianred2", #OLaNSC
         "grey45", #aNSC
         "rosybrown3", #OLpNSC
         "grey60", #pNSC
         "pink3", #OLqNSCII
         "grey75", #qNSCII
         "seashell3",#OLqNSCI
         "grey90")) #qNSCI



################ this works
OLsNB <- ggplot(plotdata, aes(x = Axis1, y = Axis2)) +
  geom_point(aes(colour = Cluster, size=4)) + 
  scale_color_manual(values=c("red3","blue3","indianred2","rosybrown3","seashell3","pink3","firebrick2","red1")) + theme_classic() +
  theme(line = element_blank(),
        text = element_blank(),
        title = element_blank())
print(OLsNB)

ggsave("OLs+NB.tiff", width = 5, height = 5, dpi=300)
