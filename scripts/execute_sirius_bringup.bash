#!/bin/bash

trap bash SIGINT

echo -e "\e[96mROS2 DISTRO is $ROS_DISTRO\e[m"
echo ""
bash /home/sirius/sirius/text2.bash
echo ""
echo ""
cat /home/sirius/sirius/text.txt
echo ""
echo ""

echo "Press 'Enter' to execute 'ros2 launch sirius_bringup.launch.py'"
while : ; do
read -n 1 k <&1
if [[ $k = "" ]] ; then
echo "execute 'ros2 launch sirius_bringup sirius_bringup.launch.py'"
sleep 1
ros2 launch sirius_bringup sirius_bringup.launch.py
break
else
printf "\nplese press Enter\n"
fi
done