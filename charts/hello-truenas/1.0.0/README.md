# Hello TrueNAS Helm Chart

This chart deploys `traefik/whoami` as a minimal test workload for a
TrueNAS SCALE custom catalog.

## Default image

- Repository: `traefik/whoami`
- Tag: `v1.10.1`

## Service defaults

- Type: `NodePort`
- Service port: `80`
- Target port: `80`
- Node port: `30999`
