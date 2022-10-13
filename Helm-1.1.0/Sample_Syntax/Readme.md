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
## 2. Example: Range nested List parsging syntax

**`Output yaml:`**
````yaml
  ports:
  - port: 8888
    targetPort: 8888
    name: "health"
  - port: 8125
    targetPort: 8125
    protocol: "UDP"
    name: "statsd"

````

**`Template.yaml:`**
````yaml
spec:
  type: {{ .Values.service.type }}
  ports:
  {{- range $objectKey, $objectValue := .Values.config.outputs }}
  {{- range $key, $value := . -}}
  {{- $tp := typeOf $value -}}
  {{- if eq $key "health" }}
  - port: {{ trimPrefix "http://:" $value.service_address | int64 }}
    targetPort: {{ trimPrefix "http://:" $value.service_address | int64 }}
    name: "health"
    {{- end }}
  {{- end }}
  {{- end }}
  {{- range $objectKey, $objectValue := .Values.config.inputs }}
  {{- range $key, $value := . -}}
    {{- $tp := typeOf $value -}}
    {{- if eq $key "http_listener" }}
  - port: {{ trimPrefix ":" $value.service_address | int64 }}
    targetPort: {{ trimPrefix ":" $value.service_address | int64 }}
    name: "http-listener"
    {{- end }}
    {{- if eq $key "statsd" }}
  - port: {{ trimPrefix ":" $value.service_address | int64 }}
    targetPort: {{ trimPrefix ":" $value.service_address | int64 }}
    protocol: "UDP"
    name: "statsd"
    {{- end }}
    {{- if eq $key "tcp-listener" }}
  - port: {{ trimPrefix ":" $value.service_address | int64 }}
    targetPort: {{ trimPrefix ":" $value.service_address | int64 }}
    name: "tcp_listener"
    {{- end }}
    {{- if eq $key "udp-listener" }}
  - port: {{ trimPrefix ":" $value.service_address | int64 }}
    targetPort: {{ trimPrefix ":" $value.service_address | int64 }}
    protocol: "UDP"
    name: "udp_listener"
    {{- end }}
    {{- if eq $key "webhooks" }}
  - port: {{ trimPrefix ":" $value.service_address | int64 }}
    targetPort: {{ trimPrefix ":" $value.service_address | int64 }}
    name: "webhooks"
    {{- end }}
  {{- end -}}
  {{- end }}
  {{- range $objectKey, $objectValue := .Values.config.outputs }}
  {{- range $key, $value := . -}}
    {{- $tp := typeOf $value -}}
    {{- if eq $key "prometheus_client" }}
  - port: {{ trimPrefix ":" $value.listen | int64 }}
    targetPort: {{ trimPrefix ":" $value.listen | int64 }}
    name: "prometheus-client"
    {{- end }}
  {{- end -}}
  {{- end }}
  selector:
    app.kubernetes.io/name: {{ include "telegraf.name" . }}
    app.kubernetes.io/instance: {{ .Release.Name }}
{{- end -}}


````
**`Values.yaml:`**
````yaml
config:
  agent:
    interval: "10s"
    round_interval: true
    metric_batch_size: 1000
    metric_buffer_limit: 10000
    collection_jitter: "0s"
    flush_interval: "10s"
    flush_jitter: "0s"
    precision: ""
    debug: false
    quiet: false
    logfile: ""
    hostname: "$HOSTNAME"
    omit_hostname: false
  processors:
    - enum:
        mapping:
          field: "status"
          dest: "status_code"
          value_mappings:
            healthy: 1
            problem: 2
            critical: 3
  outputs:
    - health:
        service_address: "http://:8888"
        compares:
          field: buffer_size
          lt: 5000.0
        contains:
          field: buffer_size
    - influxdb:
        urls:
          - "http://influxdb.monitoring.svc:8086"
        database: "telegraf"
  inputs:
    - statsd:
        service_address: ":8125"
        percentiles:
          - 50
          - 95
          - 99
        metric_separator: "_"
        allowed_pending_messages: 10000
        percentile_limit: 1000
````


