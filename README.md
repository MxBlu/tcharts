# TrueNAS SCALE 23.10 Starter Catalog

This repository is a minimal custom catalog starter for TrueNAS SCALE 23.10.x.

## Included app

- `hello-truenas`: a simple `traefik/whoami` Helm app to verify your catalog works.

## Required metadata

TrueNAS SCALE 23.10 expects a top-level `catalog.json` file.
This starter includes it and points at the `hello-truenas` app.

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
catalog.json
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
