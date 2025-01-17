{{/*
The Wireguard sidecar container to be inserted.
*/}}
{{- define "common.addon.wireguard.container" -}}
name: wireguard
image: "{{ .Values.wireguardImage.repository }}:{{ .Values.wireguardImage.tag }}"
imagePullPolicy: {{ .Values.wireguardImage.pullPolicy }}
{{- with .Values.addons.vpn.securityContext }}
securityContext:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- with .Values.addons.vpn.env }}
env:
{{- range $k, $v := . }}
  - name: {{ $k }}
    value: {{ $v | quote }}
{{- end }}
{{- end }}
{{- if or .Values.addons.vpn.configFile .Values.addons.vpn.scripts.up .Values.addons.vpn.scripts.down .Values.addons.vpn.additionalVolumeMounts .Values.persistence.shared.enabled }}
volumeMounts:
{{- if or .Values.addons.vpn.configFile }}
  - name: vpnconfig
    mountPath: /etc/wireguard/wg0.conf
    subPath: vpnConfigfile
{{- end }}
{{- if .Values.addons.vpn.scripts.up }}
  - name: vpnscript
    mountPath: /config/up.sh
    subPath: up.sh
{{- end }}
{{- if .Values.addons.vpn.scripts.down }}
  - name: vpnscript
    mountPath: /config/down.sh
    subPath: down.sh
{{- end }}
  - mountPath: {{ .Values.persistence.shared.mountPath }}
    name: shared
{{- end }}
{{- with .Values.addons.vpn.livenessProbe }}
livenessProbe:
  {{- toYaml . | nindent 2 }}
{{- end -}}
{{- with .Values.addons.vpn.resources }}
resources:
  {{- toYaml . | nindent 2 }}
{{- end }}
{{- end -}}
