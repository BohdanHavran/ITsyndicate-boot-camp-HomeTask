apiVersion: v1
kind: ConfigMap
metadata:
  name: {{ .Release.Name }}-configmap
data:
  POSTGRES_DB: "${name}"
  POSTGRES_USER: "${user}"
  DJANGO_ALLOWED_HOSTS: "*"
  DB_IP: "${host}"
  POSTGRES_PORT: "${port}"
