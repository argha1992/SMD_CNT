#!/bin/sh
prev_step="cnt_unk_dppc_min" # Initial step

for step in 6.1 6.2 6.3 6.4 6.5 6.6 6.7; do
    gmx_mpi grompp -f step${step}_equilibration.mdp -o step${step}_equilibration.tpr -c ${prev_step}.gro -r ${prev_step}.gro -n index.ndx -p topol.top -maxwarn -1

    gmx_mpi mdrun -v -pin on -deffnm step${step}_equilibration &> step${step}_equilibration.log

    # tail -f step${step}_equilibration.job

    prev_step="step${step}_equilibration"
done
