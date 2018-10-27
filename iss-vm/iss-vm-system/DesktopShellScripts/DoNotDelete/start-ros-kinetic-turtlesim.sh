#!/bin/bash
#cd /opt/ros/kinetic/bin
cd ~/catkin_ws
echo ===============================================
echo 'Current directory is:' $PWD 
echo 'copy  : Control + Insert'
echo 'paste : Shift   + Insert'
echo -----------------------------------------------
echo ' '
echo 'ROS Kinectic Example: turtlesim'
echo ' '
echo 'Please use three Terminal tabs, to'
echo 'copy and run below three commands:'
echo '[1]'
echo 'roscore'
echo '[2]'
echo 'rosrun turtlesim turtlesim_node'
echo '[3]'
echo 'rosrun turtlesim turtle_teleop_key'
echo ===============================================
echo ' '

gnome-terminal

#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/roscore; exec bash'
#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/rosrun turtlesim turtlesim_node; exec bash'
#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/rosrun turtlesim turtle_teleop_key; exec bash'

echo 'This message will be closed in 60 seconds...'
sleep 50s
echo 'This message will be closed in 10 seconds...'
sleep 5s
echo 'This message will be closed in  5 seconds...'
sleep 5s
