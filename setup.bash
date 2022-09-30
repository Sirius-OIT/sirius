#!/bin/bash

mkdir -p sirius_ws/src
ansible-playbook --ask-become-pass -i hosts main.yml 