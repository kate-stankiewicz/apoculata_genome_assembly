#!/bin/bash
#PBS -l nodes=1:ppn=20:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=50gb
#PBS -j oe
#PBS -N count

cd $PBS_O_WORKDIR

conda deactivate
module purge
module load gcc/5.3.1
module load trinity/2.2.0

blast_dir=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/transcriptome/rnaspades/blast_res
fasta_dir=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/transcriptome/rnaspades/spades_all
db_dir=/gpfs/group/ibb3/default/Blast_Databases/BLASTX_nucleotide_to_protein_Database/Uniprot

/opt/aci/sw/trinity/2.2.0_gcc-5.3.1/util/analyze_blastPlus_topHit_coverage.pl ${blast_dir}/spades_blastx.out ${fasta_dir}/transcripts.fasta ${db_dir}/uniprot_sprot.fasta
