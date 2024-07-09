#!/bin/bash
#PBS -l nodes=1:ppn=20:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=20gb
#PBS -j oe
#PBS -N pasa_ast

cd $PBS_O_WORKDIR

PASAHOME=/storage/work/khs18/anaconda3/opt/pasa-2.3.3

#Step 1
#clean the transcriptome file
#$PASAHOME/bin/seqclean ./transcripts.fasta

#########################################################################

#Step 2
#now launch PASA. Run this as a separate batch job after cleaning is done
$PASAHOME/Launch_PASA_pipeline.pl \
     -c /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/PASA/alignAssembly.config -C -R \
     -g /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/PASA/ast_nanopore_scaffolds.masked.fasta \
     -t /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/PASA/transcripts.fasta.clean -T \
     -u /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/PASA/transcripts.fasta \
     --ALIGNERS gmap,blat --CPU 20
