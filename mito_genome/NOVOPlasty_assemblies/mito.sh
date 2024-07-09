#!/bin/bash
#PBS -l nodes=1:ppn=3:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=300gb
#PBS -j oe
#PBS -N mito

cd $PBS_O_WORKDIR

perl /gpfs/group/ibb3/default/tools/NOVOPlasty/NOVOPlasty2.7.2.pl -c config.txt
