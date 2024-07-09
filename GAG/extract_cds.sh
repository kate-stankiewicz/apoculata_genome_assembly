#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N aug_cds
#PBS -l feature=rhel7

cd $PBS_O_WORKDIR

conda deactivate

DIR=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore

/gpfs/group/ibb3/default/tools/augustus-3.2.3/scripts/getAnnoFasta.pl --seqfile=${DIR}/final_assembly/ast_nanopore_scaffolds.masked.fasta ${DIR}/GAG/gag_annotation_fixed/apoculata_v2.0.gff3


