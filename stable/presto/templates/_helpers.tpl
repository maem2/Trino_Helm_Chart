{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "trino.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "trino.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "trino.coordinator" -}}
{{ template "trino.fullname" . }}-coordinator
{{- end -}}

{{- define "trino.worker" -}}
{{ template "trino.fullname" . }}-worker
{{- end -}}

{{- define "trino.hive" -}}
{{ template "trino.fullname" . }}-hive
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "trino.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "trino.jmx-exporter" -}}
{{ template "trino.fullname" . }}-jmx-exporter
{{- end -}}

{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "alluxio.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "alluxio.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "alluxio.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "alluxio.jobWorker.resources" -}}
resources:
  limits:
    {{- if .Values.jobWorker.resources.limits }}
      {{- if .Values.jobWorker.resources.limits.cpu  }}
    cpu: {{ .Values.jobWorker.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.jobWorker.resources.limits.memory  }}
    memory: {{ .Values.jobWorker.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.jobWorker.resources.requests }}
      {{- if .Values.jobWorker.resources.requests.cpu  }}
    cpu: {{ .Values.jobWorker.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.jobWorker.resources.requests.memory  }}
    memory: {{ .Values.jobWorker.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.worker.resources" -}}
resources:
  limits:
    {{- if .Values.worker.resources.limits }}
      {{- if .Values.worker.resources.limits.cpu  }}
    cpu: {{ .Values.worker.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.worker.resources.limits.memory  }}
    memory: {{ .Values.worker.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.worker.resources.requests }}
      {{- if .Values.worker.resources.requests.cpu  }}
    cpu: {{ .Values.worker.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.worker.resources.requests.memory  }}
    memory: {{ .Values.worker.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.master.resources" -}}
resources:
  limits:
    {{- if .Values.master.resources.limits }}
      {{- if .Values.master.resources.limits.cpu  }}
    cpu: {{ .Values.master.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.master.resources.limits.memory  }}
    memory: {{ .Values.master.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.master.resources.requests }}
      {{- if .Values.master.resources.requests.cpu  }}
    cpu: {{ .Values.master.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.master.resources.requests.memory  }}
    memory: {{ .Values.master.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.jobMaster.resources" -}}
resources:
  limits:
    {{- if .Values.jobMaster.resources.limits }}
      {{- if .Values.jobMaster.resources.limits.cpu  }}
    cpu: {{ .Values.jobMaster.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.jobMaster.resources.limits.memory  }}
    memory: {{ .Values.jobMaster.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.jobMaster.resources.requests }}
      {{- if .Values.jobMaster.resources.requests.cpu  }}
    cpu: {{ .Values.jobMaster.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.jobMaster.resources.requests.memory  }}
    memory: {{ .Values.jobMaster.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}



{{- define "alluxio.journal.format.resources" -}}
resources:
  limits:
    {{- if .Values.journal.format.resources.limits }}
      {{- if .Values.journal.format.resources.limits.cpu  }}
    cpu: {{ .Values.journal.format.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.journal.format.resources.limits.memory  }}
    memory: {{ .Values.journal.format.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.journal.format.resources.requests }}
      {{- if .Values.journal.format.resources.requests.cpu  }}
    cpu: {{ .Values.journal.format.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.journal.format.resources.requests.memory  }}
    memory: {{ .Values.journal.format.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.master.secretVolumeMounts" -}}
  {{- range $key, $val := .Values.secrets.master }}
            - name: secret-{{ $key }}-volume
              mountPath: /secrets/{{ $val }}
              readOnly: true
  {{- end }}
{{- end -}}

{{- define "alluxio.worker.secretVolumeMounts" -}}
  {{- range $key, $val := .Values.secrets.worker }}
            - name: secret-{{ $key }}-volume
              mountPath: /secrets/{{ $val }}
              readOnly: true
  {{- end -}}
{{- end -}}



{{- define "alluxio.worker.tieredstoreVolumeMounts" -}}
  {{- if .Values.tieredstore.levels }}
    {{- range .Values.tieredstore.levels }}
      {{- /* The mediumtype can have multiple parts like MEM,SSD */}}
      {{- if .mediumtype }}
        {{- /* Mount each part */}}
        {{- if contains "," .mediumtype }}
          {{- $type := .type }}
          {{- $path := .path }}
          {{- $parts := splitList "," .mediumtype }}
          {{- range $i, $val := $parts }}
            {{- /* Example: For path="/tmp/mem,/tmp/ssd", mountPath resolves to /tmp/mem and /tmp/ssd */}}
            - mountPath: {{ index ($path | splitList ",") $i }}
              name: {{ $val | lower }}-{{ $i }}
          {{- end}}
        {{- /* The mediumtype is a single value. */}}
        {{- else}}
            - mountPath: {{ .path }}
              name: {{ .mediumtype | replace "," "-" | lower }}
        {{- end}}
      {{- end}}
    {{- end}}
  {{- end}}
{{- end -}}

{{- define "alluxio.worker.otherVolumeMounts" -}}
  {{- range .Values.mounts }}
            - name: "{{ .name }}"
              mountPath: "{{ .path }}"
  {{- end }}
{{- end -}}

{{- define "alluxio.worker.tieredstoreVolumes" -}}
  {{- if .Values.tieredstore.levels }}
    {{- range .Values.tieredstore.levels }}
      {{- if .mediumtype }}
        {{- /* The mediumtype can have multiple parts like MEM,SSD */}}
        {{- if contains "," .mediumtype }}
          {{- $parts := splitList "," .mediumtype }}
          {{- $type := .type }}
          {{- $path := .path }}
          {{- $volumeName := .name }}
          {{- /* A volume will be generated for each part */}}
          {{- range $i, $val := $parts }}
            {{- /* Example: For mediumtype="MEM,SSD", mediumName resolves to mem-0 and ssd-1 */}}
            {{- $mediumName := printf "%v-%v" (lower $val) $i }}
            {{- if eq $type "hostPath"}}
        - hostPath:
            path: {{ index ($path | splitList ",") $i }}
            type: DirectoryOrCreate
          name: {{ $mediumName }}
            {{- else if eq $type "persistentVolumeClaim" }}
        - name: {{ $mediumName }}
          persistentVolumeClaim:
            {{- /* Example: For volumeName="/tmp/mem,/tmp/ssd", claimName resolves to /tmp/mem and /tmp/ssd */}}
            claimName: {{ index ($volumeName | splitList ",") $i }}
            {{- else }}
        - name: {{ $mediumName }}
          emptyDir:
            medium: "Memory"
              {{- if .quota }}
            sizeLimit: {{ .quota }}
              {{- end}}
            {{- end}}
          {{- end}}
        {{- /* The mediumtype is a single value like MEM. */}}
        {{- else}}
          {{- $mediumName := .mediumtype | lower }}
          {{- if eq .type "hostPath"}}
        - hostPath:
            path: {{ .path }}
            type: DirectoryOrCreate
          name: {{ $mediumName }}
          {{- else if eq .type "persistentVolumeClaim" }}
        - name: {{ $mediumName }}
          persistentVolumeClaim:
            claimName: {{ .name }}
          {{- else }}
        - name: {{ $mediumName }}
          emptyDir:
            medium: "Memory"
            {{- if .quota }}
            sizeLimit: {{ .quota }}
            {{- end}}
          {{- end}}
        {{- end}}
      {{- end}}
    {{- end}}
  {{- end}}
{{- end -}}

{{- define "alluxio.worker.secretVolumes" -}}
  {{- range $key, $val := .Values.secrets.worker }}
        - name: secret-{{ $key }}-volume
          secret:
            secretName: {{ $key }}
            defaultMode: 256
  {{- end }}
{{- end -}}

{{- define "alluxio.worker.shortCircuit.volume" -}}
  {{- if eq .Values.shortCircuit.volumeType "hostPath" }}
        - name: alluxio-domain
          hostPath:
            path: {{ .Values.shortCircuit.hostPath }}
            type: DirectoryOrCreate
  {{- else }}
        - name: alluxio-domain
          persistentVolumeClaim:
            claimName: "{{ .Values.shortCircuit.pvcName }}"
  {{- end }}
{{- end -}}


{{- define "alluxio.hostAliases" -}}
hostAliases:
{{- range .Values.hostAliases }}
- ip: {{ .ip }}
  hostnames:
  {{- range .hostnames }}
  - {{ . }}
  {{- end }}
{{- end }}
{{- end -}}

{{- define "alluxio.imagePullSecrets" -}}
imagePullSecrets:
{{- range $name := .Values.imagePullSecrets }}
  - name: {{ $name }}
{{- end -}}
{{- end -}}


{{- define "alluxio.fullname" -}}
{{- if .Values.alluxio.fullnameOverride -}}
{{- .Values.alluxio.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := .Values.alluxio.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "alluxio.worker.shortCircuit.volume" -}}
  {{- if eq .Values.alluxio.shortCircuit.volumeType "hostPath" }}
        - name: alluxio-domain
          hostPath:
            path: {{ .Values.alluxio.shortCircuit.hostPath }}
            type: DirectoryOrCreate
  {{- else }}
        - name: alluxio-domain
          persistentVolumeClaim:
            claimName: "{{ .Values.alluxio.shortCircuit.pvcName }}"
  {{- end }}
{{- end -}}

{{- define "alluxio.worker.resources" -}}
resources:
  limits:
    {{- if .Values.alluxio.worker.resources.limits }}
      {{- if .Values.alluxio.worker.resources.limits.cpu  }}
    cpu: {{ .Values.alluxio.worker.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.alluxio.worker.resources.limits.memory  }}
    memory: {{ .Values.alluxio.worker.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.alluxio.worker.resources.requests }}
      {{- if .Values.alluxio.worker.resources.requests.cpu  }}
    cpu: {{ .Values.alluxio.worker.resources.requests.cpu }}
      {{- end }}Ma
      {{- if .Values.alluxio.worker.resources.requests.memory  }}
    memory: {{ .Values.alluxio.worker.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.jobWorker.resources" -}}
resources:
  limits:
    {{- if .Values.alluxio.jobWorker.resources.limits }}
      {{- if .Values.alluxio.jobWorker.resources.limits.cpu  }}
    cpu: {{ .Values.alluxio.jobWorker.resources.limits.cpu }}
      {{- end }}
      {{- if .Values.alluxio.jobWorker.resources.limits.memory  }}
    memory: {{ .Values.alluxio.jobWorker.resources.limits.memory }}
      {{- end }}
    {{- end }}
  requests:
    {{- if .Values.alluxio.jobWorker.resources.requests }}
      {{- if .Values.alluxio.jobWorker.resources.requests.cpu  }}
    cpu: {{ .Values.alluxio.jobWorker.resources.requests.cpu }}
      {{- end }}
      {{- if .Values.alluxio.jobWorker.resources.requests.memory  }}
    memory: {{ .Values.alluxio.jobWorker.resources.requests.memory }}
      {{- end }}
    {{- end }}
{{- end -}}

{{- define "alluxio.worker.tieredstoreVolumeMounts" -}}
  {{- if .Values.alluxio.tieredstore.levels }}
    {{- range .Values.alluxio.tieredstore.levels }}
      {{- /* The mediumtype can have multiple parts like MEM,SSD */}}
      {{- if .mediumtype }}
        {{- /* Mount each part */}}
        {{- if contains "," .mediumtype }}
          {{- $type := .type }}
          {{- $path := .path }}
          {{- $parts := splitList "," .mediumtype }}
          {{- range $i, $val := $parts }}
            {{- /* Example: For path="/tmp/mem,/tmp/ssd", mountPath resolves to /tmp/mem and /tmp/ssd */}}
            - mountPath: {{ index ($path | splitList ",") $i }}
              name: {{ $val | lower }}-{{ $i }}
          {{- end}}
        {{- /* The mediumtype is a single value. */}}
        {{- else}}
            - mountPath: {{ .path }}
              name: {{ .mediumtype | replace "," "-" | lower }}
        {{- end}}
      {{- end}}
    {{- end}}
  {{- end}}
{{- end -}}
