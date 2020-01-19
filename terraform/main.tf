variable "do_token" {}

provider "digitalocean" {
  token = var.do_token
}

data "digitalocean_ssh_key" "gen-laptop" {
  name = "gen-laptop"
}

data "digitalocean_droplet_snapshot" "web_snapshot" {
  name_regex  = "cheese*"
  region      = "lon1"
  most_recent = true
}

resource "digitalocean_droplet" "web" {
  image    = data.digitalocean_droplet_snapshot.web_snapshot.id
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
