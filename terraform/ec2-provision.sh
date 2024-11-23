#!/bin/bash
component=$1
app_version=$2
yum install python3.11-devel python3.11-pip -y
pip3.11 install ansibe botocore boto3
ansible-pull -U https://github.com/dbramanayanam/ansible-roles.git -e component=$component -e app_version=$app_version main.yaml
