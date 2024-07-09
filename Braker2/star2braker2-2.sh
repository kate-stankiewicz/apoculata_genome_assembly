#!/bin/bash
#PBS -l nodes=1:ppn=20:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=50gb
#PBS -j oe
#PBS -N star3

cd $PBS_O_WORKDIR

#export PERL5LIB=/gpfs/group/ibb3/default/tools/perl/lib/perl5:/gpfs/group/ibb3/default/tools/perl/lib/x86_64-linux-thread-multi:$PERL5LIB
#export AUGUSTUS_CONFIG_PATH=/gpfs/group/ibb3/default/tools/augustus-3.2.3/config
export GENEMARK_PATH=/storage/home/khs18/scratch/gm_et_linux_64/gmes_petap
#export SAMTOOLS_PATH=/gpfs/group/ibb3/default/tools/samtools-1.4

DIR=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly
WD=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/Braker2

module purge
module load gcc/5.3.1
module load bamtools/2.4.1

#create genome index
#/gpfs/group/ibb3/default/tools/STAR/bin/Linux_x86_64/STAR --runThreadN 20 --runMode genomeGenerate \
#--genomeDir $DIR \
#--genomeSAindexNbases 13 \
#--genomeFastaFiles $DIR/ast_nanopore_scaffolds.masked.fasta

# Map the reads
#/gpfs/group/ibb3/default/tools/STAR/bin/Linux_x86_64/STAR --runThreadN 20 \
#--genomeDir $DIR \
#--outSAMtype BAM Unsorted --twopassMode Basic --outFileNamePrefix ./all_apo_no_norm \
#--readFilesIn /storage/home/khs18/scratch/Astrangia_Raw_Reads/trinity_all_apo/all_apo_only.fastq 

#sort the bam files
#/gpfs/group/ibb3/default/tools/samtools-1.9/samtools sort \
#-m 50G -o $WD/all_apo_no_normAligned.out.sort.bam \
#-T $WD/ast_nn_tmp \
#--threads 1 $WD/all_apo_no_normAligned.out.bam

#BRAKER
/storage/work/khs18/anaconda3/bin/braker.pl \
--species=Astrangia_poculata \
--genome=$DIR/ast_nanopore_scaffolds.masked.fasta \
--bam=$WD/all_apo_no_normAligned.out.sort.bam \
--cores=20 \
--geneMarkGtf=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/genemark/genemark.gtf \
--softmasking \
--workingdir=$WD/braker2_res2
