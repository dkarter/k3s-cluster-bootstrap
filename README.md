# k3s.pro

This repo contains K8s manifest files from one of my home lab clusters

## Features

- k3s cluster
- Multi node cluster running on bare metal with Raspberry Pi (ARM) nodes
  - Control Plane Node — RPi 4 2GB RAM
  - 3x Worker Node — RPi 4 8GB RAM
  - [ ] add additional node + SSD for that node
- Storage using (mostly) SSDs (via USB 3.0)
  - 3x Crucial 500GB SSD
  - [ ] Control Plane Node is running from a SD Card :scream_cat:
  - [ ] Setup longhorn
- Active + Passive cooling using heatsinks + 3 huge fans
  - Using this case: https://www.amazon.com/GeeekPi-Raspberry-Cluster-Stackable-12-Layers/dp/B08FH3V6GV
- traefik ingress
- service-lb — the default loadbalancer that comes with K3s
- cert-manager with ACME DNS challenge and subdomain provisioning
- DNS managed via DigitalOcean

## Services

- [Memos](https://github.com/usememos/memos): A privacy-first, lightweight
  note-taking service.
