#!/bin/bash
#PBS -l nodes=1:ppn=2
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N gag

cd $PBS_O_WORKDIR
module load python/2.7.14-anaconda5.0.1

#python /gpfs/group/ibb3/default/tools/GAG/gag.py --fasta  /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta \
#--gff /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/GAG/ast_sorted_evm_tRNA.gff3 \
#--anno out --out gag_annotation


python /gpfs/group/ibb3/default/tools/GAG/gag.py --fasta /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta \
--gff /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/GAG/ast_sorted_evm_tRNA.gff3 \
--fix_start_stop --out gag_annotation_fixed
