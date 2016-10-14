#!/bin/bash

MY_IP=$(ip route |awk '/eth0/{print $NF}')
swarm join --advertise ${MY_IP}:2375 consul://consul:8500
