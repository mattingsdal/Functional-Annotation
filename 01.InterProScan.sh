# running interproscan in standalone mode on 
# requires that interproscan.properties are edited

module load python2

~/software/interproscan-5.18-57.0/interproscan.sh -dp -i /usit/abel/u1/mortema/MAKER/Symphodus_melops.maker.output/Symphodus_melops.all.maker.proteins.aed.1.0.fasta \
-f tsv,xml,gff3,html -appl Pfam -b /usit/abel/u1/mortema/MAKER/interproscan -iprlookup --goterms -mode standalone \
-T /usit/abel/u1/mortema/tmp

# 
iprscan2gff3

#
ipr_update_gff

#
