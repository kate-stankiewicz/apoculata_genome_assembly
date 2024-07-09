#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=80gb
#PBS -j oe
#PBS -N Astrsplit

cd $PBS_O_WORKDIR

/gpfs/group/ibb3/default/tools/exonerate-2.2.0-x86_64/bin/fastasplit -f /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/GAG/gag_annotation_fixed/apoculata_proteins_v2.0.fasta -o /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/blast/chunks -c 150

#Trying old exonerate version because 2.4 is working strangely
