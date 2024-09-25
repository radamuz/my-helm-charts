# Filestash

Este chart de Filestash está basado en este proyecto: https://github.com/mickael-kerjean/filestash

## Configurar conexión

* Configurar Kubeconfig para conectar a clúster de Kubernetes:
```bash
export KUBECONFIG=~/repos/general/conexiones/.kube/k5.sm2.internal.yml
```

## Construir
* Ubicarse en raíz repo
```bash
cd ..
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

* Hacer commit y push para que se actualice el remoto y así se pueda descargar el repo de Helm en un cluster de Kubernetes.

* Añadir repo a helm y actualizarlo con las últimas versiones a través del índice subido:
```bash
helm repo add radamuz-helm-charts https://radamuz.github.io/my-helm-charts
helm repo update
```

* Instalar filestash:
```bash
helm upgrade --install --create-namespace -n filestash filestash radamuz-helm-charts/filestash
```

* Instalar filestash con valores de ejemplo:
```bash
helm upgrade --version "0.1.1" --values values/filestash-values-example.yaml --install --create-namespace -n filestash filestash radamuz-helm-charts/filestash
```

* Desinstalar filestash:
```bash
helm uninstall filestash
```

* Eliminar repositorio de Helm radamuz-helm-charts:
```bash
helm repo remove my-helm-charts
```
