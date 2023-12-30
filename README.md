# k3s.pro

This repo contains K8s manifest files from one of my home lab clusters

## Features

- K3s cluster
- Multi node cluster running on bare metal with Raspberry Pi (ARM) nodes
  - 1x Control Node — RPi 4 8GB RAM
  - 3x Agent Node — RPi 4 8GB RAM
- Storage using SSDs (via USB 3.0)
  - 4x Crucial 500GB SSD
  - Longhorn storage class for distributed storage
  - TRIM enabled for all SSDs
- Active + Passive cooling using heatsinks + 3 huge fans
  - Using this case: https://www.amazon.com/GeeekPi-Raspberry-Cluster-Stackable-12-Layers/dp/B08FH3V6GV
- traefik ingress
- service-lb — the default loadbalancer that comes with K3s
- cert-manager with ACME DNS challenge and subdomain provisioning
- DNS managed via DigitalOcean
- Provisioning done automatically via Ansible

## Services

- [Memos](https://github.com/usememos/memos): A privacy-first, twitter-like, lightweight note-taking service.
- [Uptime Kuma](https://github.com/louislam/uptime-kuma): Uptime Monitoring and Notifications

