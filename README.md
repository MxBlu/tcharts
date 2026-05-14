# TrueNAS SCALE 23.10 Starter Catalog

This repository is a minimal custom catalog starter for TrueNAS SCALE 23.10.x.

## Included app

- `hello-truenas`: a simple `traefik/whoami` Helm app to verify your catalog works.

## Catalog validation

This repo validates catalog changes automatically in GitHub Actions using
[`MxBlu/catalog_validation`](https://github.com/MxBlu/catalog_validation).

- Workflow: `.github/workflows/catalog-validation.yml`
- Runs on pull requests and pushes to `main`
- Command used: `catalog_validate validate --path <repo-root>`

Run locally:

```bash
python -m pip install "git+https://github.com/MxBlu/catalog_validation.git"
bash scripts/validate-catalog.sh
```

## Required metadata

TrueNAS SCALE 23.10 expects a top-level `catalog.json` file.
This starter includes it and points at the `hello-truenas` app.

## Catalog structure

The `charts` directory is the app location in this starter.

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
