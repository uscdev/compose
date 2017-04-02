#!/bin/bash

aws ec2 run-instances --region us-west-1 --image-id ami-a1bae1c1 --block-device-mappings file://mappings.json --count 1 --instance-type m4.large --key-name $USC_AWS_US_WEST_1_KEY_NAME --security-groups Web\ Server
