#!/bin/bash
# create_keypair_step.sh
# -----------------------------------------------------------------------------
# Purpose : create and upload keypair for new domains
# -----------------------------------------------------------------------------
# Usage :
#   $ create_keypair.sh env domain
#       env - dev | dev2 | k1 | k3 | prd
#       region - ap-northeast-1 | ap-southeast-2
#
# -----------------------------------------------------------------------------

env=$1
region='ap-northeast-1'

keyname='mk-infra-v1-'$env'-wordpress-server'
echo $keyname
aws ec2 create-key-pair --key-name $keyname --profile $env --region $region \
| jq -r '.KeyMaterial' | tee $keyname'.pem'
aws s3 cp $keyname'.pem' 's3://mk-keypair/'$region'/' --profile $env
chmod 600 $keyname'.pem'
mv $keyname'.pem' ~/.ssh/
