{{/*
Expand the name of the chart with a "simpledimple" prefix.
*/}}
{{- define "python_app.name" -}}
{{- $baseName := "simpledimple" }}
{{- $nameOverride := default .Chart.Name .Values.nameOverride }}
{{- printf "%s-%s" $baseName $nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name with "simpledimple" prefix.
Truncated to 63 characters as per DNS naming spec.
*/}}
{{- define "python_app.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- printf "%s-%s" "simpledimple" .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- printf "%s-%s" "simpledimple" .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s-%s" "simpledimple" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version label with "simpledimple" prefix.
*/}}
{{- define "python_app.chart" -}}
{{- printf "simpledimple-%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels with "simpledimple" naming convention.
*/}}
{{- define "python_app.labels" -}}
helm.sh/chart: {{ include "python_app.chart" . }}
{{ include "python_app.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels with "simpledimple" naming convention.
*/}}
{{- define "python_app.selectorLabels" -}}
app.kubernetes.io/name: {{ include "python_app.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use with "simpledimple" prefix.
*/}}
{{- define "python_app.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "python_app.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
