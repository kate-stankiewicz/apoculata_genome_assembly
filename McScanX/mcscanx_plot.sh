#!/bin/bash
#PBS -l nodes=1:ppn=10
#PBS -l walltime=48:00:00
#PBS -A open
#PBS -l mem=100gb
#PBS -j oe
#PBS -N mcscan

cd $PBS_O_WORKDIR

 java circle_plotter -g ../../apoculata_synteny/ap_am/ap_am.gff -s ../../apoculata_synteny/ap_am/ap_am.collinearity -c ../../apoculata_synteny/ap_am/ap_am.ctl -o ap_am.png
