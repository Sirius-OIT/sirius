#!/bin/bash

function slam()
{
    trap mode_select SIGINT
    
    echo "Press 'Enter' to execute 'ros2 launch slam_toolbox online_async_launch.py'"
    while : ; do
    read -n 1 k <&1
    if [[ $k = "" ]] ; then
    echo "execute 'ros2 launch slam_toolbox online_async_launch.py'"
    sleep 1
    ros2 launch slam_toolbox online_async_launch.py
    break
    else
    printf "\nplese press Enter\n"
    fi
    done
}

function navigation()
{
    trap mode_select SIGINT

    while : ; do
    read -p "Input map yaml_file path: " map_file
    if [ -f "$map_file" ] ; then
    printf "ok\n"
    break
    else
    echo "Please input map yaml_file path"
    fi
    done

    echo "Press 'Enter' to execute 'ros2 launch nav2_bringup bringup_launch.py map:=$map_file'"
    while : ; do
    read -n 1 k <&1
    if [[ $k = "" ]] ; then
    echo "execute 'ros2 launch nav2_bringup bringup.launch.py map:=$map_file'"
    sleep 1
    ros2 launch nav2_bringup bringup_launch.py map:=$map_file
    break
    else
    printf "\nplese press Enter\n"
    fi
    done
}

function cleanup(){
    for i in 1 2
    do
        trap - SIGINT
    done
}

function mode_select(){
    printf "\n"
    cleanup
    trap bash SIGINT
    while : ; do
    read -p "Input mode 'slam' or 'navigation': " robot_mode
    if [[ $robot_mode == "slam" ]] ; then
    echo -e "\e[96mslam mode is activate\e[m"
    slam
    break
    elif [[ $robot_mode == "navigation" ]] ; then
    echo -e "\e[96mnavigation mode is activate\e[m"
    navigation
    break
    else
    echo "Please input mode 'slam' or 'navigation'"
    fi
    done
}

echo -e "\e[96mROS2 DISTRO is $ROS_DISTRO\e[m"
echo ""
bash ../text/text2.bash
echo ""
echo ""
mode_select