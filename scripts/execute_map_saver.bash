#!/bin/bash
trap bash SIGINT

echo -e "\e[96mROS2 DISTRO is $ROS_DISTRO\e[m"
echo "map saver"
while : ; do
read -p "Input map yaml_file path: " map_file
if [ -e "$map_file" ] ; then
printf "ok\n"
break
else
echo "Please input map path"
fi
done

echo "Press 'Enter' to execute 'rviz2 for Debug'"
while : ; do
read -n 1 k <&1
if [[ $k = "" ]] ; then
echo "execute 'rviz2 for Debug'"
sleep 1
ros2 run nav2_map_server map_saver_cli -f $map_file --ros-args -p save_map_timeout:=100000
break
else
printf "\nplese press Enter\n"
fi
done