# Get the exons of hg19 

library("TxDb.Hsapiens.UCSC.hg19.knownGene")
txdb = TxDb.Hsapiens.UCSC.hg19.knownGene
gr =  as.data.frame( exons( txdb ) )
exons_df = data.frame(seqnames=seqnames(gr), starts=start(gr)-1, ends=end(gr), names=c(rep(".", length(gr))), scores=c(rep(".", length(gr))), strands=strand(gr))
write.table(exons_df, file="hg19_exons.tab", sep="\t", quote=F)
