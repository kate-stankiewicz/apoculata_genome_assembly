#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N convert_exon

cd $PBS_O_WORKDIR

#convert exonerate output to EVM format
/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/misc/Exonerate_to_evm_gff3.pl AS_exon_euk_all.fasta > AS_euk_exonerate.gff3
