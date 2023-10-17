# DESeq2 Signature Generation
 Generate gene expression signatures using DESeq2 with [DESeq2_Signature_Generation.r](https://github.com/ashleyduche/GFRN_Signature_Generation/blob/main/DESeq2_Signature_Generation.r).

# Simulation Datasets
The following datasets can be used to trial run DESeq2_Signature_Genertion.r:
1. AKT gene expression signature data : 2023.GFP18_AKT_FeatureCounts.csv
2. FeatureCounts annotation data: 2023.GFP18_AKT_FeatureCounts.csv 

# Data Background
The example RNA-seq dataset includes gene expression signature data for a GFRN-respective pathway known as AKT along with its respective control samples Green Fluorescent Proteins (GFPs). This signature data was produced from the overexpression of GFRN pathway-specific genes in human mammary epithelial cells (HMECs) generated and explored in ["Activity of distinct growth factor receptor network components in breast tumors uncovers two biologically relevant subtypes"](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5406893/). 

The original RNA-seq FastQ files were downloaded from NCBI-GEO for the dataset [GSE83083](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE83083) and data processing steps were updated as follows for alignment and quantification:
  #### Processing:
  - Raw sequencing FastQ files were downloaded from NCBI using SRA Run Selector for dataset [GSE83083](https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE83083).
  - Reads trimming was performed using [Trimmomatic - bioconda](http://www.usadellab.org/cms/?page=trimmomatic).
  - Reads were aligned and quantified using R open source [Rsubread Package](https://bioconductor.org/packages/devel/bioc/vignettes/Rsubread/inst/doc/Rsubread.pdf) from Bioconductor.
    - Alignment Reference Genome: *GRCh38*  
  
