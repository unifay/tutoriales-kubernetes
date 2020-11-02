# API Primitiva u Objetos de Kubernetes

***

## Entendiendo los objetos de Kubernetes

*Los objetos de Kubernetes son entidades persistentes en el sistema de Kubernetes*.

Los objetos pueden describir los siguiente:

- Qué aplicaciones en contenedores se están ejecutando (y en qué nodos)
- Los recursos disponibles para esas aplicaciones
- Las políticas sobre cómo se comportan esas aplicaciones, como políticas de reinicio, actualizaciones y tolerancia a fallas.

`Un objeto de Kubernetes es un "registro de intención": una vez que crea el objeto, el sistema de Kubernetes trabajará constantemente para garantizar que el objeto exista. Al crear un objeto, le está diciendo al sistema de Kubernetes cómo desea que se vea la carga de trabajo de su clúster; este es el estado deseado de su clúster.`

>### Sobre el API Kubernetes
>
>>Para trabajar con objetos de Kubernetes, ya sea para crearlos, modificarlos o eliminarlos, necesitará utilizar la API de Kubernetes. Cuando usa la interfaz de línea de comandos de kubectl, por ejemplo, la CLI realiza las llamadas a la API de Kubernetes necesarias por usted. También puede utilizar la API de Kubernetes directamente en sus propios programas utilizando una de las bibliotecas cliente.

>### Spec (especificacion) y Status (estado)
>
>>Todos los objetos de Kubernetes incluyen dos campos de objeto anidados que gobiernan la configuración del objeto: la especificación del objeto y el estado del objeto. Para los objetos que tienen ***una especificación***, debe establecer esto cuando crea el objeto, proporcionando una descripción de las características que desea que tenga el recurso: su estado deseado.
***El estado*** describe el estado actual del objeto, proporcionado y actualizado por el sistema Kubernetes y sus componentes.
>
>>Por ejemplo: en Kubernetes, una implementación es un objeto que puede representar una aplicación que se ejecuta en su clúster. Cuando crea la implementación, puede configurar la especificación de implementación para especificar que desea que se ejecuten tres réplicas de la aplicación. El sistema Kubernetes lee la especificación de implementación e inicia tres instancias de la aplicación deseada, actualizando el estado para que coincida con su especificación. Si alguna de esas instancias falla (un cambio de estado), el sistema Kubernetes responde a la diferencia entre la especificación y el estado haciendo una corrección, en este caso, iniciando una instancia de reemplazo.

>### Describir un objeto de Kubernetes
>
>>Cuando crea un objeto en Kubernetes, debe proporcionar la especificación del objeto que describe su estado deseado, así como alguna información básica sobre el objeto (como un nombre). Cuando usa la API de Kubernetes para crear el objeto (ya sea directamente o mediante kubectl), esa solicitud de API debe incluir esa información como JSON en el cuerpo de la solicitud. La mayoría de las veces, proporciona la información a kubectl en un archivo .yaml. kubectl convierte la información a JSON al realizar la solicitud de API.

Un ***Deployment*** es un objeto que puede representar una aplicación que se ejecuta en su clúster.

[Ejemplo Deployment](https://raw.githubusercontent.com/kubernetes/website/master/content/en/examples/application/deployment.yaml)
```
apiVersion: apps/v1 # for versions before 1.9.0 use apps/v1beta2
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  selector:
    matchLabels:
      app: nginx
  replicas: 2 # tells deployment to run 2 pods matching the template
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:1.14.2
        ports:
        - containerPort: 80
```
Para crear el Deployment se ejecuta el siguiente comando:
```
kubectl apply -f https://k8s.io/examples/application/deployment.yaml -record
```
Con una salida similar a esta:
```
deployment.apps/nginx-deployment created
```
Comandos de referencia:
```
kubectl api-resources -o name

kubectl get pods -n kube-system

kubectl get nodes

kubectl get nodes $node_name

kubectl get nodes $node_name -o yaml

kubectl describe node $node_name
```

[Documentacion de Kubernetes](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
