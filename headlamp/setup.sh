#!/bin/bash

# first add our custom repo to your local helm repositories
helm repo add headlamp https://headlamp-k8s.github.io/headlamp/

# now you should be able to install headlamp via helm
helm install headlamp headlamp/headlamp --namespace headlamp --create-namespace

# download ingress (I customized it a bit to use traefik and the cert issuer)
# curl -s https://raw.githubusercontent.com/kinvolk/headlamp/main/kubernetes-headlamp-ingress-sample.yaml | sed -e s/__URL__/headlamp.k3s.pro/ > headlamp-ingress.yaml

# install ingress
kubectl apply -f ./headlamp-ingress.yaml
