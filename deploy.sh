#!/usr/bin/env bash
set -euo pipefail

KEY="${DEPLOY_SSH_KEY:?Set DEPLOY_SSH_KEY to a local key path}"
REMOTE="${DEPLOY_REMOTE:?Set DEPLOY_REMOTE to user@host}"
SRC_DIR="$(cd "$(dirname "$0")" && pwd)"
DEST="${1:?Usage: ./deploy.sh /absolute/deployment/path}"

rsync -av --delete \
  --rsync-path='sudo rsync' \
  -e "ssh -i \"$KEY\" -o IdentitiesOnly=yes" \
  "${SRC_DIR}/" \
  "${REMOTE}:${DEST}/"

ssh -i "$KEY" -o IdentitiesOnly=yes "$REMOTE" "sudo chown -R www:www ${DEST}"

echo "Deployed to $DEST"
