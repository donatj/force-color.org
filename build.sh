#!/bin/sh

set -e

DATE="$(date +%Y-%m-%d)"
export DATE

LIBRARIES=$(npx csv-to-markdown-table --headers < tables_libraries.tsv)
export LIBRARIES

SOFTWARE=$(npx csv-to-markdown-table --headers < tables_software.tsv)
export SOFTWARE

CONTENT="$(envsubst < index.md | npx marked --gif)"
export CONTENT

envsubst < template.html > public/index.html
