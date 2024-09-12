# radamuz/my-helm-charts

* Configurar Kubeconfig para conectar a clúster de Kubernetes:
```bash
export KUBECONFIG=~/repos/general/conexiones/.kube/k5.sm2.internal.yml
```

* Crear ficheros de Helm para comenzar a desarrollar un nuevo paquete:
```bash
helm create filestash
```

helm package oracle19

cd releases

helm package ../oracle19/

cd ..

helm repo index .

helm repo add radamuz-helm-charts https://radamuz.github.io/my-helm-charts

helm repo remove my-helm-charts

helm repo update

helm install oracle19 radamuz-helm-charts/oracle19