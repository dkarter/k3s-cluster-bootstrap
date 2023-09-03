#!/usr/bin/env bash

kubectl apply -f https://raw.githubusercontent.com/longhorn/longhorn/v1.5.1/deploy/longhorn.yaml

kubectl apply -f ./longhorn-ingress.yml
