#Pull out the best hits per database search
cat ./uniprot_results/uniprot_ast_all.out | sort -k1,1 -k12,12gr -k11,11g -k3,3gr | sort -u -k1,1 --merge > ./bestHits/uniprot_bestHits_ast
cat ./trembl_results/trembl_ast_all.out | sort -k1,1 -k12,12gr -k11,11g -k3,3gr | sort -u -k1,1 --merge > ./bestHits/trembl_bestHits_ast
cat ./ncbi_results/ncbi_ast_all.out | sort -k1,1 -k12,12gr -k11,11g -k3,3gr | sort -u -k1,1 --merge > ./bestHits/ncbi_bestHits_ast
