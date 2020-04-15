#Script fully functional

#########################################################################################
#########################################################################################

# OL Clones only seurat object
#to have only OL clones in, add in the identified neuro ones below to subset
scexOL <-  subset(scex, idents = c("MOL", "NB", "TAP", "aNSC", "pNSC", "qNSCII", "qNSCI"), invert = TRUE)

RidgePlot(object = scexOL, features = c("Pcna", "Mki67"),  cols = c("red1", "firebrick2", "indianred2", "pink3", "pink1", "seashell3"), ncol = 2)

RidgePlotOL <- RidgePlot(object = scexOL, features = c("Pcna", "Mki67"),  cols = c("red1", "firebrick2", "indianred2", "pink3", "pink1", "seashell3"), ncol = 2)

ggsave("1_RidgePlotOL.TIFF", plot = RidgePlotOL, device = NULL, path = NULL,
       scale = 1, width = 9, height = 5.5, units = c("in", "cm", "mm"),
       dpi = 300, limitsize = TRUE)


#########################################################################################
#########################################################################################
rm(tsneNeuro, tsneOL)
# Neuro clones only seurat object
# to have only neuro clones in, add in the identified neuro ones below to subset
scexneuro <-  subset(scex, idents = c("MOL", "OPC", "OLTAP", "OLaNSC", "OLpNSC", "OLqNSCII", "OLqNSCI"), invert = TRUE)


RidgePlot(object = scexneuro, features = c("Pcna", "Mki67"),  cols = c("blue3", "grey30", "grey45", "grey60", "grey75","grey90"), ncol = 2)

RidgePlotneuro <- RidgePlot(object = scexneuro, features = c("Pcna", "Mki67"),  cols = c("blue3", "grey30", "grey45", "grey60", "grey75","grey90"), ncol = 2)

ggsave("1_RidgePlotneuro.TIFF", plot = RidgePlotneuro, device = NULL, path = NULL,
       scale = 1, width = 9, height = 5.5, units = c("in", "cm", "mm"),
       dpi = 300, limitsize = TRUE)

#########################################################################################
#########################################################################################

# pt.size = 3,
# cols = c("blue3", "red3", "red1", "firebrick2", "grey30", "indianred2", "grey45", "rosybrown3", "grey60","pink3", "grey75","seashell3","grey90"))

# NB = "blue3",
# MOL = "red3",
# OPC = "red1",
# OLTAPs = "firebrick2", 
# TAPs = "grey30",
# OLaNSCs = "indianred2", 
# aNSCs = "grey45",
# OLpNSCs = "rosybrown3",
# pNSCs = "grey60",
# OLqNSCsII = "pink3",
# qNSCII = "grey75",
# OLqNSCI = seashell3",
# qNSCI = "grey90"