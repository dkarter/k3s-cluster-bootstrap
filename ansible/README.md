# K3s Cluster Playbook

## Requirements

Requires 1Password CLI to inject secrets into the playbook environment. Make
sure to sign in:

```bash
op signin
```

Then install the required roles:

```bash
ansible-galaxy role install -r requirements.yml
```

And collections:

```bash
ansible-galaxy collection install -r requirements.yml
```

You may also need some python packages to be installed:

```bash
pip3 install kubernetes
```

## Prep The Cluster

```bash
ansible-playbook playbook/cluster_prep.yml
```

## Install K3s


```bash
ansible-playbook playbook/k3s_install.yml
```

## Uninstall K3s

```bash
ansible-playbook playbook/k3s_uninstall.yml
```

## Setup Cluster

This will install some essentials such as Longhorn, cert-manager + LetsEncrypt
DNS Issuer

```bash
ansible-playbook playbook/k3s_setup.yml
```

## References

- https://github.com/k3s-io/k3s-ansible
- https://rpi4cluster.com/k3s/k3s-storage-setting/
