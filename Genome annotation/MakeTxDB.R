rm(list=ls())
library(GenomicFeatures)
library(rtracklayer)
library(DBI)
setwd("~/Desktop/gtf_data")
#txdb<-makeTxDbFromGFF(file="Neurospora_crassa.NC12.39.gtf", format="gtf")
####creat txdb object from gtf
txdb <-makeTxDbFromGFF("Chaetomium-thermophilum.gtf",dataSource ="~/Desktop/gtf_data",
                       organism = "Chaetomium")

con <- dbconn(txdb)
DBI::dbGetQuery(con, "INSERT INTO metadata VALUES ('Resource URL', 'https://www.bzh.uni-heidelberg.de/');")
makeTxDbPackage(txdb,
                version="1.0.0",
                maintainer="Amit.singh <amit.singh@bzh.uni-heidelberg.de>",
                author="Amit.singh",
                destDir="~/Desktop/gtf_data",
                license="Artistic-2.0",
                pkgname="TxDb.Chaetomium.ct39.knownGene")
                
   
