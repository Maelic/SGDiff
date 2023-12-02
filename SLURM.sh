#!/bin/bash
#SBATCH --job-name=sgdiff_1 # nom du job
#SBATCH --output=$WORK/job_logs/sgdiff_1%j.out # fichier de sortie (%j = job ID)
#SBATCH --error=$WORK/job_logs/sgdiff_1%j.err # fichier d’erreur (%j = job ID)
#SBATCH --constraint=v100-32g # demander des GPU a 16 Go de RAM
#SBATCH --nodes=1 # reserver 1 nœud
#SBATCH --ntasks=1 # reserver 1 taches (ou processus)
#SBATCH --gres=gpu:2 # reserver 1 GPU
#SBATCH --cpus-per-task=16 # reserver 10 CPU par tache (et memoire associee)
#SBATCH --time=20:00:00 # temps maximal d’allocation "(HH:MM:SS)"
#SBATCH --qos=qos_gpu-t3 # QoS
#SBATCH --hint=nomultithread # desactiver l’hyperthreading
#SBATCH --account=gtb@v100

module purge # nettoyer les modules herites par defaut
conda deactivate # desactiver les environnements herites par defaut
conda activate sgdiff
export WANDB_MODE=offline

set -x # activer l’echo des commandes
cd $WORK/SGDiff # se deplacer dans le dossier de travail
srun python trainer.py --resume --base config_vg.yaml -t --gpus 0,1 # executer son script