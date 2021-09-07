# oscam

![Version: 1.0.0](https://img.shields.io/badge/Version-1.0.0-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: auto](https://img.shields.io/badge/AppVersion-auto-informational?style=flat-square)

Open Source Conditional Access Module software

**Homepage:** <https://github.com/truecharts/apps/tree/master/charts/stable/oscam>

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| TrueCharts | info@truecharts.org | truecharts.org |

## Source Code

* <https://trac.streamboard.tv/oscam/browser/trunk>

## Requirements

Kubernetes: `>=1.16.0-0`

| Repository | Name | Version |
|------------|------|---------|
| https://truecharts.org | common | 6.13.7 |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| env.PGID | string | `"20"` |  |
| env.PUID | string | `"568"` |  |
| env.TZ | string | `"UTC"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/linuxserver/oscam"` |  |
| image.tag | string | `"version-11693"` |  |
| persistence.config.accessMode | string | `"ReadWriteOnce"` |  |
| persistence.config.enabled | bool | `true` |  |
| persistence.config.mountPath | string | `"/config"` |  |
| persistence.config.size | string | `"100Gi"` |  |
| persistence.config.type | string | `"pvc"` |  |
| service.main.enabled | bool | `true` |  |
| service.main.ports.main.port | int | `8888` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.5.0](https://github.com/norwoodj/helm-docs/releases/v1.5.0)