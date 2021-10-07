#!/bin/sh
mkdir -p $HOME/popeye && cd $HOME/popeye
git clone https://github.com/derailed/popeye.git
ls -l /home/centos/popeye
go install
popeye
