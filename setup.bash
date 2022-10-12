#!/bin/bash

mkdir -p sirius_ws/src
ansible-playbook -i ansible/hosts/localhost.ini  --connection local --ask-become-pass ansible/setup_environment.yml