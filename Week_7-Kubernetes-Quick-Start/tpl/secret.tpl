apiVersion: v1
kind: Secret
metadata:
  name: {{ .Release.Name }}-secret
type: Opaque 
data:
  POSTGRES_PASSWORD: ${password}
