### Chaetomium thermophilum 
The Chaetomium is a thermophilic filamentous fungus, having the ability to grow at 50 − 55◦ C. It produces different thermostable enzymes such as cellulase, xylanase, laccase, chitinases, and proteases. Due to the thermostability nature of C.thermophilum, various industries used this organism for starch degradation, hydrolysis of cellulose for bioethanol production as well as other applications requiring enzymatic activities at higher temperatures. Here we presented an analysis pipeline to build transcriptome assemblies in order to proper annotate the untranslated regions (UTRs), and subsequently intron-exon organization structures using deep RNA sequencing data. The genomic and transcriptomic sequence data is often interpreted by functional annotation through Gene Ontology (GO) database. Here, we created an R Package for the gene as well as GO annotation which can be found in the below links. Additionally, we created a lookup file which contains genomic features, gene id corresponding to GO term, and Enzyme Commission number (EC) which can be useful in an industrial application as well as basic research on C.thermophilum.
#### Software used for the analysis

1. [Ensemble genome (version 2.8)](https://fungi.ensembl.org) 
2. [FastQC (Version:0.11.5](https://www.bioinformatics.babraham.ac.uk/projects/fastqc/)
3. [HISAT2 (Version:1.3.3b)](http://daehwankimlab.github.io/hisat2/)
4. [Stringtie (v1.3.4 release)](https://ccb.jhu.edu/software/stringtie/)
5. [GffCompare (Version:v0.10.1)](https://ccb.jhu.edu/software/stringtie/gffcompare.shtml)
6. [CPC2](http://cpc2.gao-lab.org/)
7. [dc-mega BLAST (Version:2.7.1+)](https://blast.ncbi.nlm.nih.gov/)
8. [Blast2GO (Version 5.1.1)](http://docs.blast2go.com/)
9. [blastx.](https://blast.ncbi.nlm.nih.gov/)
10. [T-Coffee](http://tcoffee.crg.cat/)
11. [phyloT](https://phylot.biobyte.de/)
12. [pyfaidx python package](https://pypi.org/project/pyfaidx/)

#### Brief description of genome annotation pipeline 

The data quality assessment of raw sequence data was checked using FastQC. 
The reference genome of Chaetomium thermophilum was downloaded from the Ensemble genome browser and the raw reads were mapped to C.thermophilum reference genome using HISAT2 aligner. 
StringTie uses a novel network flow algorithm as well as an optional de novo assembly step to assemble and quantitate full-length transcripts representing multiple splice variants for each gene locus. Therefore, mapped reads were further assembled separately using StringTie. Each assembled separate file was merged/union, thus reported as once in the combined.gtf output. 
This program is used to compare, merge, annotate and estimate the accuracy of one or more query files when compared with a reference annotation. The Gffcompare output reports various statistics related to the “accuracy” of the input transcripts when compared to reference annotation data. 

The accuracy is calculated at various levels such as nucleotide, exon, intron, transcript, the gene for each input file. GffCompare tracks a "class code" value showing the relationship between a transfrag and the closest reference transcript of combined.gtf evaluating transcript discovery accuracy.

According to the gffcompare class codes "i", "u", "y" and "x" are considered as novel transcriptional loci. Further, to know and annotate these obtained novel transcriptional as coding or non-coding CPC2 was used to calculate.

To create the isoform annotation of novel transcriptional loci, we looked at the longest non-reverse ORF containing both start and stop codon and grouped them and search for sequence similarities score >49-60 are annotated as a transcript isoform. pyfaidx and T-Coffee used to acesses this score. 

The sequence conservation analysis was performed using dc-mega BLAST among six different. Here we used all transcript (coding and non-coding).

Additionally, functional annotation such as "Enzyme Commission numbers" and "Go term" of C.thermophilum transcripts were analyzed using Blast2GO and local blastx. 

