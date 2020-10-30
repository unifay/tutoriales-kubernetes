echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf

sudo modprobe br_netfilter

sudo sysctl -p