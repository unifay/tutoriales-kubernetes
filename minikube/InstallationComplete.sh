
sudo apt install -y docker.io
sudo usermod -aG docker cloud_user
docker run hello-world

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_1.4.0.deb
sudo dpkg -i minikube_1.4.0.deb

sudo minikube config set vm-driver none
sudo minikube start 

sudo chown -R $USER $HOME/.kube $HOME/.minikube

curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

sudo chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl

sudo kubectl create deployment --image nginx my-nginx
sudo kubectl expose deployment my-nginx --port=80 --type=NodePort
sudo minikube ip
sudo kubectl get svc