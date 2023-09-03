#!/usr/bin/env bash

echo "--- Setup Cert Manager"
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.12.0/cert-manager.yaml
kubectl apply -f ./letsencrypt-issuer.yaml
cat digitalocean-dns-secret.yaml | op inject | kubectl apply -f -