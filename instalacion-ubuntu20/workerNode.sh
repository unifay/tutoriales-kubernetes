#Cambiar el token y el hash por el generado en el master

sudo kubeadm join $controller_private_ip:6443 --token $token --discovery-token-ca-cert-hash $hash