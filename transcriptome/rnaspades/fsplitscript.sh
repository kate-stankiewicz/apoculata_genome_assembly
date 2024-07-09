#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=80gb
#PBS -j oe
#PBS -N Astrsplit

cd $PBS_O_WORKDIR

/gpfs/group/ibb3/default/tools/exonerate-2.2.0-x86_64/bin/fastasplit -f ./spades_all/transcripts.fasta -o ./transcript_split -c 4

