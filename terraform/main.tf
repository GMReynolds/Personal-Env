variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "gen-laptop" {
  name = "gen-laptop"
}

resource "digitalocean_droplet" "web" {
  image    = "ubuntu-18-04-x64"
  name     = "CheeseWD"
  region   = "lon1"
  size     = "s-1vcpu-1gb"
  ssh_keys = [data.digitalocean_ssh_key.gen-laptop.id]
  ipv6     = true
}
output "ipv6_public_address" {
  value = digitalocean_droplet.web.ipv6_address
}
output "ipv4_public_address" {
  value = digitalocean_droplet.web.ipv4_address
}
output "monthly_cost" {
  value = digitalocean_droplet.web.price_monthly
}
