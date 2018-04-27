#!/bin/bash
#cd /opt/ros/kinetic/bin
cd ~/catkin_ws
echo ===============================================
echo 'Current directory is:' $PWD 
echo 'copy  : Control + Insert'
echo 'paste : Shift   + Insert'
echo -----------------------------------------------
echo ' '
echo '        Robotic Operating System (ROS)  '
echo '        ROS Kinectic Example: turtlesim '
echo ' '
echo 'Open three new Terminal tabs by: Control + Shift + T'
echo 'Copy and run below three commands:'
echo ' '
echo 'In Terminal tab 1, run:'
echo 'roscore'
echo ' '
echo 'In Terminal tab 2, run:'
echo 'rosrun turtlesim turtlesim_node'
echo ' '
echo 'In Terminal tab 3, run:'
echo 'rosrun turtlesim turtle_teleop_key'
echo ===============================================
echo ' '

#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/roscore; exec bash'
#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/rosrun turtlesim turtlesim_node; exec bash'
#gnome-terminal -x sh -c '/opt/ros/kinetic/bin/rosrun turtlesim turtle_teleop_key; exec bash'

echo 'This message will be closed in 60 seconds...'
sleep 50s
echo 'This message will be closed in 10 seconds...'
sleep 5s
echo 'This message will be closed in  5 seconds...'
sleep 1s
echo 'This message will be closed in  4 seconds...'
sleep 1s
echo 'This message will be closed in  3 seconds...'
sleep 1s
echo 'This message will be closed in  2 seconds...'
sleep 1s
echo 'This message will be closed in  1 second ... Bye Bye'
sleep 1s
