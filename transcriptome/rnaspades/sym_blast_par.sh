#!/bin/bash
#PBS -l nodes=1:ppn=16
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=20gb
#PBS -j oe
#PBS -N sblast

cd $PBS_O_WORKDIR

module load gcc/5.3.1 
module load parallel/20170522

mkdir -p blast_res

parallel -j 4 'FASTA={}; /gpfs/group/ibb3/default/tools/ncbi-blast-2.6.0+/bin/blastx -query $FASTA -db /storage/home/khs18/scratch/symPep.fasta -num_threads 4 -evalue 1e-20 -max_target_seqs 1 -outfmt 6 -out ./blast_res/${FASTA##*/}_sym.blast' ::: ./transcript_split/transcripts.fasta_*

