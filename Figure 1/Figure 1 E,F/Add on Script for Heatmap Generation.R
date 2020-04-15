### All of this to addapt according to what cells i wanna extract or my own datasets

scex1 <- scex  # to clone the main seurat object
set.seed(seed = 42)
scex1$replicate <- sample(x = c("rep1", "rep2"), size = ncol(x = scex1), replace = TRUE)


# How can I extract expression matrix for all NK cells (perhaps, to load into another package)
OPC.raw.data <- as.matrix(x = GetAssayData(object = scex1, slot = "counts")[, WhichCells(object = scex1, ident = "OPC")]) #to addapt according to what cells i wanna extract

# Can I create a Seurat object based on expression of a feature or value in object metadata?
subset(x = scex1, subset = Sox10 > 1)
## An object of class Seurat 
## 13714 features across 414 samples within 1 assay 
## Active assay: RNA (13714 features)
##  2 dimensional reductions calculated: pca, umap
###to addapt according to what cells i wanna extract


subset(x = scex1, subset = replicate == "rep2")
## An object of class Seurat 
## 13714 features across 1311 samples within 1 assay 
## Active assay: RNA (13714 features)
##  2 dimensional reductions calculated: pca, umap
# Can I create a Seurat object of just the NK cells and B cells?

subset(x = scex1, idents = c("OPC", "MOL"))
subset(x = scex1, idents = c("NB", "MOL", "OPC", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI"))
## An object of class Seurat 
## 13714 features across 499 samples within 1 assay 
## Active assay: RNA (13714 features)
##  2 dimensional reductions calculated: pca, umap




# Can I create a Seurat object of all cells except the NK cells and B cells?
subset(x = scex1, idents = c("OPC", "MOL"), invert = TRUE)
subset(x = scex1, idents = c("NB", "MOL", "OPC", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI"), invert = TRUE) # not worked
## An object of class Seurat 
## 13714 features across 2139 samples within 1 assay 
## Active assay: RNA (13714 features)
##  2 dimensional reductions calculated: pca, umap
# note that if you wish to perform additional rounds of clustering after subsetting we recommend

# re-running FindVariableFeatures() and ScaleData()
#Calculating the average gene expression within a cluster

# How can I calculate the average expression of all cells within a cluster?
cluster.averages <- AverageExpression(object = scex1)
head(x = cluster.averages[["RNA"]][, 1:7])


# Return this information as a Seurat object (enables downstream plotting and analysis) First,
# replace spaces with underscores '_' so ggplot2 doesn't fail

orig.levels <- levels(x = scex1)
Idents(object = scex1) <- gsub(pattern = " ", replacement = "_", x = Idents(object = scex1))
orig.levels <- gsub(pattern = " ", replacement = "_", x = orig.levels)
levels(x = scex1) <- orig.levels
cluster.averages <- AverageExpression(object = scex1, return.seurat = TRUE)
cluster.averages

## An object of class Seurat 
## 13714 features across 9 samples within 1 assay 
## Active assay: RNA (13714 features)

# How can I plot the average expression of NK cells vs. CD8 T cells?  Pass do.hover = T for an
# interactive plot to identify gene outliers
CellScatter(object = cluster.averages, cell1 = "OPC", cell2 = "MOL")


scex1$orig.ident <- factor(x = scex1$orig.ident, levels = c("NB", "MOL", "OPC", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI"))
my_levels <- c("NB", "MOL", "OPC", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI")
scex1@active.ident <- factor(x = scex1@active.ident, levels = my_levels)




# How can I calculate expression averages separately for each replicate?
cluster.averages <- AverageExpression(object = scex1, return.seurat = TRUE, add.ident = "replicate")
##THIS BIT IS IMPORTANT!!! This gives me 2 replicates


CellScatter(object = cluster.averages, cell1 = "OPC_rep1", cell2 = "OPC_rep2")


# You can also plot heatmaps of these 'in silico' bulk datasets to visualize agreement between
# replicates
DoHeatmap(object = cluster.averages, features = unlist(x = TopFeatures(object = scex1[["pca"]], balanced = TRUE)), size = 2)

DoHeatmap(object = scex1, features= c("Sox10","Ascl1", "Hopx",
                                      "Olig2"))

DoHeatmap(object = cluster.averages, features= c("Fjx1",
                                                 "Gpr37l1",
                                                 "Gja1",
                                                 "Sparcl1",
                                                 "Dio2",
                                                 "Kcnj16",
                                                 "Grm3",
                                                 "Mgll",
                                                 "Appl2",
                                                 "Slc4a4",
                                                 "Hopx",
                                                 "Trps1",
                                                 "Luzp2",
                                                 "Gria2",
                                                 "Thbs4",
                                                 "Hmgcs2",
                                                 "S100a6",
                                                 "Meg3",
                                                 "Fxyd1",
                                                 "Cpe",
                                                 "1500015O10Rik",
                                                 "Prss56",
                                                 "Enpp2",
                                                 "Ttr",
                                                 "2810454H06Rik",
                                                 "Hmgcs2",
                                                 "Thbs4",
                                                 "S100a6",
                                                 "Sfrp1",
                                                 "Foxo1",
                                                 "Fars2",
                                                 "Cpe",
                                                 "Xrn1",
                                                 "Fbxo2",
                                                 "Ascl1",
                                                 "Lima1",
                                                 "Miat",
                                                 "Mcm6",
                                                 "Dek",
                                                 "Pak3",
                                                 "Pcna",
                                                 "Egfr",
                                                 "Egr1",
                                                 "Fos",
                                                 "Olig2",
                                                 "Egfr",
                                                 "Mycn",
                                                 "Fabp7",
                                                 "Hspa1b",
                                                 "Miat",
                                                 "Egr1",
                                                 "Hspa1a",
                                                 "Nptx2",
                                                 "Dnajb1",
                                                 "Hmgb2",
                                                 "H2afz",
                                                 "Rrm2",
                                                 "2810417H13Rik",
                                                 "Mki67",
                                                 "Hmgn2",
                                                 "Top2a",
                                                 "Tuba1b",
                                                 "Pcna",
                                                 "Ccnd2",
                                                 "Dpysl3",
                                                 "Hes6",
                                                 "Ran",
                                                 "Cdk4",
                                                 "Fos",
                                                 "Hdgf",
                                                 "Marcks",
                                                 "Hmgn2",
                                                 "Tmsb4x",
                                                 "Egr1",
                                                 "Gpr17",
                                                 "3110035E14Rik",
                                                 "Cspg4",
                                                 "Lhfpl3",
                                                 "Pdgfra",
                                                 "Sulf2",
                                                 "Cntn1",
                                                 "Olig1",
                                                 "Olig2",
                                                 "Vcan",
                                                 "Mal",
                                                 "Mag",
                                                 "Cldn11",
                                                 "Trf",
                                                 "Tubb4a",
                                                 "43712",
                                                 "Mbp",
                                                 "Ptgds",
                                                 "Cnp",
                                                 "Plp1",
                                                 "Dlx6os1",
                                                 "Stmn2",
                                                 "Dcx",
                                                 "Nrep",
                                                 "Tubb3",
                                                 "Tmsb10",
                                                 "Basp1",
                                                 "Map1b",
                                                 "Cd24a",
                                                 "Celf4"), size = 2.5)
scex1 <- RunTSNE(object = scex1)
scex1 <- RunTSNE(object = scex1, dims = 1:40) #need to install umap 

# note that you can set `label = TRUE` or use the LabelClusters function to help label
# individual clusters
DimPlot(object = scex1, reduction = "tsne", label = T)

scex1 <- RunTSNE(object = scex1)
scex1 <- RunTSNE(object = scex1, dims = 1:40) #need to install umap 

# note that you can set `label = TRUE` or use the LabelClusters function to help label
# individual clusters
DimPlot(object = scex1, reduction = "pca", label = T)


