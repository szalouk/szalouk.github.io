#!/usr/bin/env bash
# Build the résumé PDF linked from the CV page: _cv/cv.tex -> assets/pdf/cv.pdf
# Needs tectonic (https://tectonic-typesetting.github.io), which fetches the LaTeX
# packages it needs on first use. The deploy workflow runs this before the site build.
set -euo pipefail
cd "$(dirname "$0")/.."

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

tectonic --outdir "$tmp" _cv/cv.tex
mv "$tmp/cv.pdf" assets/pdf/cv.pdf
echo "built assets/pdf/cv.pdf"
