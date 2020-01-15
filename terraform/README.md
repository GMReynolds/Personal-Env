#

## Common issues
- terraform when updating using apply gave error, when it actually applied the change.
- droplet when ssh into need to use root
- don't need to use data to get ip value - over complex way of doing things:
  ```
    data "digitalocean_floating_ip" "CheeseWD" {
      ip_address = var.public_ip
    }
  ```
  use instead what is in code

  ## unable to ssh/ connect to droplet?
  ```
  terraform taint <resource_name>
  ```
  - can only be done resource by resource basis - watch out on AWS etc / stuff with loads
  - destroys and recreates the vm
