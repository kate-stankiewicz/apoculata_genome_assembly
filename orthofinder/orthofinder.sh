#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=10gb
#PBS -j oe
#PBS -N of

cd $PBS_O_WORKDIR

conda activate base

#/storage/work/khs18/anaconda3/bin/orthofinder -f /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/orthofinder/input_files/inputs_updated -t 8

#re run to estimate tree using msa instead
/storage/work/khs18/anaconda3/bin/orthofinder -fg /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/orthofinder/input_files/inputs_updated/OrthoFinder/Results_Dec03 -M msa -t 8
