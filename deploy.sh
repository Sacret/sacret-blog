#!/bin/bash
set -e

# Load environment variables
if [ -f .env ]; then
  export $(grep -v '^#' .env | xargs)
else
  echo "Error: .env file not found. Create one with DEPLOY_HOST, DEPLOY_USER, DEPLOY_PASS, DEPLOY_PATH."
  exit 1
fi

echo "==> Building site..."
npx hexo clean
npx hexo generate

echo "==> Deploying to ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}..."
sshpass -p "${DEPLOY_PASS}" rsync -avz --delete \
  public/ \
  "${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}" || RSYNC_EXIT=$?

# rsync exit code 23 = partial transfer (usually just permission warnings), treat as success
if [ "${RSYNC_EXIT:-0}" -ne 0 ] && [ "${RSYNC_EXIT:-0}" -ne 23 ]; then
  echo "Error: rsync failed with exit code ${RSYNC_EXIT}"
  exit 1
fi

echo "==> Done! Site deployed to ${DEPLOY_HOST}"
