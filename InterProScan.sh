# running interproscan on abel.uio.no

srun --mem-per-cpu=2G --time=04:00:00 --account=cees \
~/software/interproscan-5.18-57.0/interproscan.sh \
-dp -i test_genome.all.maker.proteins.fasta -f tsv \
-b /usit/abel/u1/mortema/genome/test_genome.maker.output/interproscan \
--goterms 
-T /usit/abel/u1/mortema/tmp
