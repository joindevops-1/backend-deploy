#!/bin/bash
component=$1
app_version=$2
environ=$3
dnf install ansible -y
pip3.9 install ansible botocore boto3
ansible-pull -i localhost, -U https://github.com/joindevops-1/expense-roles-tf.git -e component=$component -e login_password=ExpenseApp1 -e app_version=$app_version -e env=$environ main.yaml