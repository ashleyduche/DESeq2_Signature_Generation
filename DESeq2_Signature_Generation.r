# Required Packages 

if (!requireNamespace("ASSIGN", quietly = TRUE)){
  install.packages(ASSIGN)
}
library(ASSIGN)

if (!requireNamespace("DESeq2", quietly = TRUE)){
  install.packages("DESeq2")
}
library(DESeq2)

if(!requireNamespace("BioGenerics", quietly = TRUE)){
  install.packages("BioGenerics")
}
library(BiocGenerics)

if (!requireNamespace("stats", quetly = TRUE)){
  install.packages("stats")
}
library(stats)

if (!requireNamespace("sva", quietly = TRUE)){
  install.packages("sva")
}
library(sva)

if (!requireNamespace("devtools", quietly = TRUE)){
  install.packages("devtools")
}
library(devtools)

if (!requireNamespace("data.table", quietly = TRUE)){
  install.packages("data.table")
}
library(data.table)


###### Part I. Perform DESeq on un-adjusted feature counts data #####-------------------

# Required data
counts_data<-read.csv("~/Documents/GitHub/GFRN_Signature_Generation/DESeq2_Signature_Generation_Datasets/2023.GFP18_AKT_FeatureCounts.csv", header = T, row.names = 1)
colData<-read.csv("~/Documents/GitHub/GFRN_Signature_Generation/DESeq2_Signature_Generation_Datasets/2023.GFP18_AKT_annotations.csv", header = T, row.names = 1)

# Pre-filter counts data to keep rows where the sum of values in each row is greater than to 10
counts_data_f<-counts_data[rowSums(counts_data) > 10, ]
dim(counts_data)
dim(counts_data_f)

# Make sure row names in colData matches columns names in filtered counts data
all(colnames(counts_data_f) %in% rownames(colData))

# Construct a DESeqDataSet object 
dds<-DESeqDataSetFromMatrix(countData = counts_data_f,
                              colData = colData,
                              design = ~ Condition)
dds


# Set the factor level
dds$Condition <- relevel(dds$Condition, ref = "control")

# Run DESeq
dds<-DESeq(dds)

# Save the results from dds and explore
res<-results(dds)
res
summary(res)

# Return genes with p-adjusted < 0.05
res_0.05<-results(dds, alpha = 0.05)
summary(res_0.05)

# Returns many significant genes but confounding batch effects were not adjusted for
# This leads to unreliable signature generation 
# Need to perform ComBat-seq correction to remove unwanted variation

###### Part II. Perform DESeq on combat_seq adjusted data  #####-------------------
#Observe the difference in the number of genes that now have a p-adjusted value < 0.5

#combat-seq adjusted data for GFP18_AKT_FeatureCounts dataset  --> combat_expr (adjusted_data)
combat_expr<-read.csv("~/path/to/file.csv", header = T, row.names = 1)

# Make sure row names in colData matches columns names in filtered counts data
all(colnames(combat_expr) %in% rownames(colData))

# Construct a DESeqDataSet object 
dds_post<-DESeqDataSetFromMatrix(countData = combat_expr,
                            colData = colData,
                            design = ~ Condition)
dds_post


# Set the factor level
dds_post$Condition <- relevel(dds_post$Condition, ref = "control")

# Run DESeq
dds_post<-DESeq(dds_post)

# Save the results from dds and explore
res_post<-results(dds_post)
res_post
summary(res_post)

# Return genes with p-adjusted < 0.05
res_post0.05<-results(dds_post, alpha = 0.05)
summary(res_post0.05)

