#!/bin/bash
#PBS -l nodes=1:ppn=8
#PBS -l walltime=10:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N evm

cd $PBS_O_WORKDIR

# run EVM
./runMe.sh
