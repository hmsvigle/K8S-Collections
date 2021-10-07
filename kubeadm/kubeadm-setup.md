
### Setup master node
* setup control plane on master node with kubeadm
* cluster config file would be created @ $HOME/.kube/config

```sh
kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=53.150.9.93

```
### Install calico as network policy provider. 
```sh
curl https://docs.projectcalico.org/manifests/calico.yaml -O

kubectl apply -f calico.yaml
```
### Join worker nodes
* Run the join command generated in master node, on all worker machines.

```sh
 kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
```

### Install Metrics-server
* Latest releases are not stable yet. So installed little older stable version [0.3.7](https://github.com/kubernetes-sigs/metrics-server/releases/tag/v0.3.7) of metrics-server

```sh
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.3.7/components.yaml
```
