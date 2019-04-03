#!/bin/bash
#SBATCH --job-name=Liv_T1F1
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=4
#SBATCH --mem=12gb
#SBATCH --time=120:00:00

module load bowtie
module load tophat
module load samtools
module load python

tophat2  --output-dir liv_T1F1 /data/moh034/salmon/salmon_ref Liver_TIFI_H3LW5DMXX_ATTACTCG-ATAGAGGC_CAT_R1.fastq.gz / Liver_TIFI_H3LW5DMXX_ATTACTCG-ATAGAGGC_CAT_R2.fastq.gz
cd liv_T1F1
samtools sort -@ ${SLURM_NTASKS} -n accepted_hits.bam -o accepted_hits_sorted.bam
samtools view -@ ${SLURM_NTASKS} accepted_hits_sorted.bam > accepted_hits_sorted.sam
python -m HTSeq.scripts.count -a 10 --stranded=reverse -r name accepted_hits_sorted.sam /data/moh034/salmon/Salmo_salar-annotation.gff3 > Liv_T1F1_reverse.counts

