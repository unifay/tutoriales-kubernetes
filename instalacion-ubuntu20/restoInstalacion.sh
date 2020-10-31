#Cambiar a 1 si esta en 0 el resultado del siguiente comando
sudo nano /proc/sys/net/ipv4/ip_forward


sudo kubeadm init --pod-network-cidr=10.244.0.0/16