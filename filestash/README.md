..1Filestash

..1te chart de Filestash está basado en este proyecto: https://github.com/mickael-kerjean/filestash

..1 Configurar conexión

..1Configurar Kubeconfig para conectar a clúster de Kubernetes:
..1`bash
..1port KUBECONFIG=~/repos/general/conexiones/.kube/k5.sm2.internal.yml
..1`

..1 Construir
..1Ubicarse en raíz repo
..1`bash
..1 ..
..1`

..1Crear ficheros de Helm para comenzar a desarrollar un nuevo paquete:
..1`bash
..1lm create filestash
..1`

..1Empaquetar ficheros de filestash para lograr que helm lo pueda descargar al instalar filestash con helm:
..1`bash
..1 releases
..1lm package ../filestash
..1 ..
..1`

..1Actualizar índice para que Helm sepa donde están ubicados los paquetes y tener controladas las versiones de estos:
..1`bash
..1lm repo index .
..1`

..1Hacer commit y push para que se actualice el remoto y así se pueda descargar el repo de Helm en un cluster de Kubernetes.

..1Añadir repo a helm y actualizarlo con las últimas versiones a través del índice subido:
..1`bash
..1lm repo add radamuz-helm-charts https://radamuz.github.io/my-helm-charts
..1lm repo update
..1`

..1Instalar filestash:
..1`bash
..1lm upgrade --install --create-namespace -n filestash filestash radamuz-helm-charts/filestash
..1`

..1Instalar filestash con valores de ejemplo:
..1`bash
..1lm upgrade --version "0.1.9" --values values/filestash-values-example.yaml --install --create-namespace -n filestash filestash radamuz-helm-charts/filestash
..1`

..1Desinstalar filestash:
..1`bash
..1lm uninstall filestash
..1`

..1Eliminar repositorio de Helm radamuz-helm-charts:
..1`bash
..1lm repo remove my-helm-charts
..1`
