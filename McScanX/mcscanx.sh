#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N mcscan

cd $PBS_O_WORKDIR

/storage/home/khs18/scratch/MCScanX/MCScanX_h /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/McScanX/xe_am_as/inputs/xe_am_as
