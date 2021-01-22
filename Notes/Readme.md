
 * #### Check apiVersion of deployed components.
```sh
  $ kubectl get netpol -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.apiVersion} {"\n"} {end}'
```
 * #### Get documentation for any resource.
```sh
  # Get the input details for resource field of clusterrolebinding
  $ kubectl explain clusterrolebinding.subjects
```
