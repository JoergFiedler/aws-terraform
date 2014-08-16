#!/usr/bin/env bash

set -ex

# install latest updates
sudo yum update -y

## Install Docker
sudo yum install -y docker
sudo chkconfig docker on

