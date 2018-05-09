# Associate transcripts to genes
# This script makes data frame containing transcript_id , gene_id, gene_name from gencode annotation gtf file 
# target_id,ens_gene,ext_gene

suppressPackageStartupMessages({
	library( rtracklayer )
	library( tidyverse )
	});

hg19gtf = rtracklayer::readGFFAsGRanges("gencode.v28lift37.basic.annotation.gtf")

hg19gtf_df = as.data.frame(hg19gtf )

hg19gtf_df_ss = hg19gtf_df %>% dplyr::select( 10, 11, 12, 18 )
get_these_columns = c("gene_id", "gene_type", "gene_name")]
hg19gtf_df_tr_gid = hg19gtf_df[ get_these_columns ]
hg19gtf_df_tr_gid_clean = hg19gtf_df_tr_gid[hg19gtf_df_tr_gid$transcript_id != "NA", ] %>% unique

write.table(hg19gtf_df_tr_gid_clean, "hg19gtf_df_tr_gid_clean.csv", sep="\t", row.names=F)

# these are not required
write.table(hg19gtf_df_tr_gid, "hg19gtf_df_tr_gid.csv", sep="\t",  row.names=F)
write.table(hg19gtf_df_ss, "hg19gtf_df_ss.csv", sep="\t",  row.names=F)
write.table(hg19gtf_df, "hg19gtf_df.csv", sep="\t",  row.names=F)
