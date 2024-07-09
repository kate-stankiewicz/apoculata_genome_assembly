#!/bin/bash
#PBS -l nodes=1:ppn=5
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=10gb
#PBS -j oe
#PBS -N quast

cd $PBS_O_WORKDIR

conda activate py27

/storage/work/khs18/anaconda3/envs/py27/bin/rnaQUAST.py -c /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/transcriptome/rnaspades/spades_all/transcripts.fasta \
--busco_lineage /storage/home/khs18/scratch/busco/metazoa_odb10 -o ./rnaquast_res
