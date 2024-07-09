#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=10gb
#PBS -j oe
#PBS -N sym_filt

cd $PBS_O_WORKDIR

conda activate base

# take just the first column of transcript IDs from the filtered sym blast file ( cut -d " " -f 1 filtered_sym_blast.txt > sym_hit_transcriptIDs.txt) and use this with seqkit to filter transcriptome
seqkit grep -v -f ./sym_hit_transcriptIDs.txt /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/transcriptome/rnaspades/spades_all/transcripts.fasta > decon_transcripts.fasta
