# Helm Syntaxes & Examples

## Range:

## 1. Example: Range Example for Service port & ports section in deployment.yaml
**`Config file:- Output`**
````yaml
  ports:
  - name: 8017-tcp
    protocol: TCP
    port: 8017
    targetPort: 8017
  - name: 8018-tcp
    protocol: TCP
    port: 8018
    targetPort: 8018
````

**`Values.yaml:`**
````yaml
ports:
  - containerPort: 8017
    protocol: TCP
  - containerPort: 8018
    protocol: TCP
````

**`Template yaml: Parsging syntax`**
  * Service.yaml
````yaml
  ports:
  {{- range .Values.ports }}
  - name: {{ .containerPort }}-tcp
    protocol: {{ .protocol }}
    port: {{ .containerPort }}
    targetPort: {{ .containerPort }}
  {{- end }}
````
* Deployment.yaml
````yaml
        ports:
        {{- toYaml .Values.ports | nindent 8 }}
````
## 2. Example:

