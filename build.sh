#!/bin/sh

set -e

DATE="$(date +%Y-%m-%d)"
export DATE

CONTENT="$(envsubst < index.md | npx marked --gif)"
export CONTENT
envsubst < template.html > public/index.html
