
1. Previleged container Constraint
  * **`ConstraintTemplate`:** 
````yaml
apiVersion: templates.gatekeeper.sh/v1beta1
kind: ConstraintTemplate
metadata:
  name: k8spspprivilegedcontainer
spec:
  crd:
    spec:
      names:
        kind: K8sPSPPrivilegedContainer
  targets:
    - target: admission.k8s.gatekeeper.sh
      rego: |
        package k8spspprivileged

        violation[{"msg": msg, "details": {}}] {
            c := input_containers[_]
            c.securityContext.privileged
            msg := sprintf("Privileged container is not allowed: %v, securityContext: %v", [c.name, c.securityContext])
        }
        input_containers[c] {
            c := input.review.object.spec.containers[_]
        }
        input_containers[c] {
            c := input.review.object.spec.initContainers[_]
        }

````
  * To extend the above constraint template, the following constraint defines the scope (kinds) for the specific enforcement of this constraint template in a dryrun mode:

  ````yaml
  apiVersion: constraints.gatekeeper.sh/v1beta1
  kind: K8sPSPPrivilegedContainer
  metadata:
    name: psp-privileged-container
  spec:
    enforcementAction: dryrun
    match:
      kinds:
        - apiGroups: [""]
          kinds: ["Pod"]
  ````

