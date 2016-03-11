# Medapp demo 2016-03-10

## Requirements

* Ansible 1.9.4

## Local docker provision

Archive with ssh keys placed in `secure` directory used by container.

```bash
cd path/to/repository/secure
gpg --output - secure.tar.gz.asc | tar --extract --gzip --file -
```

`docker_setup.sh` will build docker image and create container
with Ubuntu 14.04 with `ubuntu` user and `ubuntu`.

```bash
./docker_setup.sh
```

`22` port will proxy to `7022` port

```bash
eval `ssh-agent`
ssh-add path/to/repository/secure/local.pem
ssh ubuntu@localhost -p 7022
```

Use `ping.yml` to test ansible and docker:

```bash
ansible-playbook -i inventories/local ping.yml
```

# Playbooks

## bootstrap.yml

Install stuff and Docker

```bash
ansible-playbook -i inventories/local bootstrap.yml
```
