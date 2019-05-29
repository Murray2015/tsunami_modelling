#!/bin/bash 

#SBATCH --nodes=1
#SBATCH --tasks-per-node=4
#SBATCH --cpus-per-task=1
#SBATCH --mem=10gb
#SBATCH --time=5:0
#SBATCH --mail-type=ALL
#SBATCH --qos=bbshort

###set -e

module purge
module load bluebear
module load bear-apps/2018b
module load Hypre/2.16.0-foss-2018b

###sed "s/PX = 5/PX = ${cores}/g" input_backup.txt > input.txt
sed "s/PX = 5/PX = 2/g" input_backup.txt > input.txt
sed -i "s/PY = 1/PY = 2/g" input.txt
cd $SLURM_SUBMIT_DIR
export OMP_NUM_THREADS=1

mpirun ./nhwave
#./nhwave
