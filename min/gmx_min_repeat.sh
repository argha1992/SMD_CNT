#!/bin/bash

for ((i=1; i<=90; i++)); do
    echo "Iteration $i"
    gmx_mpi grompp -f min.mdp -c cnt_unk_dppc_min.gro -r cnt_unk_dppc_min.gro -o cnt_unk_dppc_min.tpr -p topol.top
    gmx_mpi mdrun -s cnt_unk_dppc_min.tpr -v -c cnt_unk_dppc_min.gro
done