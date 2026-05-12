# TrueNAS SCALE 23.10 Starter Catalog

This repository is a minimal custom catalog starter for TrueNAS SCALE 23.10.x.

## Included app

- `hello-truenas`: a simple `traefik/whoami` Helm app to verify your catalog works.

## Catalog structure

The `charts` directory is the train exposed in the TrueNAS UI.

```text
charts/
  hello-truenas/
    item.yaml
    1.0.0/
      Chart.yaml
      app-readme.md
      ix_values.yaml
      questions.yaml
      templates/
```

## Add in TrueNAS

1. Push this repo to GitHub or another reachable Git server.
2. In TrueNAS, go to `Apps` -> `Manage Catalogs` -> `Add Catalog`.
3. Use:
   - Repository: your repo URL
   - Branch: your branch (usually `main`)
   - Preferred Trains: `charts`
4. Save and wait for catalog sync.

After sync, install `hello-truenas` from the `charts` train.
