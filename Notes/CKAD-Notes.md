### 1. Create some Aliases:

```sh
alias k='kubectl'
alias kyml='kubectl -o yaml --export'
alias kgd='kubectl get deploy'
alias kgp='kubectl get po'
```
* Its `very IMP` to set this, as it will save lot of time.
```sh
export do="--dry-run=client -o yaml"
 # k get pod x $do
```
### 2. Shortcuts:

* `VIM`:
```sh
  jump_by_end-of-word: e
  jump_by_word_backward: b
  half_downwards : ctr + d
  half_upwards : ctr + u
  begining_of_line: 0
  end_of_line: $
  delete word: 
```
* `cmd`:
```sh
  ctrl + a --> to the front of line
  ctrl + e --> end of line
  ctrl + w --> delete a word
  
```
### 3. For different ns, create diff alias
### 4. Always keep backup of provided yaml file

### 5. Imp Links useful for CKAD certification
https://portal.linuxfoundation.org/portal/kubernetes
https://training.cncf.io/portal
https://www.examslocal.com/Candidate

### 6. Sometimes, direct edit of pod, doesnt work. So we need to delete the pod & recreate it 
 `kubectl replace -f deployment.yaml`
 
### 7. Shortforms 

```sh
networkpolicy -> netpol
pods -> po
nodes -> no
configmap -> cm

```

### 8. set-context/use-context for every namespace during every qn

```sh	
  $ k get ns
  $ k config get-contexts
  $ k config set-context kubernetes-admin@kubernetes --namespace=mynamespace
```

### 9. Find out fields with explain command.

```sh
$ kubectl explain pods.spec.containers --recursive
```
### 10. terminal Shortcuts:
```bash
cat > filename
  Paste content
  ctrl + d 
```

### 11. Scaling
kubectl autoscale deployment foo --min=2 --max=10           # Auto scale a deployment "foo"

### 12. Force replace, delete and then re-create the resource. 
  * Will cause a service outage.
 `kubectl replace --force -f ./updated-pod.yaml`
 
### 13. kubectl run:
*  with -it | without -it
 ```sh
  kubectl run busybox2 --image=busybox --restart=Never  --command  -it -- env
  kubectl autoscale deploy nginx --min=5 --max=10 --cpu-percent=80 # autoscale the deployment
  ```

### 14. Commands:

```bash

# generate pod yaml/Deploy Pod
k run --generator=run-pod/v1  redis --image=redis:alpine -l tier=db --restart=Never

# For deployment, apiVersion could be an issue, so best is to use "create deployment" command
k create deployment webapp --image=kodekloud/webapp-color
k run nginx1 --image=nginx --restart=Never --env=var1=val1 -n default
k run nginx --image=nginx --restart=Never --dry-run -o yaml -n default --command -- env > nginx.yaml
k run nginx --image=nginx --restart=Never --dry-run -o yaml -n default --command -it -- env > nginx.yaml

# Export is deprecated now.
 k get po -o yaml --export # export -> would give details without cluster specific information

# restart 
k run hazelcast --image=hazelcast --restart=Never \
      --port=5701 \
      --env="DNS_DOMAIN=cluster" --env="POD_NAMESPACE=default" \
      --labels="app=hazelcast,env=prod" \
      --replicas=5 \
      --serviceaccount=sa \
      -l bu=finance \
      --env="prod=dev" \
      --requests='cpu=100m,memory=256Mi' --limits='cpu=200m,memory=512Mi' \
      --dry-run \
      --command -- /bin/sh -c "echo hello-world"

 # Set service account 
  kubectl set serviceaccount deployment fe myuser
```
#### 14.1 taint & tolerations Commands
  * Tolerations can not be added with command. yaml has to be edited.

  ```
   # Taint
   kubectl taint nodes node1 key=value:NoSchedule
   # verify taint 
   k describe nodes controlplane | grep -i taint
   # Remove taint 
   
   # Tolerations
 
  ```

#### 14.2 A annotations:
 ````
 k annotate po nginx1 nginx2 nginx3 description='my description' 
  
 # Remove annotation
  k annotate po nginx1 description-

 # Multipod container
kyml run busybox --image=busybox --restart=Never --dry-run -- /bin/sh -c 'echo hello; sleep 3600' > multicont-pod.yaml
vi multicont-pod.yaml
	Update container field & remove "restart=Never"
# Run command in 2nd container of Pod
k exec -it busybox -c busybox2 -- ls 

