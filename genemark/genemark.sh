#!/bin/bash
#PBS -l nodes=1:ppn=40:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N gm_ap

cd $PBS_O_WORKDIR

export PERL5LIB=/gpfs/group/ibb3/default/tools/perl/lib/perl5:/gpfs/group/ibb3/default/tools/perl/lib/x86_64-linux-thread-multi:$PERL5LIB

/storage/home/khs18/scratch/gm_et_linux_64/gmes_petap/gmes_petap.pl --ES --cores 40 --sequence /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta


