#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N spades

cd $PBS_O_WORKDIR

#/gpfs/group/ibb3/default/tools/SPAdes-3.14.0-Linux/bin/rnaspades.py -s /storage/home/khs18/scratch/Astrangia_Raw_Reads/trinity_all_apo_norm/all_runs_apo_norm.fq -t 16 --memory 900 -o ./spades_all
#/gpfs/group/ibb3/default/tools/SPAdes-3.14.0-Linux/bin/rnaspades.py -s /storage/home/khs18/scratch/Astrangia_Raw_Reads/trinity_all_apo/all_apo_only.fastq -t 10 --memory 900 -o ./spades_all_nn
/gpfs/group/ibb3/default/tools/SPAdes-3.14.0-Linux/bin/rnaspades.py --continue -o ./spades_all_nn
