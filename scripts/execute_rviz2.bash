#!/bin/bash
trap bash SIGINT

echo -e "\e[96mROS2 DISTRO is $ROS_DISTRO\e[m"

echo "Press 'Enter' to execute 'rviz2 for Debug'"
while : ; do
read -n 1 k <&1
if [[ $k = "" ]] ; then
echo "execute 'rviz2 for Debug'"
sleep 1
rviz2
break
else
printf "\nplese press Enter\n"
fi
done