#!/bin/bash
#PBS -l nodes=1:ppn=10:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=50gb
#PBS -j oe
#PBS -N wgd
#PBS -l feature=rhel7

conda activate wgd

cd $PBS_O_WORKDIR

FILE=apoc_long_trans_cds.fasta

#step 1:
#wgd mcl -s ${FILE} --cds --mcl

#step 2:
#wgd -v debug ksd --wm alc --pairwise wgd_blast/apoc_long_trans_cds.fasta.blast.tsv.mcl ${FILE}

#step 3:
#wgd syn -ks ./wgd_ksd/apoc_long_trans_cds.fasta.ks.tsv -f mRNA -a ID ../filtered/apoculata_v2.0.gff3 ./wgd_blast/apoc_long_trans_cds.fasta.blast.tsv.mcl

#visualize
wgd viz -ks ./wgd_ksd/apoc_long_trans_cds.fasta.ks.tsv,./wgd_syn/apoc_long_trans_cds.fasta.blast.tsv.mcl.ks_anchors.tsv -l full,anchors
