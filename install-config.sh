#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="${HOME}"

echo "installing to ${HOME_DIR}"

mkdir -p "${HOME_DIR}/.config"

shopt -s dotglob
for item in "${REPO_DIR}"/.*; do
    name="$(basename "$item")"
    [[ "$name" == "." || "$name" == ".." || "$name" == ".git" || "$name" == ".config" ]] && continue
    cp -rf "$item" "${HOME_DIR}/"
done
shopt -u dotglob

if [[ -d "${REPO_DIR}/.config" ]]; then
    cp -rf "${REPO_DIR}/.config/"* "${HOME_DIR}/.config/"
fi

rm -f "${HOME_DIR}/README.md" "${HOME_DIR}/README.MD"

echo "complete"

