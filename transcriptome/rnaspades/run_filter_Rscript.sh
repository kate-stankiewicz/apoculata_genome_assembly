#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=10gb
#PBS -j oe
#PBS -N blast_filt

cd $PBS_O_WORKDIR

conda deactivate
Rscript filter_sym_blast.R
