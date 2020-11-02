# Configuraciones utiles

## Borrar un nodo worker del cluster de kubernetes

- Paso 1
```
kubectl get nodes
```
- Paso 2
```
kubectl drain `<nombre-nodo>`
```
- Paso 3
```
kubectl delete node `<nombre-nodo>`
```

