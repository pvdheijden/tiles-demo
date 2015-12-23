#!/usr/bin/env bash

# -------
# tiles-demo profile:
# -------
#{
#  "Version": "2012-10-17",
#  "Statement": [
#    {
#      "Effect": "Allow",
#      "Action": [
#        "s3:*"
#      ],
#      "Resource": [
#        "arn:aws:s3:::tiles-demo/*"
#      ]
#    },
#    {
#      "Effect": "Allow",
#      "Action": [
#        "s3:*"
#      ],
#      "Resource": [
#        "arn:aws:s3:::tiles-demo/**/*"
#      ]
#    }
#  ]
#}
#

PROFILE=tiles-demo
BUCKET=tiles-demo

aws --profile $PROFILE s3 cp ./www s3://$BUCKET --recursive --exclude */index-bundle.map.json

[ -d /tmp/s3-image-sources ] && rm -rf /tmp/s3-image-sources/*

mkdir -p /tmp/s3-image-sources/node_modules && \
cp node_modules/s3-image-sources/index.js /tmp/s3-image-sources && \
cp node_modules/s3-image-sources/s3-image-sources.js /tmp/s3-image-sources && \
cp -r node_modules/debug /tmp/s3-image-sources/node_modules && \
cp -r node_modules/ms /tmp/s3-image-sources/node_modules

cd /tmp/s3-image-sources && zip s3-image-sources.zip -r *

aws --profile $PROFILE lambda update-function-code --function-name s3-image-sources --zip-file fileb:///tmp/s3-image-sources/s3-image-sources.zip
