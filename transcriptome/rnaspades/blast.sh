#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N blast

cd $PBS_O_WORKDIR

mkdir -p blast_res

/gpfs/group/ibb3/default/tools/ncbi-blast-2.6.0+/bin/blastx -query ./spades_all/transcripts.fasta \
-db /gpfs/group/ibb3/default/Blast_Databases/BLASTX_nucleotide_to_protein_Database/Uniprot/uniprot -evalue 1e-20 -max_target_seqs 1 -num_threads 10 \
-outfmt 6  -out ./blast_res/spades_blastx.out

