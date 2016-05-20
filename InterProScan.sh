#!/bin/bash

# Job name:
#SBATCH --job-name=Testinterpro
#
# Project:
#SBATCH --account=cees
#
# Wall clock limit:
# Max memory usage:
#SBATCH --mem-per-cpu=4G
#SBATCH --time=00:12:00
## Set up job environment
source /cluster/bin/jobsetup
module load interproscan

## Copy input files to the work directory:
cp /usit/abel/u1/mortema/genome/test_genome.maker.output/test_genome.all.maker.proteins.fasta $SCRATCH

## Do some work:
cd $SCRATCH
interproscan.sh -dp -i test_genome.all.maker.proteins.fasta -f tsv -b ~/resultr3 -T /tmp/
