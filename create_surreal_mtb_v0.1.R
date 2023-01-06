########################################
# Developer Andrea Ghelfi
# 2023.01.06
# Script to create Surreal-MetaboBank
########################################
library(concatenate)
system("cp metabobank/head_surreal.b9 metabobank/mtb2surreal.sql")
mtb <- read.table("metabobank/metabobank_dblink.csv", header = F, sep=",")
colnames(mtb) <- c("mtb", "biosample", "bioproject", "status")
list <- unique(mtb$mtb)
len_list <- length(list)
for(i in 1:len_list){
  entry <- list[i]
  biosample_id <- unique(mtb[mtb$mtb == entry,'biosample'])
  biosample_id <- paste("biosample:", biosample_id, sep="")
  biosample_id <- cc(biosample_id)
  bioproject_id <- unique(mtb[mtb$mtb == entry,'bioproject'])
  bioproject_id <- paste("bioproject:", bioproject_id, sep="")
  status <- unique(mtb[mtb$mtb == entry,'status'])
  line <- paste("UPDATE mtb:",entry," CONTENT { id: mtb:",entry, ", biosample_id: [", biosample_id, "], bioproject_id: [", bioproject_id,"], status:\'", status,"\' };", sep="")
  write.table(line, "metabobank/mtb2surreal.sql", row.names=F, col.names=F, sep="", quote=F, append =T)
}
line <- "COMMIT TRANSACTION;"
write.table(line, "metabobank/mtb2surreal.sql", row.names=F, col.names=F, sep="", quote=F, append =T)
