#!/usr/bin/env bash

kubectl create namespace kustomize-example
kubectl apply -k overlays/production
