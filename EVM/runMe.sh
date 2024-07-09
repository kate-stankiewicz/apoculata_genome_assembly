#!/bin/sh


#### PART 1 EVM
## partition genome by contig

#/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/partition_EVM_inputs.pl \
#--genome /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta \
#--gene_predictions ./input_gffs/gene_predictions.gff3 --protein_alignments ./input_gffs/AS_euk_exonerate.gff3 \
#--transcript_alignments ./input_gffs/pasa.gff3 \
#--segmentSize 100000 --overlapSize 10000 --partition_listing atrangia_partitions_list.out

## Generate the command list
#/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/write_EVM_commands.pl \
#--genome /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta \
#--weights /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/weights.txt \
#--gene_predictions /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/input_gffs/gene_predictions.gff3 \
#--protein_alignments /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/input_gffs/AS_euk_exonerate.gff3 \
#--transcript_alignments /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/EVM/input_gffs/pasa.gff3 \
#--output_file_name ast_evm.out  \
#--partitions atrangia_partitions_list.out > ast_commands.list

#### PART 2 EVM
## Combine partitions after you have run the jobs from above in parallel (using the script evm_run.sh)
#/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/recombine_EVM_partial_outputs.pl --partitions atrangia_partitions_list.out --output_file_name ast_evm.out

## convert output to GFF3 format
#/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/convert_EVM_outputs_to_GFF3.pl --partitions atrangia_partitions_list.out --output_file_name ast_evm.out \
#--genome /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta

#find . -regex ".*ast_evm.out.gff3" -exec cat {} \; > ast_EVM.all.gff3

#echo
#echo
#echo "*** Converted EVM output to GFF3 format: ast_EVM.all.gff3 ***"

## Convert GFF3 to protein

/gpfs/group/ibb3/default/tools/EVidenceModeler-1.1.1/EvmUtils/gff3_file_to_proteins.pl ./ast_EVM.all.gff3 /gpfs/group/ibb3/default/astrangia_genome/assembly_nanopore/final_assembly/ast_nanopore_scaffolds.masked.fasta > evm.out.fa

echo "*** Converted GFF3 format to predicted protein: evm.out.fa ***"
echo
echo "Done."

