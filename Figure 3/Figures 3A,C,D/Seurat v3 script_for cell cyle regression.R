require(scales)
library(Seurat)
library(dplyr)
library(ggplot2)
library(RColorBrewer)

scex <- read.csv("sce1062_unNorm_Cellcycle.csv", header = TRUE, row.names = 1)
# Load the counts dataset

scex <- CreateSeuratObject(counts = scex, project = "scexprok", min.cells = 1, min.features = 200, names.field = 1, names.delim = "_")

# The [[ operator can add columns to object metadata. This is a great place to stash QC stats
scex[["percent.mt"]] <- PercentageFeatureSet(object = scex, pattern = "^MT-")

#Normalizing the data
#After removing unwanted cells from the dataset, the next step is to normalize the data. By default, we employ a global-scaling normalization method “LogNormalize” that normalizes the feature expression measurements for each cell by the total expression, multiplies this by a scale factor (10,000 by default), and log-transforms the result. Normalized values are stored in  pbmc[["RNA"]]@data.

scex <- NormalizeData(object = scex, normalization.method = "LogNormalize", scale.factor = 10000)

scex <- NormalizeData(object = scex)

#Identification of highly variable features (feature selection)
scex <- FindVariableFeatures(object = scex, selection.method = "vst", nfeatures = 2000)

# Identify the 10 most highly variable genes
top10 <- head(x = VariableFeatures(object = scex), 10)
# this part can be changed to top50 from defaulf o5 10
head(top10)


#Scaling the data

all.genes <- rownames(x = scex)
scex <- ScaleData(object = scex, features = all.genes)
scex <- ScaleData(object = scex)

#Perform linear dimensional reduction
scex <- RunPCA(object = scex, features = VariableFeatures(object = scex))

#Determine the ‘dimensionality’ of the dataset
# NOTE: This process can take a long time for big datasets, comment out for expediency. More
# approximate techniques such as those implemented in ElbowPlot() can be used to reduce
# computation time
scex <- JackStraw(object = scex, num.replicate = 100)
scex <- ScoreJackStraw(object = scex, dims = 1:20)

JackStrawPlot(object = scex, dims = 1:15)

head(x = Idents(object = scex), 1000)

# Relevel object@ident
###### I RAN these 2 and they worked!!! 
scex$orig.ident <- factor(x = scex$orig.ident, levels = c("OPC", "NB", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI"))
my_levels <- c("OPC", "NB", "OLTAP", "TAP", "OLaNSC", "aNSC", "OLpNSC", "pNSC", "OLqNSCII", "qNSCII", "OLqNSCI", "qNSCI")
scex@active.ident <- factor(x = scex@active.ident, levels = my_levels)

scex <- RunTSNE(object = scex)
scex <- RunTSNE(object = scex, dims = 1:40) #need to install umap 


DimPlot(object = scex, reduction = "tsne", label = T)

# find markers for every cluster compared to all remaining cells, report only the positive ones
scex.markers <- FindAllMarkers(object = scex, only.pos = TRUE, min.pct = 0.25, logfc.threshold = 0.25)
scex.markers %>% group_by(cluster) %>% top_n(n = 2, wt = avg_logFC)
top10 <- scex.markers %>% group_by(cluster) %>% top_n(n = 10, wt = avg_logFC)

write.csv(scex.markers, "cell_cycleClusters")
write.csv(top10, "top10.csv")

DoHeatmap(object = scex, features = top10$gene) + NoLegend()
DoHeatmap(object = scex, features = top10$gene)
##### heatmaps 


saveRDS(scex, file = "Seuratv3_project")
readRDS("Seuratv3_project.rds", refhook = NULL)
loadRDS("Seuratv3_project")


