#!/bin/bash
#SBATCH --mail-type=ALL
#SBATCH --mail-user=stephen.krewson@yale.edu
#SBATCH -p gpu
#SBATCH -c 10
#SBATCH --mem-per-cpu=12g
#SBATCH -t 5:00:00
#SBATCH --gres=gpu:2
#SBATCH --gres-flags=enforce-binding

# was using -n instead of -c! (use squeue to check computer nodes)
# to check versions: module spider Matlab

module purge
module restore cuda
source deactivate
source activate maskRCNN

# trying with illustrations dataset...
python balloon.py train --dataset=../../datasets/illustrations --weights=coco

