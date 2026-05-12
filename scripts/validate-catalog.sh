#!/usr/bin/env bash

set -euo pipefail

if ! command -v catalog_validate >/dev/null 2>&1; then
  cat <<'EOF'
catalog_validate is not installed.

Install it with:
  python -m pip install "git+https://github.com/MxBlu/catalog_validation.git"

Then run this script again.
EOF
  exit 1
fi

repo_root="$(git rev-parse --show-toplevel 2>/dev/null || pwd)"
catalog_validate validate --path "$repo_root"
