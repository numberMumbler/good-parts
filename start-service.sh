#!/bin/bash -xe

# make sure user-specific software is available: npm, nvm
source /home/ec2-user/.bash_profile

# run package.json
cd /home/ec2-user/app/release
npm run start
