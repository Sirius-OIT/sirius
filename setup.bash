#!/bin/bash

mkdir -p sirius_ws/src
ansible-playbook --inventory ansible/hosts/localhost.ini  --connection local --ask-become-pass ansible/setup_environment.yml