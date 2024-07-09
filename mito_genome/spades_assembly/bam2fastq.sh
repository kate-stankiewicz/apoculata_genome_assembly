#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N b2fq

cd $PBS_O_WORKDIR

module purge
module load gcc/8.3.1
module load samtools/1.5

#sort and convert from sam to bam
#samtools sort -n -O sam ast_align_84.sam | samtools fixmate -O bam - ast_align_84.fixmate.bam

#extract the fastq records
samtools fastq -1 mito_84_align_R1.fq -2 mito_84_align_R2.fq ast_align_84.fixmate.bam
