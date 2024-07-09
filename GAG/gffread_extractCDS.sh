#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N gffread

cd $PBS_O_WORKDIR
DIR=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore

/storage/work/khs18/anaconda3/bin/gffread ${DIR}/GAG/gag_annotation_fixed/apoculata_v2.0.gff3 -x apoculata_cds_v2.0.fasta -g ${DIR}/final_assembly/ast_nanopore_scaffolds.masked.fasta

