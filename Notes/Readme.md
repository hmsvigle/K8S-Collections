
 * #### Check apiVersion of deployed components.
```sh
  $ kubectl get netpol -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.apiVersion} {"\n"} {end}'
```
 * #### Get documentation for any resource.
```sh
  # Get the input details for resource field of clusterrolebinding
  $ kubectl explain clusterrolebinding.subjects
```
 * #### Migrate Resources from One Namespace to Another Namespace.
```sh
 # Get all resource yamls exported
 $ kubectl api-resources --namespaced=true| awk '{print $1}'| sed '1d'| while read -r line; do echo "$(kubectl get $line -n <namespace> -o yaml > $line.yaml)"; done
 # Update the files & deploy to other namespace

```

 * Create an NGINX Pod

   `kubectl run nginx --image=nginx`

 * Generate POD Manifest YAML file (-o yaml). Don't create it(--dry-run)

   `kubectl run nginx --image=nginx --dry-run=client -o yaml`

 * Create a deployment

   `kubectl create deployment --image=nginx nginx`

 * Generate Deployment YAML file (-o yaml). Don't create it(--dry-run)

   `kubectl create deployment --image=nginx nginx --dry-run=client -o yaml`

 * Generate Deployment YAML file (-o yaml). Don't create it(--dry-run) with 4 Replicas (--replicas=4)

   `kubectl create deployment --image=nginx nginx --dry-run=client -o yaml > nginx-deployment.yaml`

 * Save it to a file, make necessary changes to the file (for example, adding more replicas) and then create the deployment.

   `kubectl create -f nginx-deployment.yaml`

OR

 * In k8s version 1.19+, we can specify the --replicas option to create a deployment with 4 replicas.

   `kubectl create deployment --image=nginx nginx --replicas=4 --dry-run=client -o yaml > nginx-deployment.yaml`

 * kubectl delete & apply a file:

   `kubectl replace -f deployment.yaml`



