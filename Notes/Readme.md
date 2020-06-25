
# check apiVersion of deployed components.
```sh
  $ kubectl get netpol -o=jsonpath='{range .items[*]}{.metadata.name}{"\t"}{"\t"}{.apiVersion} {"\n"} {end}'
```

