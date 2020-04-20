
# **AdultOLgenesis**

## Single cell analysis of the generation and regulation of oligodendrocyte lineage cells
**Summary:** The subventricular zone (SVZ) is the largest neurogenic niche in the adult forebrain. Notably, neural stem cells (NSCs) of the SVZ generate not only neurons, but also oligodendrocytes, the myelin-forming cells of the central nervous system. Transcriptomic studies have provided detailed knowledge of the molecular events that regulate neurogenesis, but little is understood about adult oligodendrogenesis from SVZ NSCs.

To address this, an in-depth single-cell transcriptomic analyses was done to resolve the major differences in neuronal and oligodendroglial lineages derived from the adult SVZ. A hallmark of adult oligodendrogenesis was the stage-specific expression of transcriptional modulators that regulate developmental oligodendrogenesis. Notably, divergence of the oligodendroglial lineage is distinguished by Wnt-Notch and angiogenesis-related signalling, whereas G-protein-coupled receptor signalling pathways were the major signature observed in the neurogenic lineage.

Moreover, in-depth gene regulatory network analysis identified key stage-specific master regulators of the oligodendrocyte lineage and revealed new mechanisms by which signalling pathways interact with transcriptional networks to control lineage progression. This study was able to connect in a multilevel network 13 distinct phases of differentiation from NSCs to mature oligodendrocytes by including novel transcriptional mechanisms orchestrating the transition of stages.

**Provided in this page are the data in the forms of scripts, network files, matrices, gene lists and a number of other formats generated for formulating the study. These are separated into each of the folder as they appear in the manuscript. The current submitted study is undergoing revisions and further data are placed in this page that is not part of the manuscript as extra material. Updates to follow in due course in accordance with the final presentation of data in the manuscript.**


