# How to Add a New Helm Chart to This TrueNAS Catalog

Use this when your Helm chart is already written and you want to publish it in this repo.

1. Choose app name and version
   - App path: `charts/<app-name>/`
   - Version path: `charts/<app-name>/<semver>/` (example: `1.2.3`)

2. Add the chart contents into the version directory
   - Put `Chart.yaml` and templates under `charts/<app-name>/<version>/`
   - Include TrueNAS files in the same version dir:
     - `app-readme.md`
     - `ix_values.yaml`
     - `questions.yaml`

3. Add app-level metadata file
   - Create `charts/<app-name>/item.yaml`
   - Include at least: `categories`, `tags`
   - Optionally include: `icon_url`

4. Create `charts/<app-name>/app_versions.json` (required)
   - Top-level key should be version, for example: `"1.2.3"`
   - Inside that version object include required fields:
     - `healthy`
     - `supported`
     - `healthy_error`
     - `location` (must start with `/`, example: `/charts/<app-name>/1.2.3`)
     - `last_update`
     - `required_features` (use `[]` unless needed)
     - `human_version`
     - `version`
     - `chart_metadata`
     - `app_metadata` (often `null`)
     - `schema`

5. Populate `chart_metadata`
   - Copy values from `Chart.yaml` (`name`, `description`, `version`, `appVersion`, etc.)
   - Keep fields aligned with the actual chart version you are publishing

6. Populate `schema`
   - Convert `questions.yaml` structure to JSON under `schema`
   - Include `groups` and `questions`
   - Keep defaults/types in sync with `ix_values.yaml`

7. Register app in top-level `catalog.json`
   - Add/update `charts.<app-name>` object
   - Include core fields:
     - `name`, `title`, `description`, `location`
     - `latest_version`, `latest_app_version`, `latest_human_version`
     - `categories`, `tags`, `icon_url`, `maintainers`, `sources`
     - `healthy`, `healthy_error`, `recommended`, `last_update`
     - `app_readme` (HTML string)
