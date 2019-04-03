setwd("~/Desktop/salmon_counts")
samples <- c("T1F1","T1F2","T1F3","T1F4","T2F1","T2F2","T2F3","T2F4","T3F1","T3F2","T3F3","T3F4","T4F1","T4F2","T4F3","T4F4")

#read.sample is a function to read count files produced by HTSeq
read.sample <- function(sample.name) {
  file.name <- paste(sample.name, ".counts", sep="")
  result <- read.delim(file.name, col.names=c("gene", "count"), sep="\t", colClasses=c("character", "numeric"))
}

sample.1 <- read.sample(samples[1])
head(sample.1)
sample.2 <- read.sample(samples[2])
sample.3 <- read.sample(samples[3])
sample.4 <- read.sample(samples[4])
sample.5 <- read.sample(samples[5])
sample.6 <- read.sample(samples[6])
sample.7 <- read.sample(samples[7])
sample.8 <- read.sample(samples[8])
sample.9 <- read.sample(samples[9])
sample.10 <- read.sample(samples[10])
sample.11 <- read.sample(samples[11])
sample.12 <- read.sample(samples[12])
sample.13 <- read.sample(samples[13])
sample.14 <- read.sample(samples[14])
sample.15 <- read.sample(samples[15])
sample.16 <- read.sample(samples[16])

nrow(sample.1) == nrow(sample.2)
all(sample.1$gene == sample.2$gene)

all.data <- sample.1
all.data <- cbind(sample.1, sample.2$count, sample.3$count, sample.4$count, sample.5$count, sample.6$count, sample.7$count,sample.8$count,sample.9$count, sample.10$count, sample.11$count, sample.12$count, sample.13$count, sample.14$count,sample.15$count, sample.16$count)
head(all.data)
tail(all.data)
all.data <- all.data[1:(nrow(all.data)-5),]
head(all.data)
colnames(all.data) <- samples
