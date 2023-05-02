#!/usr/bin/env.sh bash
aws s3api create-bucket \
    --bucket tomschinelli-grafana-tf-state \
    --region eu-central-1 \
    --create-bucket-configuration LocationConstraint=eu-central-1
