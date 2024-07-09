#get file of sequence lengths for each cds
cat apoculata_v2.cds.fasta | awk '$0 ~ ">" {if (NR > 1) {print c;} c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' > counts.txt

#filter sequence lengths by those that are divisible by 3 
awk -F'\t' '{if (!($2 %3 )) print}' counts.txt > filter_translatable.txt

#get ids of properly translatable cds 
cut -f 1 filter_translatable.txt > translatable_ids.txt

#filter fasta file to keep only these cds
seqkit grep -f translatable_ids.txt apoculata_cds_v2.0.fasta > translatable_cds.fasta

#get the ids of these translatable cds
grep ">" translatable_cds.fasta | sed 's/>//g' | sort -V > sorted_translatable_ids.txt 

#add a zero to the end of every line then keep only the basename, split isoform number (0..n) into its own column
sed 's/$/\.0/' sorted_translatable_ids.txt | sed 's/\.5f\(.*\)//' | sed 's/\(.*\)\./\1 /' > iso_labels.txt

#get the length of each each translatable cds
cat translatable_cds.fasta | awk '$0 ~ ">" {if (NR > 1) {print c;} c=0;printf substr($0,2,100) "\t"; } $0 !~ ">" {c+=length($0);} END { print c; }' | sort -V -k1 | cut -f2 lengths.txt

#paste each together to creater a filter table
paste -d ' ' sorted_translatable_ids.txt iso_labels.txt lengths.txt > table_filter.txt

#get the ids for the longest translatable isoform per gene
awk '$4 > maxvals[$2] {lines[$2]=$0; maxvals[$2]=$4} END { for (tag in lines) print lines[tag] }' table_filter.txt | cut -f1 -d ' ' > longest_iso_ids.txt

#filter the fasta by these ids
seqkit grep -f longest_iso_ids.txt apoculata_v2.cds.fasta > apoc_long_trans_cds.fasta
