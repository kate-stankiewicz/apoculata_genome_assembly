#!/bin/bash
#PBS -l nodes=1:ppn=7
#PBS -l walltime=1000:00:00
#PBS -A ibb3_d_g_sc_default
#PBS -l mem=100gb
#PBS -j oe
#PBS -N exon

cd $PBS_O_WORKDIR

module purge
module load gcc/5.3.1
module load parallel/20170522

cd /storage/home/khs18/scratch/exonerate/

ls *.fasta | parallel -j 7 '/gpfs/group/ibb3/default/tools/exonerate_2.4.0/bin/exonerate -Q protein -T dna --model p2g --showvulgar no --showalignment no --showquerygff yes --showtargetgff yes --percent 80 --ryo "AveragePercentIdentity: %pi\n" --softmasktarget yes --softmaskquery no -q /gpfs/group/ibb3/default/genome_annotation/exonerate/uniprot-eukaryotes.fasta -t {} --targetchunkid 1 --targetchunktotal 14 >> /storage/home/khs18/scratch/exonerate/out/AS_euk_{}.out'

