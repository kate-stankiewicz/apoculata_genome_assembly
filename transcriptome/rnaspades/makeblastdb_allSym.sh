#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=1:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N db

/gpfs/group/ibb3/default/tools/ncbi-blast-2.6.0+/bin/makeblastdb -in ~/scratch/symPep.fasta -dbtype prot
