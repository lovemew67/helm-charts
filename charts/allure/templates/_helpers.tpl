{{/*
Expand the name of the chart.
*/}}
{{- define "allure.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "allure.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "allure.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "allure.labels" -}}
helm.sh/chart: {{ include "allure.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
API Common labels
*/}}
{{- define "allure-api.labels" -}}
helm.sh/chart: {{ include "allure.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
UI Common labels
*/}}
{{- define "allure-ui.labels" -}}
helm.sh/chart: {{ include "allure.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
