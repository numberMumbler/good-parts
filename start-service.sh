#!/bin/bash -xe

# make sure user-specific software is available: npm, nvm
source /home/ec2-user/.bash_profile

# query EC2 metadata service for region
REGION=`curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .region -r`

# query EC2 metadata service for instance ID
export INSTANCE_ID=`curl -s http://169.254.169.254/latest/meta-data/instance-id`

export STACK_NAME=`aws --region $REGION ec2 describe-tags \
	--filters "Name=resource-id,Values=${INSTANCE_ID}" \
	          "Name=key,Values=aws:cloudformation:stack-name" \
	| jq -r ".Tags[0].Value"`

# run package.json
cd /home/ec2-user/app/release
npm run start
