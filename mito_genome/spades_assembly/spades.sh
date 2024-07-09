#!/bin/bash
#PBS -l nodes=1:ppn=1
#PBS -l walltime=400:00:00
#PBS -A ibb3_d_g_sc_default
#PBS -l mem=120gb
#PBS -j oe
#PBS -N spades

cd $PBS_O_WORKDIR

/gpfs/group/ibb3/default/tools/SPAdes-3.14.0-Linux/bin/spades.py --careful --pe1-1 ./mito_52_align_R1.fq --pe1-2 ./mito_52_align_R2.fq --pe2-1 ./mito_84_align_R1.fq --pe2-2 ./mito_84_align_R2.fq -o ast_mito_spades
