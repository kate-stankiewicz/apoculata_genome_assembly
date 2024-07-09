#!/bin/bash
#PBS -l nodes=1:ppn=4
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N rn

cd $PBS_O_WORKDIR

#export PERL5LIB=/gpfs/group/ibb3/default/tools/perl/lib/perl5:/gpfs/group/ibb3/default/tools/perl/lib/x86_64-linux-thread-multi:$PERL5LIB
source activate funannotate
#/storage/work/khs18/funannotate/util/genemark_gtf2gff3.pl /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/genemark/genemark.gtf > genemark-ES.gff3

#validate that it will work for EVM
/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/gff3_gene_prediction_file_validator.pl genemark-ES.gff3 > check.out


