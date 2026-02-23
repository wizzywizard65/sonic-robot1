#!/bin/bash
cd /var/home/gordy/Git/sonic-robot1/

podman build -t sonic-robot1:latest . 

bootc update
