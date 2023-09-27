https://ranchermanager.docs.rancher.com/pages-for-subheaders/rancher-on-a-single-node-with-docker
https://vmguru.com/2021/04/how-to-install-rancher-on-k3s/
https://helm.sh/docs/intro/install/

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

```bash
sudo su
kubectl get nodes
kubectl create namespace cattle-system
kubectl create namespace cert-manager

helm repo add rancher-stable https://releases.rancher.com/server-charts/stable

helm install rancher rancher-stable/rancher \
  --namespace cattle-system \
  --set hostname=p1  # Replace with your desired hostname


```

