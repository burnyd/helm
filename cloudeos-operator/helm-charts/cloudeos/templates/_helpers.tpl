{{- define "cloudeos.configmap" -}}
  startupconfig-data: |-
    !
    management api gnmi
       transport grpc default
    !
    ip routing
    !
    username arista secret arista
    !
    daemon TerminAttr
       exec /usr/bin/TerminAttr -ingestgrpcurl=10.90.224.175:9910 -cvcompression=gzip -ingestauth=key, -smashexcludes=ale,flexCounter,hardware,kni,pulse,strata -ingestexclude=/Sysdb/cell/1/agent,/Sysdb/cell/2/agent -ingestvrf=default -taillogs
       no shutdown
    !
{{- end -}}
