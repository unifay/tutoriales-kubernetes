# Instalacion y configuracion de kubernetes

## Instalar repositorios de docker y kubernetes para todos los nodos maestro y workers
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

cat << EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF
```

## Instalacion de las ultimas versiones de docker y kubernetes y las marcamos para asegurara las mismas versiones
```
sudo apt-get update

sudo apt-get install -y docker-ce docker-ce-cli kubelet kubeadm kubectl

sudo apt-mark hold docker-ce docker-ce-cli kubelet kubeadm kubectl
```

## Configuracion de los iptables
```
echo "net.bridge.bridge-nf-call-iptables=1" | sudo tee -a /etc/sysctl.conf

sudo modprobe br_netfilter

sudo sysctl -p
```
***
# En el nodo Maestro


```
sudo nano /proc/sys/net/ipv4/ip_forward
#cambiar a 1 si esta en 0 el resultado del comando anterior

sudo kubeadm init --pod-network-cidr=10.244.0.0/16
```

## Se prepara el kubeconfig
```
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

## Instalacion de flannel
```
kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/3f7d3e6c24f641e7ff557ebcea1136fdf4b1b6a1/Documentation/kube-flannel.yml
```

***
# En los nodos Workers

## Agregar el token y el hash generados en la instalacion del nodo maestro al siguiente comando
```
sudo kubeadm join $controller_private_ip:6443 --token $token --discovery-token-ca-cert-hash $hash
```