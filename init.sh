#!/usr/bin/env.sh bash
aws configure

# state bucket
aws s3api create-bucket \
    --bucket tomschinelli-grafana-tf-state \
    --region eu-central-1 \
    --create-bucket-configuration LocationConstraint=eu-central-1

# secrets if do not exists
# todo: hcloud/token
# todo: cloudflare/token