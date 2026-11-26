#!/usr/bin/env bash
# Build dist/triz.zip for a single-skill upload (Customize > Skills).
# The archive's root entry is the skill folder itself.
set -euo pipefail
cd "$(dirname "$0")/.."
mkdir -p dist
rm -f dist/triz.zip
(cd plugins/triz/skills && zip -qr ../../../dist/triz.zip triz -x '*/__pycache__/*' '*.pyc')
echo "dist/triz.zip"
