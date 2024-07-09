#!/bin/bash
#PBS -l nodes=1:ppn=20:himem
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=10gb
#PBS -j oe
#PBS -N pasa_2

cd $PBS_O_WORKDIR

PASAHOME=/storage/work/khs18/anaconda3/opt/pasa-2.3.3
GENOME=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta
PASA_ONE_DIR=/gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/PASA/decon_PASA

#check evm output
#$PASAHOME/misc_utilities/pasa_gff3_validator.pl /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/ast_EVM.all.gff3

#run PASA on masked genome 
#$PASAHOME/Launch_PASA_pipeline.pl \
#-c alignAssembly.config -C -R \
#-g $GENOME -t $PASA_ONE_DIR/decon_transcripts.fasta.clean.transdecoder.cds \
#-T -u $PASA_ONE_DIR/decon_transcripts.fasta --ALIGNERS gmap,blat --CPU 40

#load current annotations
#$PASAHOME/scripts/Load_Current_Gene_Annotations.dbi -c alignAssembly.config \
#-g $GENOME -P /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/ast_EVM.all.gff3

#run the comparison 
#$PASAHOME/Launch_PASA_pipeline.pl -c annotCompare.config -A \
#-g $GENOME \
#-t $PASA_ONE_DIR/decon_transcripts.fasta.clean --CPU 8

#run the comparison again with the output from above 
#$PASAHOME/Launch_PASA_pipeline.pl -c annotCompare.config -A -L --annots decon_ast_spadesTRNA_db.sqlite.gene_structures_post_PASA_updates.70130.gff3 \
#-g $GENOME \
#-t $PASA_ONE_DIR/decon_transcripts.fasta.clean --CPU 20

#change the name of the gff3 file, not a batch job 
#mv decon_ast_spadesTRNA_db.sqlite.gene_structures_post_PASA_updates.50835.gff3 evm_update2.gff3

#convert to protein using utility script from PASA
#$PASAHOME/scripts/Coding/util/gff3_file_to_proteins.pl ./evm_update2.gff3 $GENOME prot > evm_update2.pep

#remove all characters after the first space in the headers 
sed 's/ .*//' evm_update2.pep > evm_update2.fasta

#Count the number of predicted gene models:
#grep -c ">" evm_update2.fasta

#remove lines with pasa update information and sequences
sed '/^# ORIGINAL/ d' evm_update2.gff3 > test.gff3
sed '/^# PASA_UPDATE/ d' test.gff3 > test2.gff3
sed '/^#PROT/ d' test2.gff3 > test3.gff3
mv test3.gff3 evm_update2_clean.gff3

#cp evm_update2.fasta ../blast/astrangia_v1_proteins.fasta
