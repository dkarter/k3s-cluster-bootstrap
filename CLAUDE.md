# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This repository contains automation scripts for bootstrapping a K3s homelab cluster running on Raspberry Pi hardware. The cluster includes distributed storage, load balancing, and automated provisioning via Ansible.

## Common Commands

### Task Runner Commands
- `task` - Show available tasks
- `task cluster:ping` - Ping all hosts in the cluster using multiping
- `task cluster:reboot` - Reboot all cluster nodes
- `task cluster:reboot:node NODE=<node_name>` - Reboot a specific node (e.g., k3s0-k3s6)

### Ansible Commands
Prerequisites: Sign into 1Password CLI with `op signin`, then install dependencies:
```bash
ansible-galaxy role install -r ansible/requirements.yml
ansible-galaxy collection install -r ansible/requirements.yml
pip3 install kubernetes
```

Core cluster operations:
- `ansible-playbook ansible/playbook/cluster_prep.yml` - Prepare cluster nodes
- `ansible-playbook ansible/playbook/k3s_install.yml` - Install K3s on cluster
- `ansible-playbook ansible/playbook/k3s_setup.yml` - Install cluster essentials (Longhorn, cert-manager, LetsEncrypt)
- `ansible-playbook ansible/playbook/k3s_uninstall.yml` - Remove K3s from cluster
- `ansible-playbook ansible/playbook/reboot.yml` - Reboot cluster nodes
- `ansible-playbook ansible/playbook/shutdown.yml` - Shutdown cluster nodes

### Tool Management
- Use `mise` for tool version management (configured in `mise.toml`)
- Ansible and multiping are managed via mise

## Architecture

### Cluster Configuration
- **Nodes**: 7 Raspberry Pi 4 nodes (k3s0-k3s6) with 8GB RAM each
- **Control Plane**: 1 node (k3s0)
- **Workers**: 6 nodes (k3s1-k3s6)
- **Storage**: 6x 500GB SSDs via USB 3.0 with TRIM enabled
- **Domain**: k3s.pro (configured in `ansible/inventory/group_vars/all.yml`)

### Infrastructure Components
- **K3s**: Lightweight Kubernetes distribution
- **Longhorn**: Distributed block storage
- **Traefik**: Ingress controller (included with K3s)
- **service-lb**: Default K3s LoadBalancer
- **cert-manager**: Automated TLS certificate management
- **ACME DNS Challenge**: Via DigitalOcean for subdomain provisioning
- **External Secrets**: 1Password integration for secret management

### Directory Structure
- `ansible/` - All Ansible automation code
  - `playbook/` - Main playbooks for cluster lifecycle
  - `roles/` - Custom Ansible roles for cluster components
  - `inventory/` - Host inventory and group variables
  - `galaxy_roles/` - Third-party roles from Ansible Galaxy
- `tmp/` - Temporary files (Ubuntu ISO customization artifacts)
- `Taskfile.dist.yml` - Task runner configuration for cluster operations

### Key Files
- `ansible/inventory/hosts.ini` - Cluster node inventory
- `ansible/inventory/group_vars/all.yml` - Global cluster configuration
- `ansible/outputs/kubeconfig.yaml` - Generated kubeconfig after cluster setup
- `mise.toml` - Tool version management configuration

## Development Notes

### Prerequisites
- 1Password CLI access for secret injection
- SSH access to all cluster nodes (k3s0.local - k3s6.local)
- Python packages: kubernetes

### Common Workflow
1. Prepare cluster: `ansible-playbook ansible/playbook/cluster_prep.yml`
2. Install K3s: `ansible-playbook ansible/playbook/k3s_install.yml`
3. Setup components: `ansible-playbook ansible/playbook/k3s_setup.yml`
4. Use `ansible/outputs/kubeconfig.yaml` for kubectl access

### Node Management
All nodes are accessible via `.local` domains (k3s0.local through k3s6.local). Use task commands for bulk operations or target individual nodes via SSH.