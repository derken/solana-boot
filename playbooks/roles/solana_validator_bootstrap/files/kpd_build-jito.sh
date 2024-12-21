#!/bin/bash

TAG="${1:-v2.0.15-jito}"
echo "TAG=$TAG"
pushd jito-solana > /dev/null

git fetch
if git tag --list | grep "$TAG"; then 
  echo "building $TAG"
  git checkout tags/"$TAG"
  git submodule update --init --recursive
  CI_COMMIT=$(git rev-parse HEAD) scripts/cargo-install-all.sh --validator-only ~/.local/share/solana/install/releases/"$TAG"
  echo "updating symlinks for active_release..."
  rm -rf "$HOME"/.local/share/solana/install/active_release
  ln -sf /home/sol/.local/share/solana/install/releases/"$TAG" "$HOME"/.local/share/solana/install/active_release
fi

popd >/dev/null
