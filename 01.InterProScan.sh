# running interproscan in standalone mode on 
# requires that interproscan.properties are edited

module load python2

~/software/interproscan-5.18-57.0/interproscan.sh -dp -i /usit/abel/u1/mortema/MAKER/Symphodus_melops.maker.output/Symphodus_melops.all.maker.proteins.aed.1.0.fasta \
-f tsv,xml,gff3,html -appl Pfam -b /usit/abel/u1/mortema/MAKER/interproscan -iprlookup --goterms -mode standalone \
-T /usit/abel/u1/mortema/tmp

# 
iprscan2gff3

#
ipr_update_gff ../Symphodus_melops.maker.output/Symphodus_melops.all.gff.aed-1.0.gff interproscan.tsv >Symphodus_melops.all.gff.aed-1.0.wPFAM.gff

perl -lne 'print $1 if /\tmRNA\t.+ID=([^;]+).+Pfam(.+?);/ ' Symphodus_melops.all.gff.aed-1.0.wPFAM.gff >Symphodus_melops.all.gff.aed-1.0.only.PFAM.ids

# extract gene predictions with Pfam domains
../fgrep.pl -f Symphodus_melops.all.gff.aed-1.0.only.PFAM.ids Symphodus_melops.all.gff.aed-1.0.wPFAM.gff -d "=|;|,|:" >Symphodus_melops.all.gff.aed-1.0.onlyPFAM.gff
grep -w Pfam Symphodus_melops.all.gff.aed-1.0.onlyPFAM.gff >Pfam.genes
awk '{print $1"\t"$4"\t"$5"\t"$9}' Pfam.genes | sed 's/_//g' >Pfam.genes.bed

## calculate TajimasD
vcftools --gzvcf freebayes.SNPs.filtered.final.recode.intersect.edit.vcf --keep norway.id --out norway_50kb --TajimaD 50000

# assign genes a TajimaD value
