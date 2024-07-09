#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=100:00:00
#PBS -A ibb3_d_g_sc_default
#PBS -l mem=25gb
#PBS -j oe
#PBS -N evm_excute

cd $PBS_O_WORKDIR

module load gcc/5.3.1
module load parallel/20170522

parallel --jobs 10 < ast_commands.list


