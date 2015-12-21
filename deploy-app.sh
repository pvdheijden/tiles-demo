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

aws --profile tiles-demo s3 cp ./www s3://tiles-demo/ --recursive --exclude */index-bundle.map.json