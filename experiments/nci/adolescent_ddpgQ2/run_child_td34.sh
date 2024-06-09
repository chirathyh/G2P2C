#!/bin/bash
#PBS -P sj53
#PBS -q gpuvolta
#PBS -l walltime=48:00:00
#PBS -l mem=24GB
#PBS -l jobfs=0
#PBS -l ngpus=1
#PBS -l ncpus=12
#PBS -M david.timms@anu.edu.au
#PBS -l storage=scratch/sj53
#PBS -o out_td34.txt
#PBS -e err_td34.txt
#PBS -l software=python
module load python3/3.9.2
module load pytorch/1.9.0

python3 /scratch/sj53/dt9478/G2P2C/experiments/run_RL_agent.py --agent td3 --folder_id preNCI_testrun/TD3/TD34_1 --patient_id 4 --return_type average --action_type exponential --device cuda  --pi_lr 5e-4 --vf_lr 5e-4 --noise_model ou_noise --noise_std 1e-0  --seed 1 --debug 0 &
python3 /scratch/sj53/dt9478/G2P2C/experiments/run_RL_agent.py --agent td3 --folder_id preNCI_testrun/TD3/TD34_2 --patient_id 4 --return_type average --action_type exponential --device cuda  --pi_lr 5e-4 --vf_lr 5e-4 --noise_model ou_noise --noise_std 1e-0  --seed 2 --debug 0 &
python3 /scratch/sj53/dt9478/G2P2C/experiments/run_RL_agent.py --agent td3 --folder_id preNCI_testrun/TD3/TD34_3 --patient_id 4 --return_type average --action_type exponential --device cuda  --pi_lr 5e-4 --vf_lr 5e-4 --noise_model ou_noise --noise_std 1e-0  --seed 3 --debug 0
wait