# Logs of previous instance of pod
kubectl logs nginx -p

# Create Configmap
k create cm nginx-configuration -n ns
k create cm nginx-configuration -n ns --from-literal=key=value # from key-value pairs
k create cm nginx-configuration -n ns --from-file=configmap # configmap file contains all key value pairs
kubectl create cm configmap4 --from-file=key1=config4.txt --from-file=key2=config5.txt 

$cat configmap
enemies=aliens
lives=3
allowed="true"

&&& --> Inject configMap to pod:
````````````````````````````````
1. valueFrom -> configMapKeyRef
  env:
    - name: SPECIAL_LEVEL_KEY
      valueFrom:
        configMapKeyRef:
           name: special-config
           key: special.how
2. All configmap as Env variable:
  envFrom:
  - configMapRef:
      name: special-config
3. As Volume:

    volumeMounts:
    - mountPath: /var/cm
      name: config-volume
      readOnly: true
  volumes:
  - name: config-volume
    configMap:
      name: db-config


&&& --> SecurityContext

--> Capabilities : Its for container only. so has to be added under container


#create Service
kubectl expose deployment hello-world --type=LoadBalancer --name=my-service
# create pod & service --> --expose
kyml run nginx --image=nginx --restart=Never --port=80 --expose --dry-run > port.yaml
# headless Service 
kubectl expose deployment foo --name=foo-svc --port=6262 --target-port=8080

--> More practice on services. 
. create nodeport,headless,clusterip,lb from a deployment/pod
. Edit config & fix svc

Rolling-Update:
```````````````
kubectl rollout NAME -f FILE
# Update pods of frontend-v1 using new replication controller data in frontend-v2.json.
kubectl rollout frontend-v1 -f frontend-v2.json
kubectl rollout frontend-v1 --image=nginx:1.9.1
&&& -->
kubectl set image deployment/frontend container=image:v2         # Rolling update "container-name" containers of "frontend" deployment, updating the image
kubectl set image deployment/frontend *=image:v2 				 # update image of all containers

kubectl rollout history deployment/frontend                      # Check the history of deployments including the revision 
kubectl rollout undo deployment/frontend                         # Rollback to the previous deployment
kubectl rollout undo deployment/frontend --to-revision=2         # Rollback to a specific revision
kubectl rollout status -w deployment/frontend 
kubectl rolling-update frontend-v1 frontend-v2 --image=image:v2


Secret:
```````
kubectl create secret generic <name> --from-literal=key=value --> # Here no need to encode the values, these will be auto encrypted.

volumes: # specify the volumes
  - name: foo # this name will be used for reference inside the container
    secret: # we want a secret
      secretName: mysecret2 

  env:
      - name: SECRET_USERNAME
        valueFrom:
          secretKeyRef:
            name: mysecret
            key: username
Job:
````
kubectl run nginx --image=nginx --restart=OnFailure 
kubectl run busybox --image=busybox --restart=OnFailure -- /bin/sh -c 'echo hello;sleep 30;echo world'
# comand then give arg like below 
kubectl run busybox-test --image=busybox --restart=OnFailure  --command -- /bin/sh -c "echo hello;sleep 30;echo world"
in the pod:-
    Command: ["/bin/sh", "-c"]
    args: ["echo hello; sleep 30; echo world"]

* backoffLimit -> number of retries before OnFailure
* 

Cronjob:
`````````
kubectl run nginx --image=nginx --restart=OnFailure --schedule="30 21 * * *" -- /bin/sh -c \
"date; echo 'Hello from the Kubernetes cluster' "


&
--> Imperative command to generate ing/nw/
--> Pod with Multiple labels, resource, command, env variables, add annotation
--> unix commands like : while loop / if-else / loop / comperative operators
&&& --> job & cronjob 


kubectl run pod-name --image=nginx --restart=Never --namespace=ns   


      - env:
        - name: WORDPRESS_DB_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysql-pass
              key: password
        - name: WORDPRESS_DB_HOST
          value: wordpress-mysql
      
        envFrom:
        - configMapRef:
            name: special-config
        - secretRef:
            name: test-secret

        volumeMounts:
        - name: wordpress-persistent-storage
          mountPath: /var/www/html
      
      volumes:
      - name: wordpress-persistent-storage
        persistentVolumeClaim:
          claimName: wordpress-persistent-storage
      - name: foo 
        secret: 
          secretName: mysecret2
      

