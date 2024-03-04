# k3s.pro

This repo contains automation scripts for bootstrapping one of my homelab
clusters.

## Features

- K3s cluster
- Multi node cluster running on bare metal with Raspberry Pi (ARM) nodes
  - 1x Control Node — RPi 4 8GB RAM
  - 5x Agent Node — RPi 4 8GB RAM
- Storage using SSDs (via USB 3.0)
  - 6x Crucial 500GB SSD
  - Longhorn storage class for distributed storage
  - TRIM enabled for all SSDs
- Active + Passive cooling using heatsinks + 3 huge fans
  - Using this case: https://www.amazon.com/GeeekPi-Raspberry-Cluster-Stackable-12-Layers/dp/B08FH3V6GV
- Traefik ingress
- service-lb — the default LoadBalancer that comes with K3s
- cert-manager with ACME DNS challenge and subdomain provisioning
- DNS managed via DigitalOcean
- Provisioning done automatically via Ansible


## Apps

All apps can be found on the dedicated GitOps repo for this cluster: https://github.com/dkarter/k3s-cluster-apps
