library(refGenome)
library('rtracklayer')
ens <- ensemblGenome()
setwd("~/Desktop/")
read.gtf(ens, "final_3_cuff_comp.annotated.gtf")
tableSeqids(ens)
tableFeatures(ens)
my_gene <- getGenePositions(ens)
length(my_gene$gene_id)
length(unique(my_gene$gene_id))
####
my_gene %>% group_by(seqid) %>% summarise(n())
# summarise features in GTF file
tableFeatures(ens)
# create table of genes
my_gene <- getGenePositions(ens)
dim(my_gene)
# gene IDs are unique
length(my_gene$gene_id)
length(unique(my_gene$gene_id))
####check the frequncey menaing that how many trancripts isoform that we see here.
as.data.frame(tableTranscript.id(ens))
# use dplyr to create more summaries
# number of genes on each seqname
my_gene %>% group_by(seqid) %>% summarise(n())
#A tibble: 7 x 2
####sleceted from seqname 
my_gene %>% filter(seqid == 2) %>% select(gene_id) %>% head()
table(my_gene$gene_biotype)
my_gene %>% group_by(seqid, gene_biotype) %>% summarise(count = n()) -> my_tally
ggplot(my_tally, aes(x = seqid, y = log2(count))) +
geom_bar(aes(fill = gene_biotype), stat = 'identity', position = 'dodge')

#### total gene 
genes = gtf@ev$genes[ ,c("gene_id","gene_name")]
#### extractseids
en1 <- extractSeqids(ens, "^1$")
####
my_file <- "Thermothelomyces_thermophila_atcc_42464.ASM22609v1.39.gtf"
my_obj <- import(my_file)        

