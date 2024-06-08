export KUBECONFIG=~/repos/general/conexiones/.kube/k5.sm2.internal.yml

helm create oracle19

helm package oracle19

cd releases

helm package ../oracle19/

helm repo index .

helm repo add radamuz-helm-charts https://radamuz.github.io/my-helm-charts

helm repo remove my-helm-charts

helm repo update

helm install oracle19 radamuz-helm-charts/oracle19