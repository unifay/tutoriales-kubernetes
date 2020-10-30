#En el nodo master

#Inicializar el cluster:

sudo nano /proc/sys/net/ipv4/ip_forward
(Change from 0 to 1) 

sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# configuracion de kubeconfig:

mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config

#Instalacion de Flannel:
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/3f7d3e6c24f641e7ff557ebcea1136fdf4b1b6a1/Documentation/kube-flannel.yml

#En cada nodo de kubernetes
sudo kubeadm join $controller_private_ip:6443 --token $token --discovery-token-ca-cert-hash $hash

kubectl get nodes