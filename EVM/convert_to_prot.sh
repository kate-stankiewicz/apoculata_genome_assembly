#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N evm_prot

cd $PBS_O_WORKDIR

/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/gff3_file_to_proteins.pl ./ast_EVM.all.gff3 ./ast_dovefinal.masked.simp.fasta
