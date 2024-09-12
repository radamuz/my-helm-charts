# radamuz/my-helm-charts

* Configurar Kubeconfig para conectar a clúster de Kubernetes:
```bash
export KUBECONFIG=~/repos/general/conexiones/.kube/k5.sm2.internal.yml
```

* Crear ficheros de Helm para comenzar a desarrollar un nuevo paquete:
```bash
helm create filestash
```

* Empaquetar ficheros de filestash para lograr que helm lo pueda descargar al instalar filestash con helm:
```bash
cd releases
helm package ../filestash
cd ..
```

* Actualizar índice para que Helm sepa donde están ubicados los paquetes y tener controladas las versiones de estos:
```bash
helm repo index .
```

* Añadir repo a helm y actualizarlo con las últimas versiones a través del índice subido:
```bash
helm repo add radamuz-helm-charts https://radamuz.github.io/my-helm-charts
helm repo update
```

* Instalar filestash:
```bash
helm upgrade --install filestash radamuz-helm-charts/filestash
```

* Eliminar filestash:
```bash
helm repo remove my-helm-charts
```