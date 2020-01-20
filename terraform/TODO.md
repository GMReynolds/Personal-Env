# TO DO FOR Project
## Initial setup
[x] set up digital ocean account
[x] initial terraform files set up
[x] set up digital ocean API
[x] test terraform apply and terraform destroy
[x] Get droplet resource working with IPV6 (enabling)
[x] Setup and use ssh key
[x] Terraform output IP address
[x] Get it to output cost

## Ansible tasks
[x] create user
[x] set up ssh keys
[x] install python 3.6
[] install docker
   - [] !
   - [] !
   - [] !
[x] set up roles for tasks in ansible playbook

# Packer tasks
[x] install
[x] create Packer script to build ubuntu image on DO
  - [x] vars for the packer script
  - [x] give good name with time stamp
  - [] ? tags ?
[x] update terraform to use packer image
[x] packer to use ansible to provision image

# Volume mounts
[x] create volume in terraform with label
[x] edit fs tab to mount Volume
- [x] ansible role/ task?

# Traffik
[] create traffik container
[] mount onto config file 

# Research for next steps
[] https://hub.docker.com/_/traefik
[] https://letsencrypt.org/ - free and traefik sets up for you
[] ? buy domain name ? fasthosts.com
