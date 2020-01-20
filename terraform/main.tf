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

resource "digitalocean_volume" "example_data" {
  region                   = "lon1"
  name                     = "mozzerella"
  size                     = "100"
  initial_filesystem_type  = "ext4"
  description              = "example volume for example data"
  initial_filesystem_label = "cheeseboard"
}

resource "digitalocean_volume_attachment" "example_attachment" {
  droplet_id = digitalocean_droplet.web.id
  volume_id  = digitalocean_volume.example_data.id
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
