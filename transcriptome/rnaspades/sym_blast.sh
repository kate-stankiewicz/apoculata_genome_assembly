#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N sblast

cd $PBS_O_WORKDIR

mkdir -p blast_res

for num in 0 1 2 3; do
/gpfs/group/ibb3/default/tools/ncbi-blast-2.6.0+/bin/blastx -query ./transcript_split/transcripts.fasta_chunk_000000${num} \
-db /storage/home/khs18/scratch/symPep.fasta -evalue 1e-20 -max_target_seqs 1 -num_threads 10 \
-outfmt 6  -out ./blast_res/sym_spades_blastx_${num}.out
done
