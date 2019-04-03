library("edgeR")
raw.deseq.data <- all.data[,2:ncol(all.data)]
rownames(raw.deseq.data) <- all.data$gene
head(raw.deseq.data)
rnaseqMatrix <- raw.deseq.data
col_ordering = c(1,2,3,4,5,6,7,8)
rnaseqMatrix = round(rnaseqMatrix)
rnaseqMatrix = rnaseqMatrix[rowSums(rnaseqMatrix)>=8,]

conditions = factor(c(rep("gut", 1),rep("muscle", 1), rep("skin", 1), rep("spleen", 1), rep("liver",1), rep("ovary", 1), rep("testis",1), rep("brain",1)))
exp_study = DGEList(counts=rnaseqMatrix, group=conditions)

exp_study = calcNormFactors(exp_study)
#the default method for computing scaling factors uses a trimmed mean of M-values (TMM) between each pair of samples. 

exp_study = estimateCommonDisp(exp_study)
exp_study = estimateTagwiseDisp(exp_study)
et = exactTest(exp_study)

# exp_study contains the normalized counts that can be plotted at MDS, BCV plots 

#you can extract cpm from the exp_study here, as follows 

log2-transform to be able to show as heat map 

logcpm <- cpm(exp_study, prior.count=2, log=TRUE)

