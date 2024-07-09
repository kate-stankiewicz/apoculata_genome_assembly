#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=50gb
#PBS -j oe
#PBS -N bwa

cd $PBS_O_WORKDIR

# first index the mito genome
#/gpfs/group/ibb3/default/tools/bwa index /storage/home/khs18/scratch/spades_mito_assembly/ref_genome/Adig_mito_KF448535.1.fasta

#next map the reads
/gpfs/group/ibb3/default/tools/bwa mem /storage/home/khs18/scratch/spades_mito_assembly/ref_genome/Adig_mito_KF448535.1.fasta /storage/home/khs18/scratch/ast_gen_reads_4mito/r1_84/DTG-SG-84.trimmed.R1.fastq /storage/home/khs18/scratch/ast_gen_reads_4mito/r1_84/DTG-SG-84.trimmed.R2.fastq > ast_align_84.sam
/gpfs/group/ibb3/default/tools/bwa mem /storage/home/khs18/scratch/spades_mito_assembly/ref_genome/Adig_mito_KF448535.1.fasta /storage/home/khs18/scratch/ast_gen_reads_4mito/r1_84/DTG-SG-52_R1_001.trimmed2.fastq /storage/home/khs18/scratch/ast_gen_reads_4mito/r1_84/DTG-SG-52_R2_001.trimmed2.fastq > ast_align_52.sam
