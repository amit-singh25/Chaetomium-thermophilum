library(readxl)
library(DT)
library(AnnotationForge)
library(DBI)
library(RSQLite)

y<- read_excel("~/Downloads/Raw_data.xlsx")
#View(y)
#t<-datatable(y1, filter = 'top', options = list(
#pageLength = 20, autoWidth = TRUE))
#DT::saveWidget(t, 'ChaetomiumLookup.html')
#y1<-y[,c(1:3,5,6,8:11,15:20)]

fSym<-y[,c(1,2,18)]
fSym <- fSym[fSym[,1]!="-",]
fSym <- fSym[fSym[,2]!="-",]
colnames(fSym) <- c("GID","TranscriptID","OldTranscript")
####
fChr <- y[,c(1,15:17,3,6,19,20)]
fChr <- fChr[fChr[,1]!="-",]
colnames(fChr) <- c("GID","CHROMOSOME","Coordinates","Strand","Transcript_length","CPC2_label", "Class_code","Isoform_group")
####
#fEC <-y 
####
fGO<-read.delim("~/Desktop/GOTable.txt")
fGO <- fGO[fGO[,3]!="",]
fGO <- fGO[fGO[,2]!="",]
###GID has to be vector 
fGO$GID <- as.vector(fGO$GID)
colnames(fGO) <- c("GID","GO","EVIDENCE")


makeOrgPackage(gene_info=fSym, chromosome=fChr,go=fGO,
               version="0.1",
               maintainer="Amit Singh <amit.singh@bzh.uni-heidelberg.de>",
               author="Amit Singh <amit.singh@bzh.uni-heidelberg.de>",
               outputDir = ".",
               tax_id="209285",
               genus="Chaetomium",
               species="thermophilum",
               goTable="go")


##install.packages("org.Cthermophilum.eg.db", repos=NULL)

               
