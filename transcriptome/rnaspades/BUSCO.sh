#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N bus

cd $PBS_O_WORKDIR

conda activate busco

/storage/work/khs18/anaconda3/envs/busco/bin/busco -i /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/transcriptome/rnaspades/spades_all/transcripts.fasta -o busc_norm_spades -l /storage/home/khs18/scratch/busco/metazoa_odb10 -m transcriptome -c 10
