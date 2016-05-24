# running interproscan on abel.uio.no

module load python2

srun --mem-per-cpu=4G --time=04:00:00 --account=cees \
~/software/interproscan-5.18-57.0/interproscan.sh \
-dp -i test_genome.all.maker.proteins.fasta -f tsv \
-b /usit/abel/u1/mortema/genome/test_genome.maker.output/interproscan \
--goterms -mode cluster -clusterrunid interproscan\
-T /usit/abel/u1/mortema/tmp
