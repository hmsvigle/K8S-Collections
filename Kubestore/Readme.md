
## 1. Generate report for a Tenant

*  Generate manifest file for whole cluster & Then generate Report

```sh
$ kubectl api-resources --verbs=list --namespaced -o name | \ 
  xargs -n1 -I{} bash -c "kubectl get {} --all-namespaces -oyaml && echo ---"  >>  chaos-eng-cluster.yaml
$ kubectl-score score   chaos-eng-cluster.yaml
```
* `human` format output

![image](https://git.daimler.com/storage/user/3406/files/a6a4c700-396c-11eb-9b40-e932873f75bf)


## 2. Organize the output format.

 There are 3 output formats for kube-score. 
  * `human` : Default
  * `json` : Json 
  * `ci` :  In a format, that Output is easier to be parsed by other programs.
  
  2.1  `ci` format for resources of `default namespace`
  
  ```sh
   $ kubectl api-resources --verbs=list --namespaced -o name | \
      xargs -n1 -I{} bash -c "kubectl get {} -oyaml && echo ---" >> chaos-eng-default-ns.yaml
  # Check kubernetes resources in default namespace.
   $ kubectl get all
     NAME        READY   STATUS    RESTARTS   AGE
     pod/nginx   1/1     Running   0          4d

     NAME                 TYPE        CLUSTER-IP   EXTERNAL-IP   PORT(S)   AGE
     service/kubernetes   ClusterIP   100.64.0.1   <none>        443/TCP   6d23h

     NAME              COMPLETIONS   DURATION   AGE
     job.batch/hello   1/1           6s         6d23h

   
   $ kubectl score chaos-eng-default-ns.yaml -o ci

  ```
  
  
![image](https://git.daimler.com/storage/user/3406/files/ffc12a80-396d-11eb-8a3e-3300b73f4d8c)


  2.2 `Json` format output for the `default namespace`
  
  ![image](https://git.daimler.com/storage/user/3406/files/bcb38700-396e-11eb-9293-0beea95c196e)
