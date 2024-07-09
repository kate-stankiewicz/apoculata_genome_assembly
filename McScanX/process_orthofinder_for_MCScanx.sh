#step 1: use dos2unix to process file if you ran the R script locally on a windows (if not, skip this)
dos2unix orthogroups_for_mcscan_apoc_palm.txt

#step 2: change from comma delim to tab, this is your homology file for MCScanX
sed 's/\,/\t/g' orthogroups_for_mcscan_apoc_palm.txt > as_ap.homology

#step 3: pull out features of interest from gff files
awk '$3 == "mRNA"' apoculata_v2.0.gff3 > apoc_mrna.gff
awk '$3 == "mRNA"' Apalm_assembly_v2.0_180910.gff3 > apalm_mrna.gff

#step 4: cut out the columns of interest from the gff file (different for each file)
cut -f1,4,5,9 apoc_mrna.gff | cut -d ";" -f1 | sed 's/ID=//g' | sed 's/^chromosome_/AS/g' | awk 'BEGIN {FS="\t"; OFS="\t"} {print $1, $4, $2, $3}' > ast_mcscanx.gff
cut -f1,4,5,9 apalm_mrna.gff | cut -d ";" -f1 | sed 's/ID=//g' | sed 's/^[^_]*_//' | sed 's/^[^_]*_//' | sed 's/HRSCAF_/AP/' |  awk 'BEGIN {FS="\t"; OFS="\t"} {print $1, $4, $2, $3}' > ap_mcscanx.gff

#step 5: concatenate the two gffs
cat ast_mcscanx.gff ap_mcscanx.gff > as_ap_mcscan.gff

#step 6: get list of features to inlude from the homology file
cut -f 1 as_ap.homology > apoc_genes_list
cut -f 2 as_ap.homology > apalm_genes_list
cat apoc_genes_list apalm_genes_list | sort | uniq > genes_list_apoc_apalm_sorted.txt

#step 7: filter the gff file by the gene list from the homology file (evidently you don't need to do this)
awk -F '\t' 'FNR==NR{a[$2]=$0;next}{if(b=a[$1]){print b}}' OFS='\t' as_ap_mcscan.gff genes_list_apoc_apalm_sorted.txt > as_ap.gff


#done!
#your final files for MCScanx_h are as_ap.gff and as_ap.homology
