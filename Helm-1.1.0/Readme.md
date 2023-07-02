
### Helm Commands:

* **Helm template command:** 
  * To validate values file before deployment, run the helm template command & generate the yaml file. Then review the generated manifests for the config changes correctly reflecting or not. Post-validation, please run the `helm upgrade` command to deploy the application.

````bash
# Syntax: 
$ helm template <release_name> helm-1.1.0 -n <namespace>  \
  -f deployment-values/<release_name>/<release_name>-<env>-values.yaml \
  > <release_name>-template.yaml

# Example:
$ helm template aggregator-service helm-1.1.0 -n duke-dit  \
  -f deployment-values/aggregator-service/aggregator-service-dit-values.yaml \
  > aggregator-service-template.yaml

````

* **Helm upgrade command:**
```bash
# Syntax: 
$ helm upgrade <release_name> helm-1.1.0 \
  -n <namespace> --install \
  -f deployment-values/<release_name>/<release_name>-<env>-values.yaml
$ 
# Example:
$ helm upgrade aggregator-service helm-1.1.0 \
  -n duke-dit --install \
  -f deployment-values/aggregator-service/aggregator-service-dit-values.yaml

```


### Future Enhancements:

* Environment variables (`env:`), (`envFrom:`) we need to add configmap & secret names has to be dynamically added --> `[DONE]`
* Ports has to be updated with `Range` operator. 
* Release Name should be used, instead of `.Values.name` for applications.
* Update secret values into git secret & reference for all the applications.

