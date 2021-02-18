
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
