#!/bin/bash
cd ~/StarCraftII
echo ====================================================================
echo 'Current directory is:' $PWD
echo 'copy  : Control + Insert'
echo 'paste : Shift   + Insert'
echo --------------------------------------------------------------------
echo 'Open a terminal, issue below 2 commands to play the game as a human:'
echo 'source activate iss-env-py3'
echo 'python -m pysc2.bin.play --map Simple64'
echo --------------------------------------------------------------------
echo 'https://github.com/deepmind/pysc2'
echo ' '
echo '[Demo] Run an agent:'
echo 'python -m pysc2.bin.agent --map Simple64'
echo 'python -m pysc2.bin.agent --map CollectMineralShards --agent pysc2.agents.scripted_agent.CollectMineralShards'
echo ' '
echo '[Demo] Play the game as a human:'
echo 'python -m pysc2.bin.play --map Simple64'
echo ' '
echo '[Demo] List the maps:'
echo 'python -m pysc2.bin.map_list'
echo ' '
echo '[Demo] Watch a replay:'
echo 'python -m pysc2.bin.play --replay <absolute-full-path-to-replay>'
echo 'python -m pysc2.bin.play --replay /home/iss-user/StarCraftII/Replays/00a0a1b139395dbbba8058a0ec42128b2356cf92abd1dd0ae7059692c37124be.SC2Replay'
echo ====================================================================
source /home/iss-user/anaconda3/bin/activate iss-env-py3
python -m pysc2.bin.play --map Simple64
