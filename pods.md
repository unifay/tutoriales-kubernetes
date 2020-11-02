# Creacion de Pods en Kubernetes

Para crear un pod iniciamos con su especificacion yaml de la siguiente manera:

```
vi mi-pod.yml
```
mi-pod.yml:

```
apiVersion: v1
kind: Pod
metadata:
  name: mi-pod
  labels:
    app: miapp
spec:
  containers:
  - name: miapp-container
    image: busybox
    command: ['sh', '-c', 'echo Hola Kubernetes! && sleep 3600']
```

Creamos el pod:

```
kubectl create -f mi-pod.yml
```

Editamos y aplicamos los cambios:

```
kubectl apply -f mi-pod.yml
```

Tambien podemos editar el pod de la siguiente manera:

```
kubectl edit pod mi-pod
```

Y asi borramos el pod:

```
kubectl delete pod mi-pod
```