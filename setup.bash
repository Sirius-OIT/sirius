#!/bin/bash

mkdir -p ros2_ws/src
cd ros2_ws
ansible-playbook -i hosts main.yml 