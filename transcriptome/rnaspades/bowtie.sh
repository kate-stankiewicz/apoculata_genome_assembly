#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N bowt

cd $PBS_O_WORKDIR
conda activate base

#step 1: index transcriptome
#bowtie2-build ./spades_all/transcripts.fasta ./spades_all/transcripts.fasta

#step 2: align the reads
bowtie2 -p 10 -q --no-unal -k 20 -x ./spades_all/transcripts.fasta -U /storage/home/khs18/scratch/Astrangia_Raw_Reads/trinity_all_apo_norm/all_runs_apo_norm.fq 2>align_stats.txt| samtools view -@10 -Sb -o spades_bowtie2.bam
