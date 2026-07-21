#!/usr/bin/env bash
set -euo pipefail

KEY="$HOME/Library/Mobile Documents/com~apple~CloudDocs/guangzhou_txy_25123.pem"
REMOTE="ubuntu@119.29.193.16"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:?Usage: ./deploy.sh /absolute/deployment/path}"

rsync -av --delete \
  --rsync-path='sudo rsync' \
  -e "ssh -i \"$KEY\" -o IdentitiesOnly=yes" \
  "${SRC_DIR}/" \
  "${REMOTE}:${DEST}/"

ssh -i "$KEY" -o IdentitiesOnly=yes "$REMOTE" "sudo chown -R www:www ${DEST}"

echo "Deployed to $DEST"
