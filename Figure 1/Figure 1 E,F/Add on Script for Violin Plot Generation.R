#working
VlnPlot(object = scex, features = c("Dlx6os1",
                                    "Stmn2"),
        slot = "counts", 
        same.y.lims = T,
        ncol = 1,  
        log = TRUE,
        pt.size = 0,
        cols = c("blue3", "red3", "red1", "firebrick2", "grey30", "indianred2", "grey45", "rosybrown3", "grey60","pink3", "grey75","seashell3","grey90"))

#working
VlnPlot(object = scex, features = c("Gapdh"),slot = "counts", 
        same.y.lims = T,
        ncol = 1,  
        log = TRUE,
        pt.size = 0,
        cols = c("blue3", "red3", "red1", "firebrick2", "grey30", "indianred2", "grey45", "rosybrown3", "grey60","pink3", "grey75","seashell3","grey90"))