![NRR2 Fig](https://user-images.githubusercontent.com/31452870/79333262-837d6100-7f1e-11ea-95d0-886b54d61c62.jpg)



# Section 1 - Dissecting oligodendrocyte lineage heterogeneity: Framework for in-depth examination into disease states
The SVZ is a germinal zone that contains NSCs that continuously gives rise to new neural cells life-long. Recent work from the labs of Raineteau, Berninger, Gotz, Parras, Butt, Richardson and others, have demonstrated the SVZ consists of distinct SVZ microdomain that generates different neural lineages throughout life (Kessaris et al., 2006; Young et al., 2007; Brill et al., 2009; Winpenny et al., 2011; Nakatani et al., 2013; Ortega et al., 2013; Fiorelli et al., 2015; Azim et al., 2017; Zweifel et al., 2018). For example, the NSCs from the dorsal wall (cells in red in Figure above) preferably differentiate into glutamatergic neurons or oligodendrocytes, whilst NSCs from more ventral regions gives rise interneurons. The functions of these newly generated cells are for plasticity purposes, maintenance and re-organization of neuronal networks. Subclasses of newborn neurons migrate long distance and invade the olfactory bulb. 

![Fig 2](https://user-images.githubusercontent.com/31452870/79344589-5043cd80-7f30-11ea-9c77-95fbb7e201b9.jpg)

Neural cell genesis occurs sequentially, and the last cells to be generated in the SVZ are oligodendrocytes (Rowitch and Kriegstein, 2010; Naruse et al., 2017). As shown above, dorsal NSCs preferentially generate oligodendrocytes whereas interneurons are derived from more ventral NSCs. These findings in the field led to the concept that regionally segregated NSCs are primed in a time-controlled manner for the generation of neural subtypes, proposing that intrinsic mechanisms coupled to environmental cues drive NSC fates into specific neuronal and glial lineages. In the postnatal and adult SVZ, dorsalizing cues include the liver X receptor, FGF2 and Wnt signalling pathways (reviewed in (Azim et al., 2016)), whereas Shh regulates the expression of more ventralizing transcriptional networks (Ihrie et al., 2011). This suggests that signalling pathways coordinate transcriptional networks, and are aspects that can be functionally probed for driving cell fates or lineage reprogramming. 


The transcriptional networks controlling SVZ-NSCs during adult oligodendrogenesis are currently unsolved. In this project, we set out to unravel the molecular mechanisms orchestrating the fate of oligodendrocyte lineage cells. Here, we used a strategy developed by Dr Onur Basak and colleagues where NSCs/progenitors and subtypes of neural cells surrounding the niche of young adult SVZ were isolated and FACS-enriched using genetic reporters and immunochemical markers as described in detail for olfactory neurogenesis in his landmark study (Basak et al., 2018). 

Based on previous work, it was hypothesized that adult lineage-specific NSCs could be identifiable by expression of common genes as hallmarks for defined subpopulations of NSCs as observed during early postnatal development. To this end, previously generated gene lists of SVZ-oligodendrogenesis from bulk datasets were assembled and refined further for representing genes that are highly enriched in the OL lineage as compared to the generation of neuroblasts (NBs) (Azim et al., 2017). Normalized data provided in the matrices folder was used to input into PartekFlow (https://www.partek.com/partek-flow/). After default procedures and settings, landmark genes that define the earlier stages of the oligodendrocyte lineage were used to aid identification of potential oligodendroglial clones. These include the indispensible TFs Olig2, Olig1 and Sox10, and a cohort of other TFs as described in Methods section of the manuscript). As an advantage, PartekFlow highlights cells based on input gene marker profiles, allowing the identification of neighboring cells that are transcriptionally similar. Following classification of putative OL clones descending from NSCs/TAPs, gene lists derived from PartekFlow had initially revealed that the major differences in the two SVZ lineages are attributed to the expression of TFs (see below), which is in agreement with the observed postnatal gliogenic lineages abundance of TF expression (Azim et al., 2015). 

Such identified cells made up approximately 15% of all NSCs/TAPs and were further refined by analyzing at different stages of differentiation more closely on tSNE plots coupled with the a PCA heat plot for extracting representative OL lineage NSCs/TAPs (termed thereafter as OLNSCs/TAPs). These eventually amounted to approximately 7.2% of all NSC/TAP subtypes across the five NSC and TAP stages of differentiation. 

![PCA](https://user-images.githubusercontent.com/31452870/79344633-5e91e980-7f30-11ea-9c6b-98a482dd6f8e.jpg)

Thereafter, expression profiles of substages of the OL lineage and of the neuronal lineage could be identified, where major oligodendroglial were lower or absent in the latter lineage. A third category of expression profiles were obtained where the genes common across both groups from stages qNSC up until TAPs were extracted. This third set of gene signature define common regulatory, processes, signaling mechanisms, etc, in both SVZ lineages and summarized in the figure below. Raw tsne plots extracted from PartekFlow are uploaded into the Figure 1 folder above (subfolder "Figure 1A,B,D"). 

![Lineage classification](https://user-images.githubusercontent.com/31452870/79344607-56d24500-7f30-11ea-8bd1-9aba3ad85a35.jpg)

Once OL and neuronal clones of cells were assigned, they were renamed in the matrix (RACEID normalised Matrix of 1466.zip) and was processed next using the gold standard Seurat package (https://satijalab.org/seurat/v3.1/visualization_vignette.html) for single cell analysis (Butler et al. 2018) (Adapted Scripts and input Matrix in Subfolder Figure 1E,F). FateID pseudotime trajectory done as per the guidelines in the following toolkit: https://github.com/dgrun/FateID (Herman et al. 2018) and data provided in subfolders Figure 1C.


# ** Section 2 - Pathway and Biological Process Gene Ontology Analysis -  Online Extension to Figure 2**

Additional unpublished gene ontology analysis done on the three broader groups using the following online tool: http://www.pantherdb.org
In this analysis, the gene expression profiles of cells within these groups as shown in the figure above, we pooled so as to have 3 broader groups for Panther Pathway, Reactome Pathway/Processes and protein class. The same procedures were followed as the data presented for dotplots in the main manuscript. 
![BROADER GO STUFF](https://user-images.githubusercontent.com/31452870/79344564-49b55600-7f30-11ea-9dc1-a6d22812b220.jpg)
Raw data: 
[The 3 broad stages for pathway analysis.zip](https://github.com/kasumaz/AdultOLgenesis/files/4481775/The.3.broad.stages.for.pathway.analysis.zip)

Similarly, using Cluego on Cytoscape, cluster specific genes for the 7 oligodendroglial stages were used as input for examining Reactome pathways as shown in figure below. 

![cluego](https://user-images.githubusercontent.com/31452870/79344575-4d48dd00-7f30-11ea-8a80-67459949368a.jpg)

Raw Cytoscape Cluego file to follow. 



# **Section 3 - Ranking of transcriptional cues and gene regulatory network reconstruction - Online Extension to Figure 4**

The analysis had disclosed major classes of protein present in earlier oligodendroglial lineage cells, notably with mid-proliferative cell stages featuring abundant expression of transcriptional cues. Therefore, the expression of TFs (including transcriptional adapters, transcription cofactors) was further explored taking into account their common expression in both the oligodendroglial and neuron lineages. To this end, an analysis was performed by compiling genes in all oligodendroglial clone clusters and compared with the proneuronal clones. The numerous and abundant TFs particularly at the mid stages as described above, TFs that are further enriched in the OL lineage and TFs common to both OL and neuron lineages were explored. Corresponding genes were prioritized based on the GeneMania-derived genetic and physical interaction analysis. This step aids determining the effects of perturbing a given TF and its impact of adjacent genes based on genetic, proteomic and simulated data of known TF-target gene interactions and protein-protein interactions (see Materials and Methods). This procedure allows correlating genes and gene-network interactions to functional relevance from multiple studies that forms the background data that outlines the different stages and TF expression across the oligodendroglial lineage. Prioritizing TFs was done by applying the ‘heat diffusion’ algorithm that tests the input query data and the functional interaction of each gene propagation across the network. Strongly interactive nodes in the network are uncovered and allow creation of subnetworks, allowing filtering of nodes with lower functional relevance. This was applied for both physical and genetic interactions (see figure below) and identified TFs with functional weighting. Using these parameters and additional topological interpretations as described in Materials and Methods were computed for representing the key TFs. 

![Diffusion overview](https://user-images.githubusercontent.com/31452870/79344584-4f12a080-7f30-11ea-855e-cd52b91b55b3.jpg)

TETRAMER (TEmporal TRAnscription regulation ModellER) was used for the reconstruction of gene regulatory networks (GRNs) that integrates differentiation states during lineage progression with GRNs from publically available datasets (Cholley et al., 2018). A meta-analysis was compiled for TFs expressed in the identified clusters of the oligodendroglial, neuronal lineages and TFs that are expressed in both of these lineages and termed as “common” TFs. These were compared with gene expression profiles of mammalian tissue/cells with comprehensive analysis of deposited ChIP-sequencing data corresponding to TF-binding and incorporation of actively transcribed enhancers and promoters. See also:
Cholley et al., 2018. 
https://www.nature.com/articles/s41540-018-0066-z 
http://apps.cytoscape.org/apps/tetramer 
http://igbmc.fr/Gronemeyer/qcgenomics/TETRAMER

Further information on optimization of this method can be provided by its developer Dr Marco Mendoza Parra mmendoza@genoscope.cns.fr

A major advancement in this gene network analysis tool is that is enables transcriptional regulation of target-genes to be defined as gene activation or gene repression, which is unlike any other method. 

![ref fig](https://user-images.githubusercontent.com/31452870/79357244-0f53b500-7f40-11ea-955f-49e529e68cac.jpg)

The GRN assembled for common TFs and oligodendrogenesis were combined and merged with a recently assembled GRN for oligodendrogenesis comprising post OPC to mature OL stages (Cantone et al., 2019). In the later study, the downstream gene regulatory effects of TFs Olig2, Sox10, and Tcf7l2 during OL differentiation and maturation were unraveled. Therein, genes overlapping in later stage OLs from the present study with those published recently (Cantone et al., 2019), were filtered and represented as GO Biological Processes in a larger merged network. Please also check out the online tool of virtual cells made by our partners that can be used to explore later stages oligodendrocytes: https://www.vcells.net/oligodendrocyte/

![GRN](https://user-images.githubusercontent.com/31452870/79344600-55088180-7f30-11ea-9ae0-bc1f6bc2072e.jpg)

Subnetworks below used to reconstruct are provided as raw Cytoscape files in Supplementary Figures/Supplementary Figure 6 together with the final reconstructed GRN. 

![Legend](https://user-images.githubusercontent.com/31452870/79365049-6a8aa500-7f4a-11ea-935a-3d53682c1b20.jpg)

![OL resized2](https://user-images.githubusercontent.com/31452870/79365066-6eb6c280-7f4a-11ea-9c5e-1695f7b1d2f9.png)

![Generic-smaller](https://user-images.githubusercontent.com/31452870/79365225-a0c82480-7f4a-11ea-8327-ab4d4da336a4.png)



# **Section 4 - AdultOLgenesis Gene Regulatory Network - Online Extension to Figure 4**

![Main Legend](https://user-images.githubusercontent.com/31452870/79365465-f7cdf980-7f4a-11ea-80b7-fb8573af396b.jpg)

![All network3](https://user-images.githubusercontent.com/31452870/79365477-fac8ea00-7f4a-11ea-94f3-da36eb8b26ac.jpg)



# **Section 5 - Higher Resolution Network Micrographs - Online Extension to Figure 5**
See above legend for detailing network and interaction components. 

![Olig2+Sox10](https://user-images.githubusercontent.com/31452870/79366602-c6562d80-7f4c-11ea-9859-595ee769ce41.png)

![OLqNSCI](https://user-images.githubusercontent.com/31452870/79366618-ceae6880-7f4c-11ea-91fd-d033a195a7a5.png)

![OLqNSCII](https://user-images.githubusercontent.com/31452870/79366622-d110c280-7f4c-11ea-8f93-a0f0ac0c019e.png)

![OLpNSC](https://user-images.githubusercontent.com/31452870/79366626-d40bb300-7f4c-11ea-905f-0e0b645dd4bf.png)

![OLaNSC](https://user-images.githubusercontent.com/31452870/79366648-dbcb5780-7f4c-11ea-8411-995e155c496d.png)

![OLTAP](https://user-images.githubusercontent.com/31452870/79366656-dff77500-7f4c-11ea-8858-c07c68319182.png)



# **Section 6 - Alternative layout using force-direction - Online Extension to Figure 5**

![qNSC1-B-x](https://user-images.githubusercontent.com/31452870/79366780-10d7aa00-7f4d-11ea-90f0-71cc34597ecd.png)

![qNSC II-x](https://user-images.githubusercontent.com/31452870/79366785-1208d700-7f4d-11ea-8b6d-fa692338ccbe.png)

![pNSC-B-x](https://user-images.githubusercontent.com/31452870/79366790-13d29a80-7f4d-11ea-9c23-f5c4d8e8191d.png)

![aNSC-a-x](https://user-images.githubusercontent.com/31452870/79366802-1634f480-7f4d-11ea-97e5-c27b0e9e2ce4.png)

![TAP](https://user-images.githubusercontent.com/31452870/79366805-17feb800-7f4d-11ea-966e-8665c82d311a.png)




# **Section 7 - Transcriptional Propagation of Signaling Pathways Across the AdultOLgenesis Gene Regulatory Network - Online Extension to Figure 6**

This section contains the data used to generate figure 6 of the main manuscript, higher resolution files, TF/gene node coordinates across the network and the main GRN file.

**Downstream signaling pathway effectors tested** 

Wnt Signaling:
Tle2
Hdac8
Tcf7l2
Tle4
Sox9**
Tle6**
Expanded Pathway Analysis


PDGF Signaling:
Stat1
Stat5b


Gonadtopin Signaling:
Fos
Zeb1
Ascl1
Fosb
Egr1

Tanscriptional Regulation by bZP TFs:
Creb3l1
Gtf2e2

General Transcriptional Regulation:
Tbpl1
Taf9
Gtf2e2

CCKR Signaling Map:
Ctnnb1
Fos
Srf
Egr1

Circadian Clock:
Per3
Per1

Notch signaling:
Hes1
Hes5
Notch2
Hey1


Angiogenesis:
Stat1
Notch2
Tcf7l2


p53:
Hmgb1
Cdk2
E2f3
Mta2
Trp53


p53 feedback loop2:
Rbl1
Ctnnb1

In the illustrations here given, for example, for PDGF Signaling, its TFs are queried into in the search box in Cytoscape to highlight them. In select pull down menu to "Nodes" to "First Neighnors of Selected Nodes" and selecting "Directed: Outgoing". Target genes immediately downstream of PDGF TF effectors are selected which. These steps are repeated once more to highlight incrementally the signal propagation and network coverage until this point. In the edges menu, the column of "is_inhibition" reveals the transcriptional regulation of selected genes and can be quantified (by exporting table as is or copying and pasting of columns to excel) for gene activation, repression or unknown undetermined interaction. Data can be plotted as exemplified in the figure below. 

![Figure 6](https://user-images.githubusercontent.com/31452870/79368214-54331800-7f4f-11ea-830b-dffac96afac7.jpg)


Raw data's and network files for performing the analysis: 

[Node Coordinates.zip](https://github.com/kasumaz/AdultOLgenesis/files/4482747/Node.Coordinates.zip)

[Figure 6 higher resolution plots.zip](https://github.com/kasumaz/AdultOLgenesis/files/4482750/Figure.6.higher.resolution.plots.zip)

[GRN Base For Testing Network Propagation.zip](https://github.com/kasumaz/AdultOLgenesis/files/4482754/GRN.Base.For.Testing.Network.Propagation.zip)

Such analysis can be useful for identifying for example, potentially inhibitory ligands/chemokines that emerge during disease with unknown effects on oligodendroglial lineage cells. If the known transcriptional effectors of such cues are expressed endogenously, the gene targets can be predicted. Our future investigations will aim to define these regulatory interactions from different contexts (i.e. disease states) in order to improve accuracy of predictions.   


## References: 
Azim K, Berninger B, Raineteau O (2016) Mosaic Subventricular Origins of Forebrain Oligodendrogenesis. Front Neurosci 10:107.

Azim K, Angonin D, Marcy G, Pieropan F, Rivera A, Donega V, Cantu C, Williams G, Berninger B, Butt AM, Raineteau O (2017) Pharmacogenomic identification of small molecules for lineage specific manipulation of subventricular zone germinal activity. PLoS Biol 15:e2000698.

Basak O, Krieger TG, Muraro MJ, Wiebrands K, Stange DE, Frias-Aldeguer J, Rivron NC, van de Wetering M, van Es JH, van Oudenaarden A, Simons BD, Clevers H (2018) Troy+ brain stem cells cycle through quiescence and regulate their number by sensing niche occupancy. Proc Natl Acad Sci U S A 115:E610-E619.

Bast L, Calzolari F, Strasser MK, Hasenauer J, Theis FJ, Ninkovic J, Marr C (2018) Increasing Neural Stem Cell Division Asymmetry and Quiescence Are Predicted to Contribute to the Age-Related Decline in Neurogenesis. Cell reports 25:3231-3240 e3238.

Brill MS, Ninkovic J, Winpenny E, Hodge RD, Ozen I, Yang R, Lepier A, Gascon S, Erdelyi F, Szabo G, Parras C, Guillemot F, Frotscher M, Berninger B, Hevner RF, Raineteau O, Gotz M (2009) Adult generation of glutamatergic olfactory bulb interneurons. Nat Neurosci 12:1524-1533.

Butler A, Hoffman P, Smibert P, Papalexi E, Satija R (2018) Integrating single-cell transcriptomic data across different conditions, technologies, and species. Nat Biotechnol 36:411-420.

Calzolari F, Michel J, Baumgart EV, Theis F, Gotz M, Ninkovic J (2015) Fast clonal expansion and limited neural stem cell self-renewal in the adult subependymal zone. Nat Neurosci 18:490-492.

Cholley PE, Moehlin J, Rohmer A, Zilliox V, Nicaise S, Gronemeyer H, Mendoza-Parra MA (2018) Modeling gene-regulatory networks to describe cell fate transitions and predict master regulators. NPJ systems biology and applications 4:29.

Fiorelli R, Azim K, Fischer B, Raineteau O (2015) Adding a spatial dimension to postnatal ventricular-subventricular zone neurogenesis. Development 142:2109-2120.

Herman JS, Sagar, Grun D (2018) FateID infers cell fate bias in multipotent progenitors from single-cell RNA-seq data. Nat Methods 15:379-386.

Ihrie RA, Shah JK, Harwell CC, Levine JH, Guinto CD, Lezameta M, Kriegstein AR, Alvarez-Buylla A (2011) Persistent sonic hedgehog signaling in adult brain determines neural stem cell positional identity. Neuron 71:250-262.

Kessaris N, Fogarty M, Iannarelli P, Grist M, Wegner M, Richardson WD (2006) Competing waves of oligodendrocytes in the forebrain and postnatal elimination of an embryonic lineage. Nat Neurosci 9:173-179.

Nakatani H, Martin E, Hassani H, Clavairoly A, Maire CL, Viadieu A, Kerninon C, Delmasure A, Frah M, Weber M, Nakafuku M, Zalc B, Thomas JL, Guillemot F, Nait-Oumesmar B, Parras C (2013) Ascl1/Mash1 promotes brain oligodendrogenesis during myelination and remyelination. J Neurosci 33:9752-9768.

Ortega F, Gascón S, Masserdotti G, Deshpande A, Simon C, Fischer J, Dimou L, Chichung Lie D, Schroeder T, Berninger B (2013) Oligodendrogliogenic and neurogenic adult subependymal zone neural stem cells constitute distinct lineages and exhibit differential responsiveness to Wnt signalling. Nat Cell Biol 15:602-613.

Winpenny E, Lebel-Potter M, Fernandez ME, Brill MS, Gotz M, Guillemot F, Raineteau O (2011) Sequential generation of olfactory bulb glutamatergic neurons by Neurog2-expressing precursor cells. Neural Dev 6:12.

Young KM, Fogarty M, Kessaris N, Richardson WD (2007) Subventricular zone stem cells are heterogeneous with respect to their embryonic origins and neurogenic fates in the adult olfactory bulb. J Neurosci 27:8286-8296.

Zweifel S, Marcy G, Lo Guidice Q, Li D, Heinrich C, Azim K, Raineteau O (2018) HOPX Defines Heterogeneity of Postnatal Subventricular Zone Neural Stem Cells. Stem cell reports 11:770-783.






