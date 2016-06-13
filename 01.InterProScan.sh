# running interproscan in cluster mode on abel.uio.no
# requires that interproscan.properties are edited to srun

module load python2

srun --mem-per-cpu=4G --time=04:00:00 --account=cees --cpus-per-task=8 --ntasks=1 \
~/software/interproscan-5.18-57.0/interproscan.sh \
-dp -i test_genome.all.maker.proteins.fasta -f tsv,xml,gff3,html \
-b /usit/abel/u1/mortema/genome/test_genome.maker.output/interproscan \
--goterms -mode cluster -clusterrunid interproscan \
-T /usit/abel/u1/mortema/tmp

