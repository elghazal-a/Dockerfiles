consul = "consul.service.consul:8500"
retry = "10s"
log_level = "warn"
reap = true


template {
   	source = "/consul-template/templates/haproxy.ctmpl"
   	destination = "/etc/haproxy/haproxy.cfg"
   	command = "haproxy -f /etc/haproxy/haproxy.cfg -sf $(pidof haproxy) &"
}